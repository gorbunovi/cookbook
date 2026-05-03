// import 'package:dartz/dartz.dart';
//
// import '../../../core/error/failure.dart';
// import '../../domain/entities/catalog_node.dart';
// import '../../domain/repositories/catalog_repository.dart';
//
// import '../datasources/catalog_local_data_source.dart';
// import '../models/catalog_model.dart';
//
//
//
// class CatalogRepositoryImpl implements CatalogRepository {
//
//   final CatalogLocalDataSource local;
//
//   CatalogRepositoryImpl(this.local);
//
//   @override
//   Future<Either<Failure, CatalogEntity>> getHomeCatalog() async {
//
//     try {
//       final list = await local.getCatalogs();
//
//       /// 🌳 строим дерево
//       final root = _buildTree(list);
//
//       return Right(root);
//
//     } catch (e) {
//       return Left(CacheFailure(e.toString()));
//     }
//   }
//
//   CatalogEntity _buildTree(List<CatalogModel> list) {
//
//     final root = list.firstWhere((e) => e.parentId == null);
//
//     List<CatalogEntity> children(int id) {
//       return list
//           .where((e) => e.parentId == id)
//           .map((e) => CatalogEntity(
//         id: e.id,
//         parentId: e.parentId,
//         name: e.name,
//         catalogs: children(e.id),
//       ))
//           .toList();
//     }
//
//     return CatalogEntity(
//       id: root.id,
//       parentId: root.parentId,
//       name: root.name,
//       catalogs: children(root.id),
//     );
//   }
// }