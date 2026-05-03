// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../core/network/rest_service.dart';
// import '../../core/db/database_service.dart';
// import '../../core/cache/hive_service.dart';
//
// class InitialBinding extends Bindings {
//   @override
//   void dependencies() async {
//
//     /// 🌐 HTTP клиент
//     Get.put(http.Client());
//
//     /// 🌐 REST
//     Get.put(RestService(client: Get.find()));
//
//     /// 💾 SQLite
//     final db = await DatabaseService().init();
//     Get.put(db);
//
//     /// 🧠 Hive
//     final hive = await HiveService().init();
//     Get.put(hive);
//   }
// }