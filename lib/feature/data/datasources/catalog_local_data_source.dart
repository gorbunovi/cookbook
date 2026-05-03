// import 'package:get/get.dart';
//
// import '../models/catalog_model.dart';
//
//
// class CatalogLocalDataSource {
//
//   // final db = Get.find<DatabaseService>();
//   // final cache = Get.find<HiveService>();
//
//   /// 📥 загрузка
//   Future<List<CatalogModel>> getCatalogs() async {
//
//     /// 🔥 сначала cache
//     final cached = cache.box.get('catalog');
//
//     if (cached != null) {
//       return (cached as List)
//           .map((e) => CatalogModel.fromMap(Map<String, dynamic>.from(e)))
//           .toList();
//     }
//
//     /// fallback → SQLite
//     final data = await db.db.query('catalog');
//
//     final list = data.map((e) => CatalogModel.fromMap(e)).toList();
//
//     /// кешируем
//     cache.box.put('catalog', list.map((e) => e.toMap()).toList());
//
//     return list;
//   }
// }