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
          Positioned(
            top: -screenHeight * 0.1, // Move image up by 20% of the screen height
            left: -screenHeight * 0.02,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/getstart1.jpg', // Updated background image
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
              height: screenHeight * 0.35, // Adjusted height to fit content
              decoration: BoxDecoration(
                color: Colors.white, // Dark blue color for the rounded rectangle
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enjoy the jungle life and\nget to know wildlife\nanimals with ',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'WildWatch.',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Scan the species of animals\n'
                          'you’ve never met before.',
                      style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.9),
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
                            Navigator.pushNamed(context, '/signin');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent, // Light blue button color
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0), // Keep vertical padding consistent
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded button shape
                            ),
                          ),
                          child: const Text(
                            "Let's Start",
                            style: TextStyle(
                              fontSize: 16, // Adjusted font size
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.black, // White text color
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
