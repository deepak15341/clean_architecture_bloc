import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/networks/api_services.dart';

import 'core/networks/interceptors.dart';
import 'feature/todo/data/data_sources/user_remote_data_source.dart';
import 'feature/todo/data/repository/user_repository_impl.dart';
import 'feature/todo/domain/usecase/get_users.dart';
import 'feature/todo/presentation/bloc/user_bloc.dart';
import 'feature/todo/presentation/pages/user_page.dart';

void main() {
  final Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  final ApiService api = ApiService(dio);
  runApp( MyApp(api :api));
}

class MyApp extends StatelessWidget {
  final ApiService api;

   const MyApp({super.key,required this.api});

  @override
  Widget build(BuildContext context) {
    final dataSource = UserRemoteDataSourceImpl(api);
    final repository = UserRepositoryImpl(dataSource);
    final useCase = GetUsers(repository);

    return BlocProvider(
      create: (_) => UserBloc(useCase),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserPage(),
      ),
    );
  }
}
