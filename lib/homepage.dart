import 'package:flutter/material.dart';
import 'scan.dart'; // Import the ScanScreen file
import 'discover.dart'; // Import the DiscoverScreen file
import 'birds.dart';
import 'see_all.dart'; // Import the SeeAllScreen file

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const HomeScreen(),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  height: 65,
                  decoration: const BoxDecoration(
                    color: Colors.black, // Navigation bar background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: 0, // Set Home tab as default
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: Colors.redAccent.withOpacity(0.9),
                    unselectedItemColor: Colors.white.withOpacity(0.9),
                    selectedFontSize: 14,
                    unselectedFontSize: 12,
                    iconSize: 24,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.camera_alt),
                        label: 'Scan',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.manage_search_rounded),
                        label: 'Discover',
                      ),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        // Navigate to HomeScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                      } else if (index == 1) {
                        // Navigate to ScanScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScanScreen()),
                        );
                      } else if (index == 2) {
                        // Navigate to DiscoverScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DiscoverScreen()),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HomeScreen and other dependent widgets
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 32),
        WelcomeBanner(),
        SizedBox(height: 16),
        DiscoverSection(),
        SizedBox(height: 16),
        Expanded(
          child: RecentAnimalsSection(),
        ),
      ],
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Welcome, ',
              style: TextStyle(
                fontFamily: 'Minecraft', // Use Minecraft font
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Syafiy!',
                  style: TextStyle(
                    fontFamily: 'Minecraft', // Use Minecraft font
                    color: Colors.red, // Username in red
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Discover the wilderness today!',
            style: TextStyle(
              fontFamily: 'Minecraft', // Use Minecraft font
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          const YourHistoryCard(),
        ],
      ),
    );
  }
}

class YourHistoryCard extends StatelessWidget {
  const YourHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFFE3FF63),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your History',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3 new species discovered!',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3 new different regions',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                ),
                child: const Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// DiscoverSection and other dependent widgets remain unchanged
class DiscoverSection extends StatelessWidget {
  const DiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SeeAllScreen()), // Navigate to SeeAllScreen
                  );
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent, // Highlight text as clickable
                    decoration: TextDecoration.underline, // Add underline for emphasis
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DiscoverCard(
              label: 'Birds',
              iconPath: 'assets/birds.png',
              backgroundColor: const Color(0xFFFF2257),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BirdsScreen(), // Navigate to birds.dart
                  ),
                );
              },
            ),
            DiscoverCard(
              label: 'Mammals',
              iconPath: 'assets/carnivore.png',
              backgroundColor: const Color(0xFFFFCF23),
              onTap: () {
                // Add navigation for mammals screen here
              },
            ),
            DiscoverCard(
              label: 'Reptiles',
              iconPath: 'assets/herbivore.png',
              backgroundColor: const Color(0xFFA3EE89),
              onTap: () {
                // Add navigation for reptiles screen here
              },
            ),
            DiscoverCard(
              label: 'Fish',
              iconPath: 'assets/seafish.png',
              backgroundColor: const Color(0xFF1AACFF),
              onTap: () {
                // Add navigation for fish screen here
              },
            ),
          ],
        ),
      ],
    );
  }
}



class DiscoverCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color backgroundColor;
  final VoidCallback onTap; // Add a callback for navigation

  const DiscoverCard({
    super.key,
    required this.label,
    required this.iconPath,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the navigation function when tapped
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(iconPath, width: 50, height: 50),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}


// Recent Animals section with scrollable rows and columns using existing assets
class RecentAnimalsSection extends StatelessWidget {
  const RecentAnimalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent Animals',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        // Make only the Recent Animals section scrollable grid with two columns
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // Aspect ratio for square images
            ),
            itemCount: animalImages.length, // Number of animal images
            itemBuilder: (context, index) {
              return AnimalCard(imagePath: animalImages[index]);
            },
          ),
        ),
      ],
    );
  }
}

// A list of animal image paths to display
const List<String> animalImages = [
  'assets/lion.jpg',
  'assets/koala.jpg',
  'assets/tiger.jpg',
  'assets/panda.jpg',
  'assets/elephant.jpg',
  'assets/cheetah.jpg',
];

// AnimalCard widget with bigger images for selection
class AnimalCard extends StatelessWidget {
  final String imagePath;

  const AnimalCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, // Ensure the image covers the entire card
        ),
      ),
    );
  }
}
