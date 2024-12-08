import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/property.dart';

class PropertyApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api/properties';

  // Fetch properties from the API
  Future<List<Property>> fetchProperties() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load properties: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load properties');
    }
  }

  // Create a new property
  Future<Property> createProperty(Property property) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': property.name,
        'address': property.address,
        'price': property.price,
        'description': property.description,
      }),
    );

    if (response.statusCode == 201) {
      return Property.fromJson(
          json.decode(response.body)); // Return the created property
    } else {
      throw Exception('Failed to create property');
    }
  }

  // Update an existing property
  Future<Property> updateProperty(Property property) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${property.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': property.name,
        'address': property.address,
        'price': property.price,
        'description': property.description,
      }),
    );

    if (response.statusCode == 200) {
      return Property.fromJson(
          json.decode(response.body)); // Return the updated property
    } else {
      throw Exception('Failed to update property');
    }
  }

  // Delete a property by its ID
  Future<void> deleteProperty(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete property');
    }
  }
}
