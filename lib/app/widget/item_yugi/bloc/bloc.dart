import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/app/models/list_yugioh.dart';

part 'event.dart';
part 'state.dart';

class BlocItemTask extends Bloc<ItemTaskEvent, ItemTaskState> {
  BlocItemTask({
    required this.itemTask,
  }) : super(InitialState(Model(task: itemTask))) {
    on<ChangeIsViewTraslateEvent>(_onChangeIsViewTraslateEvent);
  }
  final YuGiOh itemTask;

  Future<void> _onChangeIsViewTraslateEvent(
    ChangeIsViewTraslateEvent event,
    Emitter<ItemTaskState> emit,
  ) async {
    emit(ChangeIsViewTraslateState(
      state.model.copyWith(
        isViewTraslate: !state.model.isViewTraslate,
      ),
    ));
  }
}
