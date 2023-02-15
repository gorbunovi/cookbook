import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';

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
    // print('catalog -${catalog.name} ${catalog}');
    // print('recipe -${recipe.name} ${recipe}');
    // print('catalogList - ${catalogList?.name??'null'}');
    return GestureDetector(
      onTap: () {
        if (catalog?.recipes != null) {
          print('recipe - ${recipe}');
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context)=> RecipePage(recipe: recipe),)
          // );
        } else if (catalog?.catalogs != null) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context)=> CatalogPage(catalog: catalog),)
          // );
        } else {
          print('ERROR');
        }
      },
      child: GestureDetector(
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

                          recipe?.photo != null ?
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                            height: _sizePhoto,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider('${recipe?.photo?[0]}'),
                                    fit: BoxFit.cover)),
                            // child: Image.network('${recipe?.photo?[0]}',
                            //   height: _sizePhoto,
                            // ),
                          ):
                          Image.asset('assets/images/icons/icon_test.png',//
                            height: _sizePhoto,
                          ),
                          recipe!.name!.length < 20 ?
                          const SizedBox(height: 20):
                          recipe!.name!.length < 35 ?
                          const SizedBox(height: 10):
                          const SizedBox(height: 0),
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
      ),
    );
  }
}
