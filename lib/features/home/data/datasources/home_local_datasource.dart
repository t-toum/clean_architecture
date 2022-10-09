// import 'package:trakref/core/models/dropdown_model/dropdown_list_model.dart';
// import 'package:trakref/core/services/cached_api_service.dart';
// import 'package:trakref/core/services/database_service.dart';

// abstract class HomeLocalDatasource {
//   Future<DropdownListModel?> fetchCachedDropdowns();
// }

// class HomeLocalDatasourceImpl extends HomeLocalDatasource {
//   final CachingAPIService cachingAPIService;
//   final DatabaseService databaseService;
//   HomeLocalDatasourceImpl({
//     required this.cachingAPIService,
//     required this.databaseService,
//   });
//   @override
//   Future<DropdownListModel> fetchCachedDropdowns() async {
//     DropdownListModel? accounts =
//         await cachingAPIService.fetchCachedDropdowns();
//     return accounts;
//   }
// }
