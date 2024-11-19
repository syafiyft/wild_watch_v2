import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage
import 'scan.dart'; // Import ScanScreen

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Search Bar and Back Button
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
                      // Search Bar
                      Expanded(
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
                    ],
                  ),
                ),
                // Discover Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Minecraft',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Discover Cards (Scrollable)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                      bottom: 80, // Extra padding to stay above the navigation bar
                    ),
                    itemCount: 6, // Updated to 6 items
                    itemBuilder: (context, index) {
                      final images = [
                        'assets/amazon.png',
                        'assets/desert.png',
                        'assets/arctic.png',
                        'assets/wetlands.png',
                        'assets/savannah.png',
                        'assets/mangrove.png'
                      ];
                      final labels = [
                        ['The Jungle', 'Amazon'],
                        ['Desert', 'Egypt'],
                        ['Arctic', 'Greenland'],
                        ['Wetlands', 'Everglades'],
                        ['Savannah', 'Serengeti'],
                        ['Mangroves', 'Sundarbans']
                      ];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 324, // Fixed width for consistency
                            height: 150, // Fixed height for consistency
                            child: Stack(
                              children: [
                                Image.asset(
                                  images[index],
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 16,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        labels[index][0],
                                        style: const TextStyle(
                                          fontFamily: 'Minecraft',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        labels[index][1],
                                        style: const TextStyle(
                                          fontFamily: 'Minecraft',
                                          fontSize: 14,
                                          color: Colors.white,
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
                    },
                  ),
                ),
              ],
            ),
            // Bottom Navigation Bar
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
                    currentIndex: 2, // Highlight Discover tab
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const MyHomePage(),
                            transitionsBuilder: (_, anim, __, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ScanScreen(),
                            transitionsBuilder: (_, anim, __, child) => FadeTransition(
                              opacity: anim,
                              child: child,
                            ),
                          ),
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
