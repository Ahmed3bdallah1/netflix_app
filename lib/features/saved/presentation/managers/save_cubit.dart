import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/saved/presentation/managers/save_state.dart';

class SaveCubit extends Cubit<SaveState> {
  SaveCubit() : super(SaveInitial());

  static SaveCubit get(BuildContext context) => BlocProvider.of(context);

  List<Result> savedItems = [];

  void toSave({required Result result}) {
    savedItems.add(result);
    print(savedItems.length);
  }

  void outSave({required Result result}) {
    savedItems.remove(result);
  }

  bool isResultSaved({required int resultId}) {
    return savedItems.any((result) => result.id == resultId);
  }
}
