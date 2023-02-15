import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/presentation/home/widgets/card_catalog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogWidget extends StatelessWidget {
  CatalogWidget({
    Key? key,
    required this.toCatalog,
    required this.toHome,
    required this.toBack,
    required this.reset,
    required this.isFilter,
    required this.tapFilter,
    required this.tapCatalog,
    // required this.tapRecipe,
    required this.tapBottomNavigationBar,
    required this.selectedIndex,
    required this.catalog,
  }) : super(key: key);

  final Function toCatalog;
  final Function toHome;
  final Function toBack;
  final Function reset;
  final bool isFilter;
  final Function tapFilter;
  final Function tapCatalog;

  // final Function tapRecipe;
  final Function tapBottomNavigationBar;
  final CatalogEntity catalog;
  int selectedIndex = 0;
  bool _isIndex = true;

  @override
  Widget build(BuildContext context) {
    catalog.name.toString().contains("Сборник рецептов") || catalog.name.toString().contains("Error")  ? _isIndex = true : _isIndex = false;
    print('${catalog.name}home -- $catalog');
    return Container(
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
              toolbarHeight: 30,
              title: Text(
                catalog?.name ?? '',
                style: const TextStyle(
                  color: Color(0xff322316),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                      onPressed: () => reset(),
                      icon: const Icon(
                        Icons.replay_outlined,
                        color: Color(0xff322316),
                      ),
                    ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/bac_app_bar.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                        height: 35,
                        width: 300,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          cursorColor: const Color(0xff322316),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white,
                            labelText: 'Поиск рецепта',
                            labelStyle:
                                const TextStyle(color: Color(0xff322316)),
                            hintText: 'Введите название рецепта',
                            hintStyle:
                                const TextStyle(color: Color(0xff322316)),
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            filled: true,
                            // helperText: 'Поиск рецепта',
                            // helperStyle: TextStyle(color: Color(0xff322316)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff322316), width: 2.0),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff322316), width: 2.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: IconButton(
                              iconSize: 20,
                              alignment: Alignment.bottomCenter,
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xff322316),
                              ),
                              onPressed: () {
                                print('press');
                              },
                            ),
                          ),
                        ),),
                  ],
                ),
              )),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: catalog.catalogs?.length ?? 0,
            itemBuilder: (context, index) {
              return CardCatalogWidget(
                catalog: catalog.catalogs![index],
                catalogList: catalog,
                onTap: tapCatalog,
              );
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background/bac_app_bar.png'),
                  fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/icons/qr_icon.svg',
                        height: 30),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        title: Text('Считать QR код рецепта'),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/icons/help.svg',
                        height: 30),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Text('${catalog.info}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
