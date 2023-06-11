part of 'map_bloc.dart';

@immutable
abstract class MapState extends Equatable {}

class MapInitial extends MapState {
  List<Object?> get props => [];
}

class NewMarker extends MapState {
  NewMarker(this.markers);
  final List<Marker> markers;

  List<Object> get props => [markers];
}
