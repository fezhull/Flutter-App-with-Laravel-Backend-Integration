import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/property_bloc.dart';
import '../bloc/property_event.dart';
import '../models/property.dart';

class PropertyCreateScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  PropertyCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Property"),
        backgroundColor: Colors.deepPurple[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading Text
              Text(
                'Enter Property Details',
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

              // Create Property Button
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
          final property = Property(
            id: 0, // ID will be auto-assigned by the API
            name: nameController.text,
            address: addressController.text,
            price: double.tryParse(priceController.text) ?? 0.0,
            description: descriptionController.text,
          );

          // Trigger create property event
          BlocProvider.of<PropertyBloc>(context)
              .add(CreatePropertyEvent(property));

          Navigator.pop(context); // Go back after creating the property
        },
        child: const Text(
          "Create Property",
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
