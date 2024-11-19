import 'package:flutter/material.dart';

class BirdsScreen extends StatelessWidget {
  const BirdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of bird images and their corresponding names
    final List<Map<String, String>> birdData = [
      {"image": "assets/redcrestedturaco.png", "name": "Red-crested Turaco"},
      {"image": "assets/shoebill.png", "name": "Shoebill"},
      {"image": "assets/whitestork.png", "name": "White Stork"},
      {"image": "assets/casuarius.png", "name": "Casuarius"},
      {"image": "assets/sunbittern.png", "name": "Sunbittern"},
      {"image": "assets/kingpenguin.png", "name": "King Penguin"},
      {"image": "assets/hamerkop.png", "name": "Hamerkop"},
      {"image": "assets/indianpeafowl.png", "name": "Indian Peafowl"},
      {"image": "assets/americanflamingo.png", "name": "American Flamingo"},
      {"image": "assets/annashummingbird.png", "name": "Anna's Hummingbird"},
      {"image": "assets/rainbowlorikeet.png", "name": "Rainbow Lorikeet"},
      {"image": "assets/kingfisher.png", "name": "Kingfisher"},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar with title and back button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Back Button
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title
                  const Text(
                    "Birds",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Minecraft',
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Scrollable GridView for bird images
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Square cards
                ),
                itemCount: birdData.length, // Number of bird items
                itemBuilder: (context, index) {
                  final bird = birdData[index];
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            bird["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bird["name"]!,
                        style: const TextStyle(
                          fontFamily: 'Minecraft',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
