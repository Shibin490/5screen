import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'cartscreen.dart'; // Assuming you have CartScreen
import 'homescreen.dart'; // Assuming you have HomeScreen

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the data passed using named routes
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String productName = arguments['productName'] ?? '';
    final String price = arguments['price'] ?? '';
    final String originalPrice = arguments['originalPrice'] ?? '';
    final String imagePath = arguments['imagePath'] ?? '';

    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ShopScreen()), // Use HomeScreen or the appropriate previous screen
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.upload, color: Colors.black),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Show the product image passed through arguments
                      SizedBox(
                        height: 300,
                        child: Image.asset(imagePath, fit: BoxFit.contain),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: index == 0 ? Colors.black : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the dynamic product name
                        Text(
                          productName,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                        const SizedBox(height: 16),
                        // Rating, reviews, and like button (This section is static, you can modify it as needed)
                        const Row(
                          children: [
                            Icon(Icons.star,
                                color: Color(0xFF5174C8), size: 16),
                            SizedBox(width: 4),
                            Text('4.8', style: TextStyle(fontFamily: 'Arial')),
                            SizedBox(width: 4),
                            Text('117 reviews',
                                style: TextStyle(
                                    color: Color(0xFF7C7C7C),
                                    fontFamily: 'Arial')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Price information (from passed data)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 237, 237),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                price,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'From $originalPrice per month',
                                  style: const TextStyle(
                                      color: Colors.grey, fontFamily: 'Arial'),
                                ),
                              ),
                              const Spacer(),
                              // Info button
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.info,
                                    color: Color.fromARGB(255, 186, 184, 184),
                                    size: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Product description and "Read More" functionality
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color.fromARGB(255, 164, 163, 163),
                              fontFamily: 'Arial',
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    'The Nintendo Switch gaming console is a compact device that can be taken everywhere. This portable super device is also equipped with 2 gamepads. ',
                              ),
                              TextSpan(
                                text: 'Read more',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle the "Read more" action
                                    print("Read more clicked");
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Add to cart button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 197, 236, 19),
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Add to cart',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Arial')),
                        ),
                        const SizedBox(height: 8),
                        const Center(
                          child: Text(
                            'Delivery on 26 October',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'Arial'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
