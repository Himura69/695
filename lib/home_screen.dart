import 'package:flutter/material.dart';
import 'my_devices_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeTab(),
    MyDevicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF002B5B),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (currentIndex == 0)
                  Container(
                    height: 3,
                    width: 24,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.home),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (currentIndex == 1)
                  Container(
                    height: 3,
                    width: 24,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.devices),
              ],
            ),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (currentIndex == 2)
                  Container(
                    height: 3,
                    width: 24,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.person),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6F8),
      child: const Center(
        child: Text(
          'Home Page Content',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF002B5B),
          ),
        ),
      ),
    );
  }
}
