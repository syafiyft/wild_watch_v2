import 'package:flutter/material.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Animal categories with image paths and background colors
    final List<Map<String, dynamic>> categories = [
      {"label": "Birds", "image": "assets/flams_1.png", "color": Colors.red[300]},
      {"label": "Mammals", "image": "assets/lions_1.png", "color": Colors.yellow[300]},
      {"label": "Reptiles", "image": "assets/crocs_1.png", "color": Colors.green[300]},
      {"label": "Fish", "image": "assets/shark_2.png", "color": Colors.blue[300]},
      {"label": "Amphibians", "image": "assets/frogs.png", "color": Colors.purple[200]},
      {"label": "Insects", "image": "assets/bees.png", "color": Colors.pink[200]},
      {"label": "Arachnids", "image": "assets/spiders.png", "color": Colors.cyan[200]},
      {"label": "Crustaceans", "image": "assets/crabs.png", "color": Colors.pink[100]},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Back button
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Minecraft',
                    ),
                  ),
                ],
              ),
            ),
            // Scrollable grid for animal categories
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      // Implement category-specific navigation
                      print('Tapped on ${category["label"]}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category["color"],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                category["image"],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category["label"],
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Minecraft',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
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
