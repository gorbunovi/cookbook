import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/core/core.dart' as core;

Widget InsruckshionTabbarWidget(
    {required BuildContext context, RecipeEntity? recipe}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/background/bac_app_bar.png'),
          fit: BoxFit.fill),
    ),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 20,
              child: Text(
                'ПРИГОТОВЛЕНИЕ',
                style: core.TextStyles.textBrow16,
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              child: recipe?.cooking == null
                  ? SizedBox.fromSize()
                  : ListView.builder(
                      itemCount: recipe!.cooking?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 5,right: 20,bottom: 10,left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Text('${index+1}',
                                  style: core.TextStyles.text12,
                                  ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Text(recipe.cooking?[index] ?? '',
                                  textAlign: TextAlign.justify,
                                  style: core.TextStyles.text12,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
}
