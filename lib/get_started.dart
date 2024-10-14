import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/homewild.png', // Updated background image
              fit: BoxFit.cover,
            ),
          ),
          // Rounded rectangle with text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.45, // Adjusted height
              decoration: BoxDecoration(
                color: const Color(0xFF0B1227), // Dark blue color for the rounded rectangle
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enjoy the jungle life and\nget to know wildlife\nanimals with ',
                      style: TextStyle(
                        fontSize: 24, // Adjusted size to match the image
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'WildWatch.',
                            style: TextStyle(
                              fontSize: 24, // Same size, but different style for emphasis
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6EB0F4), // Light blue color for WildWatch text
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Come and scan the species of animals\n'
                          'you’ve never met before.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9), // White with slight transparency
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Placeholder dashes to mimic the image
                    const Text(
                      '--  --  --',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    // Get started button
                    Center(
                      child: SizedBox(
                        width: 200, // Set a fixed width for the button
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the SignUp screen
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6EB0F4), // Light blue button color
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0), // Keep vertical padding consistent
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded button shape
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 16, // Adjusted font size
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.white, // White text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
