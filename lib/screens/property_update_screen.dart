import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/property_bloc.dart';
import '../bloc/property_event.dart';
import '../models/property.dart';

class PropertyUpdateScreen extends StatelessWidget {
  final Property property;

  PropertyUpdateScreen({super.key, required this.property});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = property.name;
    addressController.text = property.address;
    priceController.text = property.price.toString();
    descriptionController.text = property.description;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Property"),
        backgroundColor:
            Colors.deepPurple[600], // Deep Purple background for the AppBar
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
              _buildTextField(
                controller: nameController,
                label: 'Property Name',
                hint: 'Enter the property name',
              ),
              const SizedBox(height: 20),

              // Address Field
              _buildTextField(
                controller: addressController,
                label: 'Address',
                hint: 'Enter the property address',
              ),
              const SizedBox(height: 20),

              // Price Field
              _buildTextField(
                controller: priceController,
                label: 'Price',
                hint: 'Enter the property price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // Description Field
              _buildTextField(
                controller: descriptionController,
                label: 'Description',
                hint: 'Enter the property description',
                maxLines: 4,
              ),
              const SizedBox(height: 30),

              // Update Property Button
              Center(
                child: _buildSubmitButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method for creating styled TextField widgets
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
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
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.deepPurple[600]),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ),
    );
  }

  // Custom method for creating a styled submit button
  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple[600]!, Colors.deepPurple[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () {
          final updatedProperty = Property(
            id: property.id,
            name: nameController.text,
            address: addressController.text,
            price: double.tryParse(priceController.text) ?? 0.0,
            description: descriptionController.text,
          );

          // Trigger update property event
          BlocProvider.of<PropertyBloc>(context)
              .add(UpdatePropertyEvent(updatedProperty));

          Navigator.pop(context); // Go back after updating
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
    );
  }
}
