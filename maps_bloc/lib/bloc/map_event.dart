part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class AddMarker extends MapEvent {}

class DeleteMarker extends MapEvent {}
