import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
