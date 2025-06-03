enum NotificationStatus { sent, delivered, read, draft, scheduled }

enum NotificationType { announcement, alert, update, welcome, promotion }

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String date; // You can change to DateTime if preferred
  final String time;
  final NotificationStatus status;
  final String audience;
  final NotificationType type;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.time,
    required this.status,
    required this.audience,
    required this.type,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      date: json['date'],
      time: json['time'],
      status: NotificationStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => NotificationStatus.sent,
      ),
      audience: json['audience'],
      type: NotificationType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => NotificationType.announcement,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'date': date,
      'time': time,
      'status': status.toString().split('.').last,
      'audience': audience,
      'type': type.toString().split('.').last,
    };
  }
}
