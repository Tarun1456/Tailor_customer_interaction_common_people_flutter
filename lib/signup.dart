import 'package:flutter/material.dart';
import 'package:practicetailor/login.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({Key? key}) : super(key: key); // Corrected constructor

  @override
  State<Mysignup> createState() => _MysignupState();
}


class _MysignupState extends State<Mysignup> {
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/up_items.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Tailor Connect',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.number,
                        decoration: _inputDecoration(
                          hintText: 'Mobile Number',
                          prefixIcon: Icons.phone,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: _inputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility,
                          onPressedSuffix: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: _inputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility,
                          onPressedSuffix: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15), backgroundColor: Color.fromARGB(255, 211, 210, 210),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyLogin(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onPressedSuffix,
  }) {
    return InputDecoration(
      fillColor: Color.fromARGB(255, 211, 210, 210),
      filled: true,
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, size: 30),
      suffixIcon: suffixIcon != null
          ? IconButton(
        icon: Icon(suffixIcon),
        onPressed: onPressedSuffix,
      )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  void _register() {
    // Add your registration logic here
    Navigator.pushReplacementNamed(context, 'login');
  }
}
