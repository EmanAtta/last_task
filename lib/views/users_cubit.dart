import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()) {
    getAllData();
  }

  List<DataCompleted> AllData = [];

  bool isLoading = true;

  getAllData() async {
    emit(UsersLoading());
    try {
      AllData = await Dataservice().getDataComplted();
      isLoading = false;
      //throw Exception();
      emit(UsersSuccess());
    } catch (e) {
      print(e.toString());
      emit(UsersError());
    }
  }
}
