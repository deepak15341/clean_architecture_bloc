
import 'package:news/core/networks/api_services.dart';

import '../model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsersFromApi();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> getUsersFromApi() async {
    var response = await client.getRequest('users');

    if (response.isNotEmpty) {
      List<UserModel> model = [];
      for (var items in response){
        model.add(UserModel.fromJson(items));
      }
      return model;
    } else {
      throw Exception("Failed to load users");
    }
  }
}
