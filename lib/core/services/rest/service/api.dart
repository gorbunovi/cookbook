class Api {
  static const String baseUrl = 'https://gorbunov.website/public/api/';
  static const String testUrl = 'https://gorbunov.website/public/dev/';
  static const String webUrl = '';
  static const supportMail = '';

  static const GetAllV1 = 'v1/getAll';
  static const GetCatalogV1 = 'v1/catalogs';
  static const GetRecipeV1 = 'v1/recipe';
  static const GetIngridientV1 = 'v1/ingridient';
  static const GetCooking1 = 'v1/cooking';
  static const GetPhotoV1 = 'v1/photo';
  static const SearchV1 = 'v1/search';
}

enum ApiType {
  prod('https://gorbunov.website/public/api', 'https://gorbunov.website', 'Production'),
  dev('https://gorbunov.website/public/dev', 'https://gorbunov.website', 'Development');

  const ApiType(this.address, this.siteAddress, this.title);

  final String address;
  final String siteAddress;
  final String title;
}