import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/feature/todo/domain/repo/user_repository.dart';

import 'core/networks/api_services.dart';
import 'core/networks/interceptors.dart';
import 'feature/todo/data/data_sources/user_remote_data_source.dart';
import 'feature/todo/data/repository/user_repository_impl.dart';
import 'feature/todo/domain/usecase/get_users.dart';
import 'feature/todo/presentation/bloc/user_bloc.dart';
import 'feature/todo/presentation/pages/user_page.dart';

final di = GetIt.instance;

void main() {
  final Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  DependencyInject().init(dio);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc(di()))],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserPage(),
      ),
    );
  }
}


class DependencyInject{

  Future init(Dio dio)async{
    di.registerLazySingleton(() => ApiService(dio));
    di.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(di()));
    di.registerLazySingleton<UserRepository>(()=>UserRepositoryImpl(di()));
    di.registerLazySingleton<GetUsers>(()=>GetUsers(di()));
  }
}