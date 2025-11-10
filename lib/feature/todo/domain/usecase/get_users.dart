import 'package:news/feature/todo/domain/entities/user.dart';
import 'package:news/feature/todo/domain/repo/user_repository.dart';

class GetUsers{
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}