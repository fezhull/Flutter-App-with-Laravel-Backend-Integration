# Sleek Properties Management System - Flutter Frontend

This repository contains the frontend for the Property Management System (PMS) for Sleek Properties LLC. The app allows users to interact with the backend API to manage property listings. The application is built using Flutter and utilizes BLoC (Business Logic Component) for state management. This project is designed to provide an intuitive and seamless way for users to add, edit, and delete properties.

## Features

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- Fetch properties from the backend and display them in a list.
- Add properties with a form to submit data to the backend.
- Edit properties by modifying existing property details.
- Delete properties directly from the list.
- State Management using BLoC for efficient and maintainable state handling.

## Tech Stack
- Flutter: A framework to build natively compiled applications for mobile from a single codebase.
- BLoC: A pattern to manage state and business logic using streams.
- HTTP: A package used to make requests to the Laravel backend API.
- JSON: For serializing and deserializing data between the frontend and backend.

## Requirements
- Flutter: Install Flutter SDK to run the project.
- Laravel Backend: A running Laravel backend API that serves property data (Refer to the backend [README](https://github.com/yourusername/property-management-backend).
- Postman: For testing API endpoints (if needed for debugging).

## Project Setup
Follow these steps to set up and run the Flutter application locally:
## 1. Clone the Repository
## Clone this repository to your local machine:
git clone https://github.com/yourusername/property-management-flutter.git

cd property-management-flutter
## 2. Install Flutter SDK
If you don’t have Flutter installed yet, follow the installation guide for your platform from the official Flutter Documentation.

## 3. Install Dependencies
Once you have Flutter set up, install the required dependencies by running:
- flutter pub get
This will download all the necessary dependencies like http, flutter_bloc, and equatable.

## 4. Update API URL
The app communicates with a local Laravel API by default. Make sure the backend API is running at http://127.0.0.1:8000/api/properties. If your API is hosted on a different URL, update the API endpoint in the lib/cubits/property_cubit.dart file.

Search for the string http://127.0.0.1:8000/api/properties and replace it with your backend's URL.

## 5. Run the App
Ensure your Android Emulator or physical device is running, then run the Flutter application:

flutter run

The app should launch on your device/emulator.

## Screens Iu

<img width="197" alt="Screenshot 2024-12-08 174539" src="https://github.com/user-attachments/assets/b7cd6b29-0cd7-4cca-b1ce-d2a081f79eeb">


<img width="206" alt="Screenshot 2024-12-08 174626" src="https://github.com/user-attachments/assets/3ebfcef6-8a53-4a9a-b189-aacd50930df4">

<img width="203" alt="Screenshot 2024-12-08 174646" src="https://github.com/user-attachments/assets/d44156cf-1f3f-4b23-8e92-9d45120d9b57">



## Folder Structure

The app follows a clean architecture, separating the business logic, UI, and model components. Below is the folder structure:

lib/

├── cubits/

│   ├── property_cubit.dart  # BLoC logic for property management (CRUD operations)

├── models/

│   ├── property.dart            # Property model to structure data

├── screens/

│   ├── property_list_screen.dart  # Screen that lists properties

│   ├── add_property_screen.dart  # Screen for adding a new property

│   ├── edit_property_screen.dart # Screen for editing an existing property

└── main.dart                     # Main entry point of the app

## Key Files
-Property Model (lib/models/property.dart): The Property class defines the structure of the property data. 
It includes methods for converting between JSON and Dart objects.

-PropertyCubit (lib/cubits/property_cubit.dart): The BLoC pattern is implemented here to manage the state of the properties. 
It handles fetching, adding, updating, and -deleting properties by interacting with the backend API.
## Screens:

- PropertyListScreen (lib/screens/property_list_screen.dart): Displays the list of properties.

- AddPropertyScreen (lib/screens/add_property_screen.dart): A form for adding a new property.

- EditPropertyScreen (lib/screens/edit_property_screen.dart): A form for editing an existing property.

## BLoC (Business Logic Component)

## Why BLoC?

The BLoC pattern is used to separate the business logic from the UI. This provides several benefits:

- Separation of concerns: The UI and business logic are decoupled.

- Testability: Business logic can be easily tested.

- Scalability: It’s easier to scale and add more features as the project grows.

##PropertyCubit

The PropertyCubit is the heart of the application’s state management. It fetches data from the backend API, handles CRUD operations,

and updates the UI by emitting different states.

Example Usage:
/ Fetch properties

context.read<PropertyCubit>().fetchProperties();

// Add a new property

context.read<PropertyCubit>().addProperty(Property(...));

// Delete a property

context.read<PropertyCubit>().deleteProperty(propertyId);


## States of PropertyCubit:

## The PropertyCubit emits the following states:

- InitialState: When the app starts or the list is empty.

- LoadingState: When data is being fetched or an action is being performed.

- LoadedState: When the data (properties) is successfully fetched.

- ErrorState: When there’s an issue with fetching or interacting with the backend.

## API Interaction

The app communicates with the backend API using the HTTP package. Below are the API endpoints used in the app:

## API Endpoints
- GET /api/properties: Fetches a list of all properties.

- POST /api/properties: Adds a new property.

- PUT /api/properties/{id}: Updates an existing property.

- DELETE /api/properties/{id}: Deletes a property.
  
Make sure your Laravel API is running and accessible at the URL specified in the lib/cubits/property_cubit.dart file. You can use Postman to test the API and confirm it’s 

working properly.

## Testing

## Unit Testing

To ensure the app works correctly, you can write unit tests for the PropertyCubit to verify the state changes and ensure that the business logic works as expected.

## Widget Testing

Test individual widgets to verify that the UI components display the correct data and interact with the PropertyCubit as expected.

## Integration Testing

Integration tests allow you to verify that the app communicates correctly with the backend API and that the frontend and backend work together as expected.

## Contribution

Feel free to fork this repository and submit issues and pull requests. Contributions are welcome!

## License

This project is open source and available under the MIT License.

## Conclusion

This Flutter app provides an intuitive and functional interface for managing properties in the Property Management System. Using BLoC for state management, the app is 

scalable, testable, and easy to maintain. The app communicates with a Laravel backend API to manage property data, allowing for



  

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
