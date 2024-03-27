import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String state;
  final String city;
  final String address;
  final String pincode;
  final String? gender;
  final List<String> selectedGarments;
  final String price;

  ConfirmationScreen({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.state,
    required this.city,
    required this.address,
    required this.pincode,
    required this.gender,
    required this.selectedGarments,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('First Name: $firstName'),
          Text('Last Name: $lastName'),
          Text('Phone Number: $phoneNumber'),
          Text('State: $state'),
          Text('City: $city'),
          Text('Address: $address'),
          Text('Pincode: $pincode'),
          Text('Gender: $gender'),
          Text('Selected Garments: ${selectedGarments.join(', ')}'),
          Text('Price: $price'),
        ],
      ),
    );
  }
}
