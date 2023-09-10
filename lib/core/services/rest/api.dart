class Api {
  static const String baseUrl = 'https://gorbunov.website/public/api';
  static const String testUrl = 'https://gorbunov.website/public/api';
  static const String webUrl = '';
  static const supportMail = '';

  static const GetHomeCatalog = '/homeCatalog';
  static const GetAllCatalogs = '/getAllCatalogs';
  static const GetCatalog = '/catalog';
}

enum ApiType {
  prod('https://gorbunov.website/public/api', 'https://gorbunov.website', 'Production'),
  dev('https://gorbunov.website/public/dev', 'https://gorbunov.website', 'Development');

  const ApiType(this.address, this.siteAddress, this.title);

  final String address;
  final String siteAddress;
  final String title;
}