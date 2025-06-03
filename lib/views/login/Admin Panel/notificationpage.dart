// Notifications Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/notificationitemmodel.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      title: 'New Feature Released!',
      message:
          'We\'ve just released our new dashboard feature. Check it out now!',
      date: '2023-06-15',
      time: '10:30 AM',
      status: NotificationStatus.sent,
      audience: 'All Users',
      type: NotificationType.announcement,
    ),
    NotificationItem(
      id: '2',
      title: 'Maintenance Scheduled',
      message:
          'System maintenance scheduled for tomorrow from 2:00 AM to 4:00 AM',
      date: '2023-06-18',
      time: '3:00 PM',
      status: NotificationStatus.scheduled,
      audience: 'Premium Users',
      type: NotificationType.alert,
    ),
    NotificationItem(
      id: '3',
      title: 'Welcome to Our Platform',
      message: 'Thank you for joining us! Start exploring our features today.',
      date: '2023-06-20',
      time: '9:15 AM',
      status: NotificationStatus.sent,
      audience: 'New Users',
      type: NotificationType.welcome,
    ),
    NotificationItem(
      id: '4',
      title: 'Limited Time Offer',
      message: 'Get 30% off on premium plans for the next 48 hours only!',
      date: '2023-06-22',
      time: '11:45 AM',
      status: NotificationStatus.draft,
      audience: 'Free Users',
      type: NotificationType.promotion,
    ),
    NotificationItem(
      id: '5',
      title: 'Your Account Update',
      message: 'Your account settings have been updated successfully.',
      date: '2023-06-25',
      time: '4:20 PM',
      status: NotificationStatus.sent,
      audience: 'Specific Users',
      type: NotificationType.update,
    ),
  ];

  bool _showCreateForm = false;
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _message = '';
  String _audience = 'All Users';
  NotificationType _type = NotificationType.announcement;
  DateTime? _scheduleDate;
  TimeOfDay? _scheduleTime;

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
                'Notification Management',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _showCreateForm = !_showCreateForm;
                  });
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: Row(
                  children: [
                    Icon(
                      _showCreateForm ? Icons.close : Icons.add,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 3),
                    Text(_showCreateForm ? 'Cancel' : 'Create Notification'),
                  ],
                ),
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     setState(() {
              //       _showCreateForm = !_showCreateForm;
              //     });
              //   },
              //   icon: Icon(_showCreateForm ? Icons.close : Icons.add),
              //   label: Text(_showCreateForm ? 'Cancel' : 'Create Notification'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xFF6C72FF),
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 24,
              //       vertical: 16,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Create and manage notifications for your users',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
          ),
          const SizedBox(height: 24),

          // Create notification form
          if (_showCreateForm) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create New Notification',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.title),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) => _title = value!,
                      ),
                      const SizedBox(height: 20),

                      // Message field
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.message),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                        onSaved: (value) => _message = value!,
                      ),
                      const SizedBox(height: 20),

                      // Audience and Type
                      Row(
                        children: [
                          // Audience
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _audience,
                              decoration: InputDecoration(
                                labelText: 'Audience',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: const Icon(Icons.people),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'All Users',
                                  child: Text('All Users'),
                                ),
                                DropdownMenuItem(
                                  value: 'Premium Users',
                                  child: Text('Premium Users'),
                                ),
                                DropdownMenuItem(
                                  value: 'Free Users',
                                  child: Text('Free Users'),
                                ),
                                DropdownMenuItem(
                                  value: 'New Users',
                                  child: Text('New Users'),
                                ),
                                DropdownMenuItem(
                                  value: 'Specific Users',
                                  child: Text('Specific Users'),
                                ),
                              ],
                              onChanged:
                                  (value) => setState(() => _audience = value!),
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Notification Type
                          Expanded(
                            child: DropdownButtonFormField<NotificationType>(
                              value: _type,
                              decoration: InputDecoration(
                                labelText: 'Notification Type',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: const Icon(Icons.category),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: NotificationType.announcement,
                                  child: Text('Announcement'),
                                ),
                                DropdownMenuItem(
                                  value: NotificationType.alert,
                                  child: Text('Alert'),
                                ),
                                DropdownMenuItem(
                                  value: NotificationType.promotion,
                                  child: Text('Promotion'),
                                ),
                                DropdownMenuItem(
                                  value: NotificationType.update,
                                  child: Text('Update'),
                                ),
                                DropdownMenuItem(
                                  value: NotificationType.welcome,
                                  child: Text('Welcome'),
                                ),
                              ],
                              onChanged:
                                  (value) => setState(() => _type = value!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Schedule options
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: const Icon(Icons.calendar_today),
                              title: Text(
                                _scheduleDate == null
                                    ? 'Select Schedule Date'
                                    : 'Date: ${_scheduleDate!.toLocal().toString().split(' ')[0]}',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.date_range),
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025),
                                  );
                                  if (picked != null) {
                                    setState(() => _scheduleDate = picked);
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ListTile(
                              leading: const Icon(Icons.access_time),
                              title: Text(
                                _scheduleTime == null
                                    ? 'Select Schedule Time'
                                    : 'Time: ${_scheduleTime!.format(context)}',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.schedule),
                                onPressed: () async {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                  if (picked != null) {
                                    setState(() => _scheduleTime = picked);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Action buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _showCreateForm = false;
                              });
                            },
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Create notification logic would go here
                                setState(() {
                                  _notifications.insert(
                                    0,
                                    NotificationItem(
                                      id:
                                          DateTime.now().millisecondsSinceEpoch
                                              .toString(),
                                      title: _title,
                                      message: _message,
                                      date:
                                          _scheduleDate
                                              ?.toLocal()
                                              .toString()
                                              .split(' ')[0] ??
                                          'Now',
                                      time:
                                          _scheduleTime?.format(context) ??
                                          'Immediately',
                                      status:
                                          _scheduleDate != null
                                              ? NotificationStatus.scheduled
                                              : NotificationStatus.draft,
                                      audience: _audience,
                                      type: _type,
                                    ),
                                  );
                                  _showCreateForm = false;
                                  _title = '';
                                  _message = '';
                                  _audience = 'All Users';
                                  _type = NotificationType.announcement;
                                  _scheduleDate = null;
                                  _scheduleTime = null;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '"$_title" notification created',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
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
                            child: const Text('Create Notification'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Filter and search bar
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search notifications...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 244, 244, 246),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder:
                    (context) => [
                      const PopupMenuItem(
                        value: 'all',
                        child: Text('All Notifications'),
                      ),
                      const PopupMenuItem(value: 'sent', child: Text('Sent')),
                      const PopupMenuItem(
                        value: 'scheduled',
                        child: Text('Scheduled'),
                      ),
                      const PopupMenuItem(
                        value: 'drafts',
                        child: Text('Drafts'),
                      ),
                    ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 244, 246),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text('Filter', style: GoogleFonts.poppins()),
                      const SizedBox(width: 8),
                      const Icon(Icons.filter_list),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Notifications list header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const SizedBox(width: 40),
                Expanded(
                  flex: 3,
                  child: Text(
                    'NOTIFICATION',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'TYPE',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'AUDIENCE',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'STATUS',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'DATE & TIME',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Notifications list
          Expanded(
            child: ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return NotificationCard(
                  notification: notification,
                  onEdit: () => _editNotification(context, notification),
                  onDelete: () => _deleteNotification(notification.id),
                  onSend: () => _sendNotification(notification.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _editNotification(BuildContext context, NotificationItem notification) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Edit Notification',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: notification.title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: notification.message,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: notification.audience,
                        decoration: InputDecoration(
                          labelText: 'Audience',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'All Users',
                            child: Text('All Users'),
                          ),
                          DropdownMenuItem(
                            value: 'Premium Users',
                            child: Text('Premium Users'),
                          ),
                          DropdownMenuItem(
                            value: 'Free Users',
                            child: Text('Free Users'),
                          ),
                          DropdownMenuItem(
                            value: 'New Users',
                            child: Text('New Users'),
                          ),
                          DropdownMenuItem(
                            value: 'Specific Users',
                            child: Text('Specific Users'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<NotificationType>(
                        value: notification.type,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Type',
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: NotificationType.announcement,
                            child: Text('Announcement'),
                          ),
                          DropdownMenuItem(
                            value: NotificationType.alert,
                            child: Text('Alert'),
                          ),
                          DropdownMenuItem(
                            value: NotificationType.promotion,
                            child: Text('Promotion'),
                          ),
                          DropdownMenuItem(
                            value: NotificationType.update,
                            child: Text('Update'),
                          ),
                          DropdownMenuItem(
                            value: NotificationType.welcome,
                            child: Text('Welcome'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),

            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('"${notification.title}" updated'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                side: const BorderSide(color: Colors.blue),
              ),
              child: const Text(
                "Save Changes",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteNotification(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1D2335),
          title: const Text('Delete Notification'),
          content: const Text(
            'Are you sure you want to delete this notification? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notifications.removeWhere((n) => n.id == id);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notification deleted'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _sendNotification(String id) {
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        // _notifications[index] = _notifications[index].copyWith(
        //   status: NotificationStatus.sent,
        //   date: 'Now',
        //   time: DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5),
        // );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification sent successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSend;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onEdit,
    required this.onDelete,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Notification icon based on type
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getNotificationColor(
                  notification.type,
                ).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getNotificationIcon(notification.type),
                color: _getNotificationColor(notification.type),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Title and message
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Type
            Expanded(
              child: Chip(
                label: Text(
                  notification.type.toString().split('.').last,
                  style: TextStyle(
                    color: _getNotificationColor(notification.type),
                  ),
                ),
                backgroundColor: _getNotificationColor(
                  notification.type,
                ).withOpacity(0.1),
              ),
            ),

            // Audience
            Expanded(
              child: Text(notification.audience, style: GoogleFonts.poppins()),
            ),

            // Status
            Expanded(
              child: Chip(
                label: Text(
                  notification.status.toString().split('.').last,
                  style: TextStyle(color: _getStatusColor(notification.status)),
                ),
                backgroundColor: _getStatusColor(
                  notification.status,
                ).withOpacity(0.1),
              ),
            ),

            // Date and time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.date,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    notification.time,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Action buttons
            Row(
              children: [
                if (notification.status == NotificationStatus.draft) ...[
                  IconButton(
                    onPressed: onSend,
                    icon: const Icon(Icons.send),
                    tooltip: 'Send Now',
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                ],
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit',
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                  tooltip: 'Delete',
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return const Color(0xFF6C72FF);
      case NotificationType.alert:
        return const Color(0xFFFF9800);
      case NotificationType.promotion:
        return const Color(0xFF4CAF50);
      case NotificationType.update:
        return const Color(0xFF2196F3);
      case NotificationType.welcome:
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFF6C72FF);
    }
  }

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return Icons.announcement;
      case NotificationType.alert:
        return Icons.warning;
      case NotificationType.promotion:
        return Icons.local_offer;
      case NotificationType.update:
        return Icons.system_update;
      case NotificationType.welcome:
        return Icons.emoji_events;
      default:
        return Icons.notifications;
    }
  }

  Color _getStatusColor(NotificationStatus status) {
    switch (status) {
      case NotificationStatus.sent:
        return const Color(0xFF4CAF50);
      case NotificationStatus.scheduled:
        return const Color(0xFFFF9800);
      case NotificationStatus.draft:
        return const Color(0xFF2196F3);
      default:
        return const Color(0xFF6C72FF);
    }
  }
}
