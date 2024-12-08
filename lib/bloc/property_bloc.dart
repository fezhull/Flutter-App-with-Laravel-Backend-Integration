import 'package:flutter_bloc/flutter_bloc.dart';
import 'property_event.dart';
import 'property_state.dart';
import '../services/property_api_service.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyApiService propertyApiService;

  PropertyBloc(this.propertyApiService) : super(PropertyLoadingState()) {
    on<LoadPropertiesEvent>((event, emit) async {
      emit(PropertyLoadingState());
      try {
        final properties = await propertyApiService.fetchProperties();
        emit(PropertyLoadedState(properties));
      } catch (e) {
        emit(PropertyErrorState('Failed to load properties'));
      }
    });

    on<CreatePropertyEvent>((event, emit) async {
      try {
        final property =
            await propertyApiService.createProperty(event.property);
        emit(PropertyCreatedState(property));
        add(LoadPropertiesEvent());
        add(LoadPropertiesEvent()); // Reload properties after creating one
      } catch (e) {
        emit(PropertyErrorState('Failed to create property'));
      }
    });

    on<UpdatePropertyEvent>((event, emit) async {
      try {
        final property =
            await propertyApiService.updateProperty(event.property);
        emit(PropertyUpdatedState(property));
        add(LoadPropertiesEvent()); // Reload properties after update
      } catch (e) {
        emit(PropertyErrorState('Failed to update property'));
      }
    });

    on<DeletePropertyEvent>((event, emit) async {
      try {
        await propertyApiService.deleteProperty(event.id);
        emit(PropertyDeletedState(event.id));
        add(LoadPropertiesEvent()); // Reload properties after delete
      } catch (e) {
        emit(PropertyErrorState('Failed to delete property'));
      }
    });
  }
}
