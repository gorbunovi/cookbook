import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../domain/entities/recipe_entity.dart';
import 'instruckshion_tabbar_widget.dart';
import 'package:cookbook/core/core.dart' as core;

class RecipeWidget extends StatelessWidget {
  RecipeWidget({
    Key? key,
    required this.toCatalog,
    required this.toHome,
    required this.toBack,
    required this.tapCatalog,
    required this.tapRecalculation,
    required this.tapRecalculationNetto,
    required this.tapBottomNavigationBar,
    required this.recipe,
  }) : super(key: key);

  final Function toCatalog;
  final Function toHome;
  final Function toBack;
  final Function tapRecalculation;
  final Function tapRecalculationNetto;
  final Function tapCatalog;
  final Function tapBottomNavigationBar;
  final RecipeEntity recipe;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    late bool isAutoPlay = true;
    if(recipe.photo != null){
      recipe.photo!.length > 1 ? isAutoPlay = true: isAutoPlay = false;
    }
    List<TextEditingController> controllers = [];
    TextEditingController controllerNetto = TextEditingController(
      text: recipe.weightNetto != null
          ? '${recipe.weightNetto!.toStringAsFixed(1)}г.'
          : '0.0г.',
    );
    controllerNetto.selection = TextSelection.fromPosition(
        TextPosition(offset: controllerNetto.text.length - 4));
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var imgList = [
      'assets/images/recipe/myso.jpg',
      'assets/images/recipe/fish.jpg',
      'assets/images/recipe/soup2.jpg',

    ];
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/background/back_home.png',
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 44,
            title: Text(
              recipe?.name ?? '',
              style: core.TextStyles.text18,
            ),
            leading: IconButton(
              onPressed: () => toBack(),
              icon: const Icon(
                Icons.arrow_back,
                color: core.AppColors.brow,
              ),
            ),
            centerTitle: true,
            flexibleSpace: const Image(
                image: AssetImage('assets/images/background/bac_app_bar.png'),
                fit: BoxFit.fill),
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(seconds: 3),
                        height: height * 0.4,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: isAutoPlay,
                        onPageChanged: (index, reason) {
                          // setState(() {
                          //   _current = index;
                          // });
                        }),
                    items: recipe.photo != null?
                    recipe.photo?.map((img) => Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider('$img'),
                            fit: BoxFit.fitWidth),
                      ),
                    ))
                        .toList() :
                    imgList.map((img) => Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                img),
                            fit: BoxFit.fitWidth),
                      ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                flex: 1,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  // unselectedLabelColor: Colors.cyan,
                  // isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/bac_app_bar.png'),
                        fit: BoxFit.cover),
                  ),
                  tabs: [
                    Text(
                      'Ингридиенты',
                    ),
                    Text(
                      'Приготовление',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/bac_app_bar.png'),
                        fit: BoxFit.fill),
                  ),
                  child: TabBarView(
                    children: [
                      Column(children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, left: 5),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Наименование',
                                    textAlign: TextAlign.center,
                                    style: core.TextStyles.textBrow16,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'на 1000г.',
                                    textAlign: TextAlign.center,
                                    style: core.TextStyles.textBrow16,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'В наличие',
                                    textAlign: TextAlign.center,
                                    style: core.TextStyles.textBrow16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: SafeArea(
                            child: ListView.builder(
                                itemCount: recipe.ingridients?.length?? 0,
                                itemBuilder: (context, index) {
                                  TextEditingController controller =
                                      TextEditingController(
                                          text: recipe.ingridients?[index]
                                                      .weightExisting !=
                                                  null
                                              ? (recipe.ingridients?[index]
                                                      .weightExisting)!
                                                  .toStringAsFixed(1)
                                              : '');
                                  controller.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: controller.text.length -
                                              2)); //курсор в конец строки
                                  controllers.add(controller);
                                  return Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/background/back_home.png'),
                                          fit: BoxFit.fill),
                                    ),
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(

                                            height: 30,
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                recipe.ingridients?[index]?.name ?? '',
                                                textAlign: TextAlign.center,
                                                style: core.TextStyles.text12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                recipe.ingridients![index].weight!
                                                    .toStringAsFixed(1),
                                                textAlign: TextAlign.center,
                                                style: core.TextStyles.text12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Center(
                                              child: TextFormField(
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: core.TextStyles
                                                    .textFromFieldStyle,
                                                textAlign: TextAlign.center,
                                                controller: controller,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 18),
                                                        border:
                                                            InputBorder.none),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (data) {
                                                  print(data.toString());

                                                  if (data == '') {
                                                    tapRecalculation(
                                                      recipe.ingridients?[index]
                                                          .weight,
                                                      null,
                                                      recipe,
                                                    );
                                                  } else {
                                                    tapRecalculation(
                                                      recipe.ingridients?[index]
                                                          .weight,
                                                      double.parse(data),
                                                      recipe,
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, left: 15),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Выход',
                                    textAlign: TextAlign.center,
                                    style: core.TextStyles.text18,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '1000г.',
                                    textAlign: TextAlign.center,
                                    style: core.TextStyles.textBrow16,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: core.TextStyles.textBrow16,
                                        textAlign: TextAlign.center,
                                        controller: controllerNetto,
                                        decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 17),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.number,
                                        onChanged: (data) {
                                          print(data.toString());
                                          if (data == '') {
                                            tapRecalculationNetto(
                                              null,
                                              recipe,
                                            );
                                          } else {
                                            data = data.substring(
                                                0, data.length - 2);
                                            tapRecalculationNetto(
                                              double.parse(data),
                                              recipe,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
//////////////////// Приготовление //////////////////////////////////////////////
                      InsruckshionTabbarWidget(context: context, recipe: recipe),
//////////////////// Приготовление //////////////////////////////////////////////
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/background/bac_app_bar.png'),
                    fit: BoxFit.fill),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/images/icons/shopping_basket.svg', height: 30),
                      onPressed: () => showDialog(context: context,
                        builder: (_)=> const AlertDialog(title: Text('Добавить в список покупок'),),),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/images/icons/to_pdf.svg', height: 30),
                      onPressed: () => showDialog(context: context,
                        builder: (_)=> const AlertDialog(title: Text('Сгенерирывать рецепт в PDF'),),),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/images/icons/qr_icon.svg', height: 30),
                      onPressed: () => showDialog(context: context,
                        builder: (_)=> const AlertDialog(title: Text('Считать QR код рецепта'),),),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/images/icons/help.svg', height: 30),
                      onPressed: () => showDialog(context: context,
                          builder: (_)=> AlertDialog(content: Text('${recipe.info}'),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
