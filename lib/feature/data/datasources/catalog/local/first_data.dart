import 'package:cookbook/feature/data/models/catalog_model.dart';
import 'package:cookbook/feature/data/models/ingridient_model.dart';
import 'package:cookbook/feature/data/models/recipe_model.dart';

class FirstData {
  CatalogModel getCatalog() {
    CatalogModel basicRecipes = CatalogModel(
      id: 0,
      name: 'Кулинарная книга',
      photo: 'assets/images/icons/icon_test.png',
      info: '',
      catalogs: [
        CatalogModel(
          id: 0,
          name: 'Сборник рецептов',
          photo: 'assets/images/icons/icon_test.png',
          info: 'Базовые рецепты инфо',
          catalogs: [
            CatalogModel(
              id: 301,
              name: 'Соусы',
              photo: 'assets/images/icons/icon_test.png',
              info: 'Соусы',
              catalogs: [
                CatalogModel(
                    id: 3010,
                    name: 'Холодные соусы',
                    photo: 'assets/images/icons/icon_test.png',
                    info: 'Холодные соусы',
                    recipes: [
                      RecipeModel(
                          id: 30100,
                          catalogId: 12,
                          name: 'Горчица',
                          photo: ['assets/images/recipe/2.jpg'],
                          // photo: [
                          //   'assets/images/recipe/2.jpg',
                          //   'assets/images/recipe/1.jpg',
                          // ],
                          info: 'Горчица',
                          cooking: [
                            'В горячую (95 градусов) воду добовляют сахар, соль и размешивают до полного растворения.',
                            'В воду добавляют уксус, размешивают.',
                            'В емкость просеивают горчицу порошок и выливают в нее раствор полученный ранее и растительное масло',
                            'Полученную смесь тщательно перемешать - расстереть.',
                            'Накрыть емкость крышкой или пленкой и оставить на 12 часов для созревания.',
                            'Хранить полученную горчицу в емкости с плотной крышкой, чтоб не выветрилась',
                          ],
                          ingridients: [
                            IngridientModel(
                              id: 301001,
                              name: 'Горчица порошок',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 290.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Вода',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 490.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Уксус 9%',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 200.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Сахар',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 45.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Соль',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 35.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Масло растительное',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 25.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                          ])
                    ]),
              ],
            )
          ],
        ),
        CatalogModel(
          id: 100,
          name: 'Авторские рецепты',
          photo: 'assets/images/icons/icon_test.png',
          info: 'Авторские рецепты',
          catalogs: [
            CatalogModel(
              id: 101,
              name: 'Рецепты от Ириски',
              photo: 'assets/images/icons/icon_test.png',
              info: 'Рецепты от Ириски',
            )
          ],
        ),
        CatalogModel(
          id: 200,
          name: 'Рецепты с акцентом',
          photo: 'assets/images/icons/icon_test.png',
          info: 'Рецепты с акцентом',
          catalogs: [
            CatalogModel(
              id: 201,
              name: 'Рецепты с русским акцентом',
              photo: 'assets/images/icons/icon_test.png',
              info: 'Рецепты с русским акцентом',
            )
          ],
        ),
        CatalogModel(
          id: 300,
          name: 'Мои рецепты',
          photo: 'assets/images/icons/icon_test.png',
          info: 'Мои рецепты',
          catalogs: [
            CatalogModel(
              id: 301,
              name: 'Соусы',
              photo: 'assets/images/icons/icon_test.png',
              info: 'Соусы',
              catalogs: [
                CatalogModel(
                    id: 3010,
                    name: 'Холодные соусы',
                    photo: 'assets/images/icons/icon_test.png',
                    info: 'Холодные соусы',
                    recipes: [
                      RecipeModel(
                          id: 30100,
                          catalogId: 21,
                          name: 'Горчица',
                          photo: ['assets/images/recipe/2.jpg'],
                          // photo: [
                          //   'assets/images/recipe/2.jpg',
                          //   'assets/images/recipe/1.jpg',
                          // ],
                          info: 'Горчица',
                          cooking: [
                            'В горячую (95 градусов) воду добовляют сахар, соль и размешивают до полного растворения.',
                            'В воду добавляют уксус, размешивают.',
                            'В емкость просеивают горчицу порошок и выливают в нее раствор полученный ранее и растительное масло',
                            'Полученную смесь тщательно перемешать - расстереть.',
                            'Накрыть емкость крышкой или пленкой и оставить на 12 часов для созревания.',
                            'Хранить полученную горчицу в емкости с плотной крышкой, чтоб не выветрилась',
                          ],
                          ingridients: [
                            IngridientModel(
                              id: 301001,
                              name: 'Горчица порошок',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 290.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Вода',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 490.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Уксус 9%',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 200.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Сахар',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 45.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Соль',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 35.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                            IngridientModel(
                              id: 30101,
                              name: 'Масло растительное',
                              photo: 'assets/images/icons/icon_test.png',
                              info: '',
                              recipeId: 0,
                              weight: 25.0,
                              weightExisting: 0.0,
                              weightPortion: 0.0,
                            ),
                          ])
                    ]),
              ],
            )
          ],
        )
      ],
    );

    return basicRecipes;
  }
}
