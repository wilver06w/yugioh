import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/app/models/archetype.dart';
import 'package:yugioh/app/models/list_yugioh.dart';
import 'package:yugioh/app/screen/home/repository.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<LoadListArchetypeEvent>(_onLoadListArchetypeEvent);
    on<LoadListYugiOhByArchetypeEvent>(_onLoadListYugiOhByArchetypeEvent);
    on<OnChangeSelectedArchetypeEvent>(_onOnChangeSelectedArchetypeEvent);
    on<DeletedByArchetypeEvent>(_onDeletedByArchetypeEvent);
  }
  final Repository repository;

  Future<void> _onLoadListArchetypeEvent(
    LoadListArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingListArchetypeState(state.model));

      final listArchetype = await repository.getArchetypes();

      emit(
        LoadedListArchetypeState(
          state.model.copyWith(
            listArchetype: listArchetype,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorListArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadListYugiOhByArchetypeEvent(
    LoadListYugiOhByArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingListYuGiOhByArchetypeState(state.model));

      final listYuGiOh = await repository.getListYugiOhByArchetype(
        event.archetype.archetypeName,
      );

      emit(
        LoadedListYuGiOhByArchetypeState(
          state.model.copyWith(
            listYuGiOh: (state.model.listYuGiOh ?? [])..addAll(listYuGiOh),
            listArchetypeSelected: (state.model.listArchetypeSelected ?? [])
              ..add(
                event.archetype,
              ),
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorListYuGiOhByArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onOnChangeSelectedArchetypeEvent(
    OnChangeSelectedArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event.value) {
      add(LoadListYugiOhByArchetypeEvent(archetype: event.archetype));
    } else {
      add(DeletedByArchetypeEvent(archetype: event.archetype));
    }
  }

  Future<void> _onDeletedByArchetypeEvent(
    DeletedByArchetypeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingDeleteByArchetypeState(state.model));

      final listYuGiOhActualy = state.model.listYuGiOh;
      listYuGiOhActualy?.removeWhere(
        (element) => (element.archetype ?? '').contains(
          event.archetype.archetypeName,
        ),
      );
      final listArchetypeActualy = state.model.listArchetypeSelected;
      listArchetypeActualy?.removeWhere(
        (element) => element == event.archetype,
      );

      emit(
        LoadedDeleteByArchetypeState(
          state.model.copyWith(
            listYuGiOh: listYuGiOhActualy,
            listArchetypeSelected: listArchetypeActualy,
          ),
        ),
      );
    } catch (error) {
      emit(
        ErrorDeleteByArchetypeState(
          model: state.model,
          message: error.toString(),
        ),
      );
    }
  }
}
