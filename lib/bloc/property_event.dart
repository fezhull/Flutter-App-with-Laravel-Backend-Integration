import 'package:equatable/equatable.dart';
import '../models/property.dart';

abstract class PropertyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPropertiesEvent extends PropertyEvent {}

class CreatePropertyEvent extends PropertyEvent {
  final Property property;

  CreatePropertyEvent(this.property);

  @override
  List<Object?> get props => [property];
}

class UpdatePropertyEvent extends PropertyEvent {
  final Property property;

  UpdatePropertyEvent(this.property);

  @override
  List<Object?> get props => [property];
}

class DeletePropertyEvent extends PropertyEvent {
  final int id;

  DeletePropertyEvent(this.id);

  @override
  List<Object?> get props => [id];
}
