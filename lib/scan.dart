import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isScanSelected = true; // Tracks if "Scan" is selected

  double textLeft = 80; // Default left position
  double textRight = 80; // Default right position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top AppBar Section
                Container(
                  height: 100, // Increase height for better vertical centering
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                    children: [
                      // Close Button (Moved to the right)
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context); // Close and return to the previous screen
                        },
                      ),
                    ],
                  ),
                ),

                // Scan & Upload Toggle Buttons
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30), // Updated radius to 30
                  ),
                  child: Row(
                    children: [
                      // Scan Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isScanSelected = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: isScanSelected
                                  ? const Color(0xFF9FC742) // Highlighted green for "Scan"
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30), // Updated radius to 30
                            ),
                            child: const Center(
                              child: Text(
                                'Scan',
                                style: TextStyle(
                                  fontFamily: 'Minecraft',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Upload Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isScanSelected = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: isScanSelected
                                  ? Colors.transparent
                                  : const Color(0xFFCDEB45), // Highlighted green for "Upload"
                              borderRadius: BorderRadius.circular(30), // Updated radius to 30
                            ),
                            child: const Center(
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                  fontFamily: 'Minecraft',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Panda Image (Temporary placeholder)
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/pandascan.png', // Temporary image placeholder
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Camera Frame
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      // Camera Calibrating Text
                      const Positioned(
                        bottom: 160, // Adjusted position (moved up by 20%)
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            'Please hold still while the camera is calibrating',
                            style: TextStyle(
                              fontFamily: 'Minecraft',
                              fontSize: 14,
                              color: Colors.pink,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Scan Button and Torch Icon with White Background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // White background under torch and Scan button
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Row(
                  children: [
                    // Torch Icon with White Background
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.flashlight_on, color: Colors.black, size: 24),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Scan Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Scan action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCDEB45), // Button color
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Scan',
                          style: TextStyle(
                            fontFamily: 'Minecraft',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Scan & Upload Text
            Positioned(
              top: 40,
              left: textLeft,
              right: textRight,
              child: Center(
                child: const Text(
                  'Scan & Upload',
                  style: TextStyle(
                    fontFamily: 'Minecraft',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
