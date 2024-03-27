import 'package:flutter/material.dart';
import 'package:practicetailor/confirmation_screen.dart';

class AddressInputScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  AddressInputScreen({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  @override
  _AddressInputScreenState createState() => _AddressInputScreenState();
}

class _AddressInputScreenState extends State<AddressInputScreen> {
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'User Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('First Name: ${widget.firstName}'),
              Text('Last Name: ${widget.lastName}'),
              Text('Phone Number: ${widget.phoneNumber}'),
              SizedBox(height: 20),
              // Text Fields for Address
              TextField(
                controller: stateController,
                decoration: InputDecoration(labelText: 'State'),
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
              SizedBox(height: 20),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  // Validate and navigate to the garment type input screen
                  if (_validateInputs()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GarmentTypeInputScreen(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: widget.phoneNumber,
                          state: stateController.text,
                          city: cityController.text,
                          address: addressController.text,
                          pincode: pincodeController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    if (stateController.text.trim().isEmpty ||
        cityController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        pincodeController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Validation Error'),
          content: Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
