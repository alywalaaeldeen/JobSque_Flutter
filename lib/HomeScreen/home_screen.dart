import 'package:flutter/material.dart';
import 'package:jobsque/Applied/applied_screen.dart';
import 'package:jobsque/HomeScreen/jobs_screen.dart';
import 'package:jobsque/Profile/profile_screen.dart';
import 'package:jobsque/Saved/saved_screen.dart';
import 'package:jobsque/messages/messages_screen.dart';

var screens = [
  const JobsScreen(),
  const MessagesScreen(),
  const AppliedScreen(),
  const SavedScreen(),
  const ProfileScreen()
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentSelectedScreenIndex = index;
          });
        },
        currentIndex: currentSelectedScreenIndex,
        elevation: 0,
        backgroundColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Applied"),
          BottomNavigationBarItem(icon: Icon(Icons.turned_in), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: screens[currentSelectedScreenIndex],
    );
  }
}
