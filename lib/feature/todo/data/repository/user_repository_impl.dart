import 'package:news/feature/todo/domain/repo/user_repository.dart';

import '../../domain/entities/user.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await remoteDataSource.getUsersFromApi();
  }
}
