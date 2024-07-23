import 'package:expense_tracker/features/main/presentation/bloc/home_event.dart';
import 'package:expense_tracker/features/main/presentation/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<MainEvent, MainState> {
  HomeBloc() : super(MainInitial()) {}
}
