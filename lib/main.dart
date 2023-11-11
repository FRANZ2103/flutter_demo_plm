import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      routes: [
        GoRoute(
          path: 'profile',
          pageBuilder: (context, state) =>
              const MaterialPage(child: ProfilePage()),
        ),
        GoRoute(
          path: 'skills',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SkillsPage()),
        ),
        GoRoute(
          path: 'interests',
          pageBuilder: (context, state) =>
              const MaterialPage(child: InterestsPage()),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: goRouter,
      builder: (context, router) {
        return Scaffold(
          appBar: AppBar(title: const Text('Profile App')),
          body: router,
        );
      },
    );
  }
}

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
                    GoRouter.of(context).go('/profile');
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
                    GoRouter.of(context).go('/interests');
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
                    GoRouter.of(context).go('/skills');
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Picture
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: Colors.blueGrey[100]!,
                        width: 5,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Mug.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name Text
                  const Text(
                    'Franz Sundiam',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Email
                  const Text(
                    'Email: franzsundiam1@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Social Media Links with Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png',
                          height: 24,
                          width: 24),
                      const Text(' franz.sundiam'),
                      const SizedBox(width: 10),
                      Image.network(
                          'https://help.twitter.com/content/dam/help-twitter/brand/logo.png',
                          height: 24,
                          width: 24),
                      const Text(' @franz07'),
                      const SizedBox(width: 10),
                      Image.network(
                          'https://cdn131.picsart.com/350726889041211.png',
                          height: 24,
                          width: 24),
                      const Text(' @fff'),
                    ],
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    thickness: 0.5,
                    height: 20,
                  ),
                  // Short Bio
                  const Text(
                    'EYYYY GUMANA GAGI HAHAHAHA.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InterestsPage extends StatefulWidget {
  const InterestsPage({Key? key}) : super(key: key);
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<String> interests = ['Reading', 'Coding', 'Gaming'];

  void _addInterest() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text('Add Interest'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter Interest'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    interests.add(_controller.text);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interests'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, size: 50),
                const SizedBox(height: 16),
                const Text(
                  'Interests',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: interests.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(
                          child: Text(interests[index],
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "Inter")),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: _addInterest,
                  child: Text('Add Interest'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<String> skills = ['Flutter', 'Dart', 'Go'];

  void _addSkill() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text('Add Skill'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter Skill'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    skills.add(_controller.text);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.build, size: 50),
                SizedBox(height: 16),
                Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(
                          child: Text(skills[index],
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "Inter")),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: _addSkill,
                  child: Text('Add Skill'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
