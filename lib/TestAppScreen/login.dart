import 'package:flutter/material.dart';

class second_screen extends StatelessWidget {
  second_screen({super.key});

  // Create controllers to get values from the text fields
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // Global key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 237, 5, 5), // Background color
        title: Container(
          width: double.infinity, // Take up full width of AppBar
          alignment: Alignment.center, // Center the text
          child: const Text(
            "Second Screen", // Corrected title text
            style: TextStyle(
              color: Colors.blueAccent, // Text color
              fontSize: 30, // Adjusted font size
              fontWeight: FontWeight.bold, // Increased font weight
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the screen
        child: Form(
          key: _formKey, // Assign the form key to the form
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              const Text(
                'Create email and password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Space between the text and fields

              // Username text field
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Username (Email)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // Check if the email ends with "@gmail.com"
                  if (!value.endsWith('@gmail.com')) {
                    return 'Email must end with @gmail.com';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20), // Space between fields

              // Password text field
              TextFormField(
                controller: passwordController,
                obscureText: true, // Hide the password text
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  // Check if the password length is less than 6 characters
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20), // Space between fields

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, show the success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login successful')),
                    );
                    // You can proceed to navigate to another screen or other actions
                  } else {
                    // If form is not valid, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Type corrcet username and password!')),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
