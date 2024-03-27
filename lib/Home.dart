import 'package:flutter/material.dart';

class TailorProfileScreen extends StatelessWidget {
  const TailorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tailor Profile'),
        backgroundColor: Color.fromARGB(197, 54, 109, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Picture and Name
                Container(
                  height: 200, // Set the desired height for the profile picture
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://mysmileylife.com/wp-content/uploads/2023/03/top-10-tailors-in-mumbai.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipOval( // Wrap the CircleAvatar with ClipOval to make it circular
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://traffictail.com/wp-content/uploads/2021/04/Tailoring-business-plan-hindi.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'John Doe', // Replace with the tailor's name
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // About Section
                      buildSection('About', [
                        Text(
                          'Tailor with expertise in stitching various types of garments.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ]),
                      const Divider(height: 24),
                      // Details Section
                      buildSection('Details', [
                        buildDetailRow('Phone No:', '123-456-7890'),
                        buildDetailRow('Address:', '123 Main St'),
                        buildDetailRow('Pincode:', '56789'),
                        buildDetailRow('District:', 'Fashion District'),
                      ]),
                      const Divider(height: 24),
                      // Period of Experience Section
                      buildSection('Period of Experience', [
                        buildDetailRow('Experience:', '5 years'),
                      ]),
                      const Divider(height: 24),
                      // Type of Garments Section
                      buildSection('Type of Garments', [
                        buildGarmentRow('Suits', '\$20'),
                        buildGarmentRow('Dresses', '\$30'),
                        buildGarmentRow('Shirts', '\$25'),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(197, 54, 109, 248),
          ),
        ),
      ],
    );
  }

  Widget buildSection(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(197, 54, 109, 248),
        ),
      ),
      children: children,
    );
  }

  Widget buildGarmentRow(String garment, String cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          garment,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          cost,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(197, 54, 109, 248),
          ),
        ),
      ],
    );
  }
}
