import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Constructor with optional key parameter
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile IconButton
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Navigation or functionality for the "Profile" button
                  },
                  iconSize: 100, // size of the icon
                ),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontFamily: "Inter"),
                ),
              ],
            ),
            const SizedBox(height: 20), // Spacer between the buttons

            // Interests IconButton
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.star),
                  onPressed: () {
                    // Navigation or functionality for the "Interests" button
                  },
                  iconSize: 100, // size of the icon
                ),
                const Text('Interests',
                    style: TextStyle(fontSize: 20, fontFamily: "Inter")),
              ],
            ),
            const SizedBox(height: 20), // Spacer between the buttons

            // Skills IconButton
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.build),
                  onPressed: () {
                    // Navigation or functionality for the "Skills" button
                  },
                  iconSize: 100, // size of the icon
                ),
                const Text('Skills',
                    style: TextStyle(fontSize: 20, fontFamily: "Inter")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
