import 'package:flutter/material.dart';

class ScanInfoScreen extends StatelessWidget {
  const ScanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white, // White circular background
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Image Section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Image.asset(
              'assets/mainpanda.png', // Main animal image
              fit: BoxFit.cover,
            ),
          ),

          // Content Section
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded top corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Animal Type
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF57FB3D), // Color for herbivore type
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Herbivore',
                      style: TextStyle(
                        fontFamily: 'Minecraft',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Animal Name and Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Giant Panda',
                            style: TextStyle(
                              fontFamily: 'Minecraft',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Ailuropoda melanoleuca',
                            style: TextStyle(
                              fontFamily: 'Minecraft',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCDEB45),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Guangxi, China',
                          style: TextStyle(
                            fontFamily: 'Minecraft',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Minecraft',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The giant panda (Ailuropoda melanoleuca), also known as '
                        'the panda bear or simply panda, is a bear species endemic to China. '
                        'It is characterized by its black-and-white coat and rotund body. '
                        'The name "giant panda" is sometimes used to distinguish it from the red panda.',
                    style: TextStyle(
                      fontFamily: 'Minecraft',
                      fontSize: 13, // Adjusted font size
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Gallery
                  const Text(
                    'Gallery',
                    style: TextStyle(
                      fontFamily: 'Minecraft',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/panda_1.png',
                        width: 110, // Enlarged width
                        height: 110, // Enlarged height
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/panda_2.png',
                        width: 110, // Enlarged width
                        height: 110, // Enlarged height
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/panda_3.png',
                        width: 110, // Enlarged width
                        height: 110, // Enlarged height
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Save action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCDEB45),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'Minecraft',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Additional spacing above the phone's home indicator
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
