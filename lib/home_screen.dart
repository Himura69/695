import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_devices_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  Widget? currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = const HomeTab();
  }

  void onTabTapped(int index) async {
    if (index == 2 && currentIndex != 2) {
      setState(() {
        currentPage = const ProfileLoadingScreen();
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        currentPage = const ProfileScreen();
        currentIndex = 2;
      });
    } else {
      setState(() {
        currentIndex = index;
        if (index == 0) {
          currentPage = const HomeTab();
        } else if (index == 1) {
          currentPage = const MyDevicesScreen();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: currentPage,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF002B5B),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (currentIndex == 0)
                  Container(
                    height: 3,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.home_rounded, size: 26),
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
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.inventory, size: 26),
              ],
            ),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (currentIndex == 2)
                  Container(
                    height: 3,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF002B5B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                else
                  const SizedBox(height: 7),
                const Icon(Icons.person_rounded, size: 26),
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F6F8), Color(0xFFE8ECEF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inventory',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF002B5B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Return items to borrow more',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF002B5B).withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.4,
                    children: [
                      _buildDashboardCard(
                        context,
                        title: 'Items Borrowed',
                        value: '3',
                        icon: Icons.inventory,
                        badgeText: '1 Overdue',
                        color: const Color(0xFF002B5B),
                      ),
                      _buildDashboardCard(
                        context,
                        title: 'Return Deadline',
                        value: '10/07/2025',
                        icon: Icons.calendar_today,
                        badgeText: 'Due Soon',
                        color: const Color(0xFF1E88E5),
                      ),
                      _buildDashboardCard(
                        context,
                        title: 'Borrow Status',
                        value: 'Pending',
                        icon: Icons.warning_rounded,
                        badgeText: 'Action',
                        color: const Color(0xFFE53935),
                        subtitle: 'Return items to borrow',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required String badgeText,
    required Color color,
    String? subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.15),
          width: 0.5,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 24,
                      color: color,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF002B5B),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF002B5B).withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (badgeText.isNotEmpty)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeText.contains('Overdue') ||
                          badgeText.contains('Action')
                      ? const Color(0xFFE53935)
                      : const Color(0xFF43A047),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badgeText,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProfileLoadingScreen extends StatefulWidget {
  const ProfileLoadingScreen({super.key});

  @override
  State<ProfileLoadingScreen> createState() => _ProfileLoadingScreenState();
}

class _ProfileLoadingScreenState extends State<ProfileLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
