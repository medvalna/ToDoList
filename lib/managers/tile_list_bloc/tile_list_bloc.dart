import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tile_list_event.dart';
part 'tile_list_state.dart';

class TileListBloc extends Bloc<TileListEvent, TileListState> {
  TileListBloc() : super(TileListInitial()) {
    on<TileListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
