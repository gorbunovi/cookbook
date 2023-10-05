import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/core/core.dart' as core_widgets;

class CardRecipeWidget extends StatelessWidget {
  const CardRecipeWidget({
    Key? key,
    this.catalog,
    this.recipe,
    required this.onTap,
  }) : super(key: key);

  final RecipeEntity? recipe;
  final CatalogEntity? catalog;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double _sizePhoto = MediaQuery.of(context).size.height*0.14;
    return GestureDetector(
        onTap: () => onTap(recipe),
        child: Center(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            //радиус у картинки в вверху
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            // shadowColor: Colors.blueGrey,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                side: BorderSide(
                  width: 3,
                  color: Color(0xff322316),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/background/bac_app_bar.png'),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          recipe?.photo != null ?
                          core_widgets.CacheImageWidget(
                            height: _sizePhoto,
                            imageUrl: '${recipe?.photo?[0]}',
                          ):
                          Image.asset('assets/images/icons/icon_test.png',
                            height: _sizePhoto *0.7,
                          ),

                          const SizedBox(height: 10),
                          Text(
                            recipe?.name ?? '',
                            style: TextStyle(
                              fontSize: recipe!.name!.length < 30 ? 15 : 14,
                              color: const Color(0xff322316),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),

    );
  }
}
