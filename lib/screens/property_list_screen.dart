import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/property_bloc.dart';
import '../bloc/property_event.dart';
import '../bloc/property_state.dart';
import '../services/property_api_service.dart';
import 'property_create_screen.dart';
import 'property_update_screen.dart';

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        title: const Text('Sleek Properties LLC'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            PropertyBloc(PropertyApiService())..add(LoadPropertiesEvent()),
        child: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            if (state is PropertyLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PropertyErrorState) {
              return Center(child: Text(state.message));
            }
            if (state is PropertyLoadedState) {
              final properties = state.properties;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        final property = properties[index];
                        return Card(
                          elevation: 4.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              property.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple[600],
                              ),
                            ),
                            subtitle: Text(
                              property.address,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                // Trigger delete event
                                BlocProvider.of<PropertyBloc>(context)
                                    .add(DeletePropertyEvent(property.id));
                              },
                            ),
                            onTap: () {
                              // Navigate to the update screen to edit the property
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PropertyUpdateScreen(property: property),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the property creation screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<PropertyBloc>(context),
                              child: PropertyCreateScreen(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Add Property',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
