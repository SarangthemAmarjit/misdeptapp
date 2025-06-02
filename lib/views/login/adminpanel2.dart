import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';
import 'package:misdeptapp/views/login/adminpanel2.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Future<void> showLogoutDialog(BuildContext context) async {
    final LandingController landcon = Get.find<LandingController>();
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  // landcon.logout();
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
    );
    if (shouldLogout == true) {
      Get.offAllNamed('/home');
      landcon.setadmincurrentpage('dashboard', 0);
    }
  }

  Widget getPage(String key) {
    switch (key) {
      case 'Dashboard':
        return const DashboardPage();
      case 'Gallery':
        return const GalleryPage();
      case 'Contact Info':
        return const ContactPage();
      case 'Landing Page':
        return const LandingPage();
      case 'Users':
        return const UsersPage();

      default:
        return const DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final LandingController landcon = Get.put(LandingController());
    return GetBuilder<LandingController>(
      builder: (_) {
        return Scaffold(
          body: Row(
            children: [
              // Sidebar
              Container(
                width: 280,
                decoration: const BoxDecoration(
                  color: Color(0xFF141A2D),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/admin.png',
                          height: 36,
                          width: 36,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'ADMIN PANEL',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF6C72FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Navigation items
                    _buildNavItem(0, Icons.dashboard, 'Dashboard'),
                    _buildNavItem(1, Icons.photo_library, 'Gallery'),
                    _buildNavItem(2, Icons.contact_page, 'Contact Info'),
                    _buildNavItem(3, Icons.home, 'Landing Page'),
                    _buildNavItem(4, Icons.people, 'Users'),
                    _buildNavItem(5, Icons.logout, 'Logout'),
                    const Spacer(),
                    // User profile
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D2335),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF6C72FF).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80',
                            ),
                            radius: 24,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Admin User',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'admin@example.com',
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Main content
              Expanded(
                child: getPage(landcon.admincurrentpage),

                // PageView(
                //   controller: _pageController,
                //   onPageChanged: (index) {
                //     setState(() {
                //       _currentIndex = index;
                //     });
                //   },
                //   children: const [
                //     DashboardPage(),
                //     GalleryPage(),
                //     ContactPage(),
                //     LandingPage(),
                //     UsersPage(),
                //   ],
                // ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final LandingController landingcon = Get.find<LandingController>();
    return GetBuilder<LandingController>(
      builder: (_) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color:
                landingcon.selectedadminpageindex == index
                    ? const Color(0xFF6C72FF)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color:
                  landingcon.selectedadminpageindex == index
                      ? Colors.white
                      : Colors.grey[400],
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                color:
                    landingcon.selectedadminpageindex == index
                        ? Colors.white
                        : Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              if (index == 5) {
                showLogoutDialog(context);
                return;
              } else {
                landingcon.setadmincurrentpage(title, index);
              }
            },
          ),
        );
      },
    );
  }
}

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
                'Messages',
                '12',
                Icons.message,
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
                        children: const [
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

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gallery Management',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 10,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add New Image',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C72FF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Manage your site gallery images',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 32),
          // Gallery grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return GalleryItemCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryItemCard extends StatelessWidget {
  final int index;

  const GalleryItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                'https://picsum.photos/300/200?random=$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gallery Image ${index + 1}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category: Featured',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit, size: 20),
                          tooltip: 'Edit',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete, size: 20),
                          tooltip: 'Delete',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Update your site contact details',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          // ...existing code...
          const SizedBox(height: 32),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildContactField(
                              'Company Name',
                              'Acme Corporation',
                            ),
                            _buildContactField(
                              'Email Address',
                              'contact@acme.com',
                            ),
                            _buildContactField(
                              'Phone Number',
                              '+1 (555) 123-4567',
                            ),
                            _buildContactField(
                              'Address',
                              '123 Business Ave, Suite 100',
                            ),
                            _buildContactField('City', 'New York'),
                            _buildContactField('Country', 'United States'),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6C72FF),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Save Changes',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ...existing code...
        ],
      ),
    );
  }

  Widget _buildContactField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 203, 202, 202),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: value,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF1D2335).withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Landing Page Content',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Update your site landing page content',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSectionCard(
                    'Hero Section',
                    'The main banner at the top of your landing page',
                    Icons.image,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    'About Section',
                    'Information about your company or service',
                    Icons.info,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    'Services Section',
                    'List of services you offer',
                    Icons.work,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    'Testimonials',
                    'Customer reviews and testimonials',
                    Icons.format_quote,
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    'Call to Action',
                    'Final section encouraging user action',
                    Icons.call_to_action,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, String description, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6C72FF).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF6C72FF), size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.poppins(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Color(0xFF6C72FF)),
              tooltip: 'Edit',
            ),
          ],
        ),
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User Management',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add, color: Colors.white),
                label: const Text(
                  'Add New User',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C72FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Manage admin users and permissions',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 32),
          // Users table
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Role',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Actions',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: Colors.grey),
                  const UserRow(
                    name: 'Admin User',
                    email: 'admin@example.com',
                    role: 'Super Admin',
                  ),
                  const UserRow(
                    name: 'Content Manager',
                    email: 'content@example.com',
                    role: 'Editor',
                  ),
                  const UserRow(
                    name: 'Marketing',
                    email: 'marketing@example.com',
                    role: 'Editor',
                  ),
                  const UserRow(
                    name: 'Support',
                    email: 'support@example.com',
                    role: 'Viewer',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  final String name;
  final String email;
  final String role;

  const UserRow({
    super.key,
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=80&q=80',
                      ),
                      radius: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(name),
                  ],
                ),
              ),
              Expanded(child: Text(email)),
              Expanded(
                child: Chip(
                  label: Text(role),
                  backgroundColor:
                      role == 'Super Admin'
                          ? const Color(0xFF6C72FF).withOpacity(0.2)
                          : role == 'Editor'
                          ? const Color(0xFF4CAF50).withOpacity(0.2)
                          : const Color(0xFFFF9800).withOpacity(0.2),
                  labelStyle: TextStyle(
                    color:
                        role == 'Super Admin'
                            ? const Color(0xFF6C72FF)
                            : role == 'Editor'
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFFFF9800),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 20),
                      tooltip: 'Edit',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, size: 20),
                      tooltip: 'Delete',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
