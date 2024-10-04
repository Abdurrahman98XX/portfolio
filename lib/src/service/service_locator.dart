import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:portfolio/src/api/cache_api.dart';
import 'package:portfolio/src/api/worker_api.dart';

abstract interface class ServiceLocator {
  static final client = getIt.get<Client>();
  static final worker = getIt.get<WorkerApi>(instanceName: '1');
  static final cache = getIt.get<CacheManager>();
  //
  static final getIt = GetIt.I;
}
