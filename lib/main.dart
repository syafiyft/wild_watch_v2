import 'package:flutter/material.dart';
import 'get_started.dart'; // Import the GetStartedScreen from another file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WildWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/get-started', // Set the initial route to GetStartedScreen
      routes: {
        '/get-started': (context) => const GetStartedScreen(), // Connected to the file
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const MyHomePage(), // Navigate to MyHomePage after sign up
      },
    );
  }
}

// SignUpScreen as a placeholder
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign Up Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Navigate to MyHomePage after sign up
              },
              child: const Text('Sign Up and Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// Your Home Page content remains unchanged
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: 0,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: Colors.brown.withOpacity(0.9),
                    unselectedItemColor: Colors.black.withOpacity(0.9),
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
                      // Handle bottom navigation tap
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

// HomeScreen remains unchanged
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


// Welcome banner with a user avatar and welcome text
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 0,
          right: 16,
          child: ClipOval( // Ensure the image is clipped to a circle
            child: SizedBox( // Use SizedBox to control the size of the avatar
              width: 60, // Adjust the width and height for a larger size if needed
              height: 60,
              child: Image(
                image: AssetImage('assets/avatar.jpg'),
                fit: BoxFit.cover, // Ensure the image covers the entire area
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Syafiy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Discover the wilderness today!',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              YourHistoryCard(),
            ],
          ),
        ),
      ],
    );
  }
}

// Your History card with custom design
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
          color: Colors.indigoAccent,
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
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3 new species discovered!',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3 new different regions',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                ),
                child: const Text('Saved'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Discover section with a horizontal row of categories
class DiscoverSection extends StatelessWidget {
  const DiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('See all'),
            ],
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DiscoverCard(label: 'Birds', iconPath: 'assets/birds.png', backgroundColor: Color(0xFFFAD4D4)),
            DiscoverCard(label: 'Carnivore', iconPath: 'assets/carnivore.png', backgroundColor: Color(0xFFFFDDA1)),
            DiscoverCard(label: 'Herbivore', iconPath: 'assets/herbivore.png', backgroundColor: Color(0xFFD0FFD6)),
            DiscoverCard(label: 'Sea Fish', iconPath: 'assets/seafish.png', backgroundColor: Color(0xFFD6F3FF)),
          ],
        ),
      ],
    );
  }
}

// DiscoverCard widget displaying category cards
class DiscoverCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color backgroundColor;

  const DiscoverCard({
    super.key,
    required this.label,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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