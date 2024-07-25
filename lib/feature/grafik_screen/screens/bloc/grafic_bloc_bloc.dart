import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'grafic_bloc_event.dart';
part 'grafic_bloc_state.dart';

class GraficBlocBloc extends Bloc<GraficBlocEvent, GraficBlocState> {
  GraficBlocBloc() : super(GraficBlocInitial()) {
    on<GraficBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
