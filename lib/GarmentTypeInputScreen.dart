import 'package:flutter/material.dart';
import 'ConfirmationScreen.dart';

class GarmentTypeInputScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String state;
  final String city;
  final String address;
  final String pincode;

  GarmentTypeInputScreen({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.state,
    required this.city,
    required this.address,
    required this.pincode,
  });

  @override
  _GarmentTypeInputScreenState createState() => _GarmentTypeInputScreenState();
}

class _GarmentTypeInputScreenState extends State<GarmentTypeInputScreen> {
  String? gender;
  List<String> selectedGarments = [];
  List<String> garmentOptions = [
    'Shirt',
    'Pant',
    'Trouser',
    'Blouse',
    'Dress',
    'Saree'
  ];
  TextEditingController garmentController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garment Information'),
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
              Text(
                'Address Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('State: ${widget.state}'),
              Text('City: ${widget.city}'),
              Text('Address: ${widget.address}'),
              Text('Pincode: ${widget.pincode}'),
              SizedBox(height: 20),
              Text(
                'Select Gender:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Dropdown for selecting gender
              DropdownButtonFormField<String>(
                isExpanded: true,
                hint: Text('Select Gender'),
                value: gender,
                items: ['Male', 'Female'].map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Select Garments:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Text box for entering garment types
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: garmentController,
                        decoration: InputDecoration(
                          hintText: 'Enter Garment Type',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              // Display the selected garment types
              SizedBox(height: 8),
              Wrap(
                children: selectedGarments.map((garment) {
                  return Chip(
                    label: Text(garment),
                    onDeleted: () {
                      setState(() {
                        selectedGarments.remove(garment);
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 20),
              // Text box for entering price
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(),
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Price',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredGarment = garmentController.text.trim();
                  if (enteredGarment.isNotEmpty &&
                      !selectedGarments.contains(enteredGarment)) {
                    setState(() {
                      selectedGarments.add(enteredGarment);
                      garmentController.clear();
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Item'),
                    Icon(Icons.add),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  // Validate and navigate to the confirmation screen
                  if (_validateInputs()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationScreen(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: widget.phoneNumber,
                          state: widget.state,
                          city: widget.city,
                          address: widget.address,
                          pincode: widget.pincode,
                          gender: gender,
                          selectedGarments: selectedGarments,
                          price: priceController.text.trim(),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    if (gender == null ||
        selectedGarments.isEmpty ||
        priceController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Validation Error'),
          content: Text(
              'Please select a gender, add at least one garment type, and enter the price.'),
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
