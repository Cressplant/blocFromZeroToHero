

part of 'internet_cubit.dart';





abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

// As connection package will run async func to acquire connection, set loading as initial state
// class InternetInitial extends InternetState {}
class InternetLoading extends InternetState {} 

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({this.connectionType});
}

class InternetDisconnected extends InternetState {}
