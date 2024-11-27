import 'package:flutter/material.dart';
import 'birds.dart'; // Import the birds.dart interface

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories data
    final categories = [
      {"label": "Birds", "icon": "assets/flams1.png", "color": Colors.redAccent, "route": const BirdsScreen()},
      {"label": "Mammals", "icon": "assets/lions1.png", "color": Colors.amber, "route": null},
      {"label": "Reptiles", "icon": "assets/crocs1.png", "color": Colors.green, "route": null},
      {"label": "Fish", "icon": "assets/shark2.png", "color": Colors.blueAccent, "route": null},
      {"label": "Amphibians", "icon": "assets/frogs.png", "color": Colors.purpleAccent, "route": null},
      {"label": "Insects", "icon": "assets/bees.png", "color": Colors.pinkAccent, "route": null},
      {"label": "Arachnids", "icon": "assets/spiders.png", "color": Colors.lightBlueAccent, "route": null},
      {"label": "Crustaceans", "icon": "assets/crabs.png", "color": Colors.orangeAccent, "route": null},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(
            fontFamily: 'Minecraft', // Use Minecraft font for consistency
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two categories per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length, // Total number of categories
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              if (category["route"] != null) {
                // Navigate to the corresponding screen if a route is defined
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => category["route"] as Widget),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: category["color"] as Color,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    category["icon"] as String,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category["label"] as String,
                    style: const TextStyle(
                      fontFamily: 'Minecraft',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
