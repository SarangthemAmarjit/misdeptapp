import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome back, Admin!',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 32),
          // Stats cards
          Row(
            children: [
              _buildStatCard(
                'Gallery Images',
                '24',
                Icons.photo_library,
                const Color(0xFF6C72FF),
              ),
              const SizedBox(width: 24),
              _buildStatCard(
                'Active Users',
                '148',
                Icons.people,
                const Color(0xFF4CAF50),
              ),
              const SizedBox(width: 24),
              _buildStatCard(
                'Notifications',
                '12',
                Icons.notifications,
                const Color(0xFFFF9800),
              ),
              const SizedBox(width: 24),
              _buildStatCard(
                'Last Updated',
                'Today',
                Icons.update,
                const Color(0xFFF44336),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Recent activity
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          ActivityItem(
                            icon: Icons.add_a_photo,
                            title: 'Added new gallery image',
                            subtitle: 'Just now',
                            color: Color(0xFF6C72FF),
                          ),
                          ActivityItem(
                            icon: Icons.edit,
                            title: 'Updated contact information',
                            subtitle: '2 hours ago',
                            color: Color(0xFF4CAF50),
                          ),
                          ActivityItem(
                            icon: Icons.delete,
                            title: 'Removed outdated banner',
                            subtitle: 'Yesterday',
                            color: Color(0xFFF44336),
                          ),
                          ActivityItem(
                            icon: Icons.person_add,
                            title: 'Added new admin user',
                            subtitle: '2 days ago',
                            color: Color(0xFFFF9800),
                          ),
                          ActivityItem(
                            icon: Icons.photo_library,
                            title: 'Reorganized gallery categories',
                            subtitle: '3 days ago',
                            color: Color(0xFF9C27B0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const ActivityItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
