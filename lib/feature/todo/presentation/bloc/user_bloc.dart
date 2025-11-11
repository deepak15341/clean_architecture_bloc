import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/feature/todo/presentation/bloc/user_event.dart';
import 'package:todo/feature/todo/presentation/bloc/user_state.dart';
import '../../domain/usecase/get_users.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsersUseCase;

  UserBloc(this.getUsersUseCase) : super(UserInitial()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await getUsersUseCase();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError("Failed to load users"));
      }
    });
  }
}
