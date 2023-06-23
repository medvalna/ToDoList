
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/models/persistence_manager.dart';

part 'todo_event.dart';

part 'todo_state.dart';
/*
class DBBloc {
  DBBloc() {
    getAllToDos();
  }
  final _todosController =     StreamController<List<ToDo>>.broadcast();
  get getAllToDos => _todosController.stream;

  dispose() {
    _todosController.close();
  }

  getToDos() async {
    _todosController.sink.add(await PersistenceManager.db.getAllTodos());
  }


  delete(int id) {
    PersistenceManager.db.deleteToDo(id);
    getAllToDos();
  }

  add(ToDo todo) {
    PersistenceManager.db.saveToDo(todo);
    getAllToDos();
  }
}*/
class TileListBloc extends Bloc<TileListEvents, TileListState> {
  //late PersistenceManager _manager;

  TileListBloc()
      : super(TileListState(tileList: [], doneItems: 0, showDone: true)) {
    on<AddTile>(_addTile);
    on<DeleteTile>(_deleteTile);
    on<TappedDone>(_tappedDone);
    on<ShowTiles>(_showTiles);
  }

  _showTiles(ShowTiles event, Emitter<TileListState> emit) async {
    state.tileList = await PersistenceManager.db.getAllTodos();
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showDone));
  }

  _addTile(AddTile event, Emitter<TileListState> emit) async {
    print("adding bloc");
    state.tileList.add(event.todo);
    await PersistenceManager.db.saveToDo(event.todo);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showDone));
    //state.tileList = await _manager.todos();
  }

  _deleteTile(DeleteTile event, Emitter<TileListState> emit) async {
    if (event.tile.isDone == true) {
      state.doneItems = state.doneItems - 1;
    }
    state.tileList.remove(event.tile);
    await PersistenceManager.db.deleteToDo(event.tile.id);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showDone));
  }

  _tappedDone(TappedDone event, Emitter<TileListState> emit) async {
    print("tapping");
    if (event.tile.isDone == null) {
      event.tile.isDone = true;
      state.doneItems = state.doneItems + 1;
    } else if (event.tile.isDone == true) {
      event.tile.isDone = null;
      state.doneItems = state.doneItems - 1;
    } else {
      event.tile.isDone = null;
    }
    await PersistenceManager.db.changeToDo(event.tile);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showDone));
    //state.tileList = await _manager.todos();
  }
}
