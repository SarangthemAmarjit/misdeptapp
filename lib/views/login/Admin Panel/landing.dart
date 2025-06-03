
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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