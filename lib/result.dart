import 'package:flutter/material.dart';
import 'scaninfo.dart'; // Import the ScanInfoScreen interface

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFCDEB45), // Top color
              Color(0xFFF4FFE9), // Middle color
              Color(0xFFFAFFF5), // Bottom color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Classification Result Title
              const Text(
                "Classification Result",
                style: TextStyle(
                  fontFamily: 'Minecraft',
                  fontSize: 24, // Enlarged font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Panda Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/panda.jpg', // Adjust the asset path if necessary
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // "You've caught a species!" Text
              const Text(
                "You've caught a species!",
                style: TextStyle(
                  fontFamily: 'Minecraft',
                  fontSize: 18, // Slightly larger font
                  fontWeight: FontWeight.normal,
                  color: Colors.purpleAccent,
                ),
              ),
              const SizedBox(height: 12),

              // Panda Name and Status
              const Text(
                "Panda\n(Endangered)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Minecraft',
                  fontSize: 22, // Enlarged font size for emphasis
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Probability and Observation Details
              const Text(
                "Probability: 100%\nYou first observed it on:\n2024-1-13 22:22:01.171863",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Minecraft',
                  fontSize: 16, // Larger font for readability
                  fontWeight: FontWeight.normal,
                  color: Colors.black54, // Slightly lighter color
                ),
              ),
              const SizedBox(height: 24), // Reduced the gap between details and buttons

              // Buttons Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to ScanInfoScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScanInfoScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCDEB45),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'View Species',
                          style: TextStyle(
                            fontFamily: 'Minecraft',
                            fontSize: 18, // Slightly larger font for emphasis
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12), // Reduced the gap between buttons
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          // Navigate back to camera
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Back to Camera',
                          style: TextStyle(
                            fontFamily: 'Minecraft',
                            fontSize: 18, // Larger font for consistency
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
