import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_devices.dart';

class MyDevicesScreen extends StatefulWidget {
  const MyDevicesScreen({super.key});

  @override
  State<MyDevicesScreen> createState() => _MyDevicesScreenState();
}

class _MyDevicesScreenState extends State<MyDevicesScreen> {
  String _searchQuery = '';
  String? _selectedFilter;

  // Sample data for assets
  final List<Map<String, String>> _assets = [
    {
      'name': 'Laptop Dell XPS',
      'status': 'Used',
      'condition': 'Good',
      'specs': 'Intel i7, 16GB RAM, 512GB SSD',
      'assignedDate': '2025-01-15',
      'serialNumber': 'DLX123456'
    },
    {
      'name': 'Monitor Samsung',
      'status': 'Not Used',
      'condition': 'Good',
      'specs': '27-inch, 4K UHD, 60Hz',
      'assignedDate': '2024-11-20',
      'serialNumber': 'SMG789101'
    },
    {
      'name': 'Printer HP',
      'status': 'Spare',
      'condition': 'Needs Repair',
      'specs': 'LaserJet, 20ppm, WiFi',
      'assignedDate': '2024-09-10',
      'serialNumber': 'HPP456789'
    },
    {
      'name': 'MacBook Pro',
      'status': 'Used',
      'condition': 'Damaged',
      'specs': 'M1 Pro, 32GB RAM, 1TB SSD',
      'assignedDate': '2025-03-05',
      'serialNumber': 'MBP987654'
    },
    {
      'name': 'Projector Epson',
      'status': 'Not Used',
      'condition': 'Good',
      'specs': '1080p, 4000 lumens',
      'assignedDate': '2024-12-01',
      'serialNumber': 'EPS321456'
    },
    {
      'name': 'Tablet iPad',
      'status': 'Spare',
      'condition': 'Needs Repair',
      'specs': '10.2-inch, 64GB, WiFi',
      'assignedDate': '2024-10-25',
      'serialNumber': 'IPD654321'
    },
  ];

  List<Map<String, String>> _filteredAssets() {
    return _assets.where((asset) {
      final matchesSearch =
          asset['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilter = _selectedFilter == null ||
          (_selectedFilter == 'Active' && asset['status'] == 'Used') ||
          (_selectedFilter == 'Returned' && asset['status'] != 'Used');
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6F8),
      child: Column(
        children: [
          // Add space to push search bar downward
          const SizedBox(height: 16),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search assets...',
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF002B5B)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                FilterChip(
                  label: Text('Returned', style: GoogleFonts.poppins()),
                  selected: _selectedFilter == 'Returned',
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilter = selected ? 'Returned' : null;
                    });
                  },
                  selectedColor: const Color(0xFF002B5B).withOpacity(0.1),
                  checkmarkColor: const Color(0xFF002B5B),
                  labelStyle: GoogleFonts.poppins(
                    color: _selectedFilter == 'Returned'
                        ? const Color(0xFF002B5B)
                        : Colors.black54,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text('Active', style: GoogleFonts.poppins()),
                  selected: _selectedFilter == 'Active',
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilter = selected ? 'Active' : null;
                    });
                  },
                  selectedColor: const Color(0xFF002B5B).withOpacity(0.1),
                  checkmarkColor: const Color(0xFF002B5B),
                  labelStyle: GoogleFonts.poppins(
                    color: _selectedFilter == 'Active'
                        ? const Color(0xFF002B5B)
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // Asset Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: _filteredAssets().length,
                itemBuilder: (context, index) {
                  final asset = _filteredAssets()[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailDevicesScreen(asset: asset),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              asset['name']!,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF002B5B),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Status: ${asset['status']}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Condition: ${asset['condition']}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black54,
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
          ),
        ],
      ),
    );
  }
}
