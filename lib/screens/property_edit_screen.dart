import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/property_bloc.dart';
import '../bloc/property_event.dart';
import '../models/property.dart';

class PropertyEditScreen extends StatefulWidget {
  final Property property;

  PropertyEditScreen({required this.property});

  @override
  _PropertyEditScreenState createState() => _PropertyEditScreenState();
}

class _PropertyEditScreenState extends State<PropertyEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the controllers with the existing property details
    nameController.text = widget.property.name;
    addressController.text = widget.property.address;
    priceController.text = widget.property.price.toString();
    descriptionController.text = widget.property.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        elevation: 0,
        title: const Text('Edit Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading Text
              Text(
                'Update Property Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
              ),
              const SizedBox(height: 20),

              // Property Name Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Property Name',
                    labelStyle: TextStyle(color: Colors.deepPurple[600]),
                    hintText: 'Enter property name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Address Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.deepPurple[600]),
                    hintText: 'Enter property address',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Price Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Colors.deepPurple[600]),
                    hintText: 'Enter property price',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Description Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.deepPurple[600]),
                    hintText: 'Enter description',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Update Button
              Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple[600]!,
                        Colors.deepPurple[800]!
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Validate input fields before proceeding
                      if (nameController.text.isEmpty ||
                          addressController.text.isEmpty ||
                          priceController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please fill in all required fields')));
                        return;
                      }

                      // Create a property object with updated details
                      final updatedProperty = Property(
                        id: widget.property.id, // Retain the original ID
                        name: nameController.text,
                        address: addressController.text,
                        price: double.tryParse(priceController.text) ?? 0.0,
                        description: descriptionController.text,
                      );

                      // Dispatch UpdatePropertyEvent to the PropertyBloc
                      BlocProvider.of<PropertyBloc>(context)
                          .add(UpdatePropertyEvent(updatedProperty));

                      // Optionally, navigate back to the property list screen after update
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Update Property",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
