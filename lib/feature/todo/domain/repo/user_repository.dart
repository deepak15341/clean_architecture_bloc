import 'package:news/feature/todo/domain/entities/user.dart';

abstract class UserRepository{
  Future <List<User>> getUsers();
}