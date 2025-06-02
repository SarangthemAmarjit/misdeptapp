import 'package:flutter/material.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AdminPanelTile(
              icon: Icons.photo_library,
              title: 'Manage Gallery Images',
              subtitle: 'Upload, edit, or delete gallery images',
              onTap: () {
                // Replace with your gallery management page
                _navigateTo(context, PlaceholderPage(title: 'Gallery Images'));
              },
            ),
            AdminPanelTile(
              icon: Icons.contacts,
              title: 'Modify Contact Details',
              subtitle: 'Edit contact information displayed on the site',
              onTap: () {
                // Replace with your contact details management page
                _navigateTo(context, PlaceholderPage(title: 'Contact Details'));
              },
            ),
            AdminPanelTile(
              icon: Icons.image,
              title: 'Modify Banner Image',
              subtitle: 'Change the main banner image',
              onTap: () {
                // Replace with your banner image management page
                _navigateTo(context, PlaceholderPage(title: 'Banner Image'));
              },
            ),
            AdminPanelTile(
              icon: Icons.edit,
              title: 'Modify Site Contents',
              subtitle: 'Edit text and other site contents',
              onTap: () {
                // Replace with your site content management page
                _navigateTo(context, PlaceholderPage(title: 'Site Contents'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPanelTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AdminPanelTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 36),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

// Placeholder pages for navigation
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title management page.')),
    );
  }
}
