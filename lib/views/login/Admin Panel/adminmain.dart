import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/views/landing/controller/landing_controller.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/admindashboard.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/contactpage.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/gallerypage.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/landing.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/notificationpage.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/userpage.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
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
      case 'Notifications':
        return const NotificationsPage();
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
                    _buildNavItem(4, Icons.notifications, 'Notifications'),
                    _buildNavItem(5, Icons.people, 'Users'),
                    _buildNavItem(6, Icons.logout, 'Logout'),
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
              if (index == 6) {
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
