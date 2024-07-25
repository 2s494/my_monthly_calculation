part of 'grafic_bloc_bloc.dart';

@immutable
 class GraficBlocState extends Equatable{
  GraficBlocState({GraficEnumStatus? status = GraficEnumStatus.loading});
  
  GraficEnumStatus? status;


  GraficBlocState copyWith(
    {
      GraficEnumStatus? status,
      
    }
  ){
    return GraficBlocState(status: status ?? this.status);
  }
  @override
  List<Object?> get props => [status];
  
 }

final class GraficBlocInitial extends GraficBlocState {

}

enum GraficEnumStatus{
  success, loading, failure
}