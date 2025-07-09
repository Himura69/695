import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = 'Nizam Hukmul Kautsar';
    const String position = 'Staff';
    const String department = 'Information Technology';
    const String branchName = 'Malang Regional Office';
    const String accountRole = 'Administrator';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF003366), Color(0xFF006699)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 600;
              return isWide
                  ? Row(
                      children: [
                        // Sisi kiri: avatar
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage('assets/logo.png'),
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        // Sisi kanan: info
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 40),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: ListView(
                              children: const [
                                ProfileInfoItem(
                                  icon: Icons.work_outline,
                                  title: 'Position',
                                  value: position,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.apartment_outlined,
                                  title: 'Department',
                                  value: department,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.location_city_outlined,
                                  title: 'Branch Name',
                                  value: branchName,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.admin_panel_settings_outlined,
                                  title: 'Account Role',
                                  value: accountRole,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 24),

                        // Avatar dan Nama
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/logo.png'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Info cards
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24)),
                            ),
                            child: ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              children: const [
                                ProfileInfoItem(
                                  icon: Icons.work_outline,
                                  title: 'Position',
                                  value: position,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.apartment_outlined,
                                  title: 'Department',
                                  value: department,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.location_city_outlined,
                                  title: 'Branch Name',
                                  value: branchName,
                                ),
                                ProfileInfoItem(
                                  icon: Icons.admin_panel_settings_outlined,
                                  title: 'Account Role',
                                  value: accountRole,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueGrey, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
