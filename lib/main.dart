import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/property_bloc.dart';
import 'services/property_api_service.dart';
import 'screens/property_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyBloc(PropertyApiService()),
      child: const MaterialApp(
        title: 'Sleek Properties LLC',
        home: PropertyListScreen(),
      ),
    );
  }
}
