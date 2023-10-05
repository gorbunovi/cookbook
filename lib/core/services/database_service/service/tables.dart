const String kDatabaseName = 'cookbookDB.db';
const String kCreateTable = 'CREATE TABLE';
const String kDropTable = 'DROP TABLE';

List<String> allTables = [
  kCatalogTable,
  kIngridientTable,
  kRecipeTable,
  kRecipeCookingTable,
  kRecipePhotoTable,
];

const String kCatalogTable = 'catalog';
const String kIngridientTable = 'ingridient';
const String kRecipeTable = 'recipe';
const String kRecipeCookingTable = 'recipe_cooking';
const String kRecipePhotoTable = 'recipe_photo';


const String kCatalogSchemes = '$kCatalogTable('
    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    'parentId INTEGER,'
    'name TEXT,'
    'photo TEXT,'
    'info TEXT)';

const String kIngridientSchemes = '$kIngridientTable('
    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    'recipeId INTEGER,'
    'name TEXT,'
    'photo TEXT,'
    'info TEXT,'
    'weight REAL,'
    'weightPortion REAL)';

const String kRecipeSchemes = '$kRecipeTable('
    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    'catalogId INTEGER,'
    'name TEXT,'
    'photo TEXT,'
    'info TEXT)';

const String kRecipeCookingSchemes = '$kRecipeCookingTable('
    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    'recipeId INTEGER,'
    'info TEXT,'
    'photo TEXT)';

const String kRecipePhotoSchemes = '$kRecipePhotoTable('
    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
    'recipeId INTEGER,'
    'info TEXT,'
    'photo TEXT)';
