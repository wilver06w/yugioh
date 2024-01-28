import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/app/models/list_yugioh.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail({
    required this.itemYuGiOh,
  }) : super(InitialState(Model(itemYugiOh: itemYuGiOh)));

  final YuGiOh itemYuGiOh;
}
