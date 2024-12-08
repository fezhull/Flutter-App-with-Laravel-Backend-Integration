import 'package:equatable/equatable.dart';
import '../models/property.dart';

abstract class PropertyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PropertyLoadingState extends PropertyState {}

class PropertyLoadedState extends PropertyState {
  final List<Property> properties;

  PropertyLoadedState(this.properties);

  @override
  List<Object?> get props => [properties];
}

class PropertyCreatedState extends PropertyState {
  final Property property;

  PropertyCreatedState(this.property);

  @override
  List<Object?> get props => [property];
}

class PropertyUpdatedState extends PropertyState {
  final Property property;

  PropertyUpdatedState(this.property);

  @override
  List<Object?> get props => [property];
}

class PropertyDeletedState extends PropertyState {
  final int propertyId;

  PropertyDeletedState(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

class PropertyErrorState extends PropertyState {
  final String message;

  PropertyErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
