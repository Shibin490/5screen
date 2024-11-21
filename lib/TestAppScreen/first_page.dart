import 'package:flutter/material.dart';
import 'package:flutter_1_screen/MainAppScreen/homescreen.dart';
import 'package:flutter_1_screen/TestAppScreen/login.dart';

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 195, 182, 66),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            "First Screen",
            style: TextStyle(
              color: Colors.blueAccent, // Text color
              fontSize: 30, // Adjusted font size
              fontWeight: FontWeight.bold, // Increased font weight
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0), // Optional padding for spacing
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align children horizontally
            children: [
              const Text(
                'flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ShopScreen()),
                  );
                },
                child: const Text(
                  'Go to shop',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Corrected the onPressed callback for navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => second_screen()),
                  );
                },
                child: const Text('Next page', style: TextStyle(fontSize: 25)),
              ),
              IconButton(
                onPressed: () {
                  print('IconButton clicked');
                },
                icon: const Icon(Icons.info),
              ),
              // Adding a single curved box
              Container(
                width: 300, // Adjust width as needed
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color
                  borderRadius: BorderRadius.circular(499), // Curved corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.all(16.0), // Inner padding for content
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center content vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center content horizontally
                  children: [
                    Icon(
                      Icons.star, // Example icon
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(height: 10), // Spacing between widgets
                    Text(
                      'Curved Box Content',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              // Spacer pushes the image to the bottom
              const Spacer(),
              // Local image at the bottom
              Image.asset(
                'assets/kumbayaaa wallpaper.webp', // Replace with your image path
                width: 400,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
