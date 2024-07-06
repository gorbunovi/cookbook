import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/core/core.dart' as core_widgets;

class CardCatalogWidget extends StatelessWidget {
  const CardCatalogWidget({
    Key? key,
    this.catalog,
    this.recipe,
    this.catalogList,
    required this.onTap,
  }) : super(key: key);

  final RecipeEntity? recipe;
  final CatalogEntity? catalog;
  final CatalogEntity? catalogList;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double _sizePhoto = MediaQuery.of(context).size.height*0.14;
    return GestureDetector(
      onTap: () {
        if (catalog?.recipes != null) {
        } else if (catalog?.catalogs != null) {
        } else {
          print('ERROR');
        }
      },
      child: GestureDetector(
        onTap: () => onTap(catalog),
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

                    child: catalog?.id == 29? core_widgets.CacheImageWidget(
                      height: _sizePhoto,
                      imageUrl: '${catalog?.photo}',
                    )
                        :Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background/bac_app_bar.png'),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          catalog?.photo != null ?
                          catalog?.id == 29?
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            height: _sizePhoto,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),),
                          )
                              :
                          core_widgets.CacheImageWidget(
                            height: _sizePhoto,
                            imageUrl: '${catalog?.photo}',
                          ):
                          Image.asset('assets/images/icons/icon_test.png',
                            // fit: BoxFit.fitWidth,
                            height:  _sizePhoto*0.7,
                            // width: _sizePhoto,
                          ),
                          // const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(left: 5,right: 5, top: 2),
                            child: catalog?.id != 29?
                            Text(
                              catalog?.name ?? '',
                              style: TextStyle(
                                fontSize: catalog!.name!.length < 15 ? 15
                                    : catalog!.name!.length < 20 ? 14
                                    : catalog!.name!.length < 25 ? 13
                                    : 12,
                                color: const Color(0xff322316),
                              ),
                              textAlign: TextAlign.center,
                            ):
                            const Padding(padding: EdgeInsets.zero),
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
