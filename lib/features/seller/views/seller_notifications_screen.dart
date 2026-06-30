import 'package:flutter/material.dart';

class SellerNotificationsScreen extends StatefulWidget {
  final VoidCallback onClearAll;

  const SellerNotificationsScreen({required this.onClearAll});

  @override
  _SellerNotificationsScreenState createState() => _SellerNotificationsScreenState();
}

class _SellerNotificationsScreenState extends State<SellerNotificationsScreen> {
  // Mock data for seller notifications
  List<Map<String, dynamic>> _notifications = [
    {
      'id': 'nt-1',
      'title': 'ມີອໍເດີໃໝ່ເຂົ້າມາ! (FP-9831)',
      'body': 'ສົມພອນ ສິດທິພົນ ໄດ້ສັ່ງ ຕຳໝາກຫຸ່ງທາດ ແລະ ອື່ນໆ. ກະລຸນາກວດສອບ ແລະ ຍອມຮັບອໍເດີ.',
      'time': '10 ນາທີກ່ອນ',
      'type': 'order', // order, payment, review, system
      'isRead': false,
    },
    {
      'id': 'nt-2',
      'title': 'ການຊຳລະເງິນສຳເລັດ',
      'body': 'ອໍເດີ FP-9820 ໄດ້ຮັບການຊຳລະເງິນ 115,000 ກີບ ຜ່ານ BCELOne Pay ຮຽບຮ້ອຍແລ້ວ.',
      'time': '40 ນາທີກ່ອນ',
      'type': 'payment',
      'isRead': false,
    },
    {
      'id': 'nt-3',
      'title': 'ລູກຄ້າໃຫ້ຄະແນນ 5 ດາວ! ⭐',
      'body': 'ວິໄລວັນ ສິດທິມານ ໄດ້ໃຫ້ຄະແນນຮ້ານຂອງທ່ານ 5 ດາວ ພ້ອມຄຳຊົມ: "ອາຫານແຊບຫຼາຍ!..."',
      'time': '2 ຊົ່ວໂມງກ່ອນ',
      'type': 'review',
      'isRead': false,
    },
    {
      'id': 'nt-4',
      'title': 'ລະບົບຖອນເງິນປະຈຳອາທິດສຳເລັດ',
      'body': 'ຍອດລາຍຮັບຂອງທ່ານໃນອາທິດທີ່ຜ່ານມາໄດ້ຖືກໂອນເຂົ້າບັນຊີທະນາຄານຂອງທ່ານແລ້ວ.',
      'time': '1 ມື້ກ່ອນ',
      'type': 'system',
      'isRead': true,
    },
  ];

  void _deleteNotification(String id) {
    setState(() {
      _notifications.removeWhere((n) => n['id'] == id);
    });
  }

  void _clearAll() {
    setState(() {
      _notifications.clear();
    });
    widget.onClearAll(); // Notify parent dashboard to update badge count
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ການແຈ້ງເຕືອນ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          if (_notifications.isNotEmpty)
            TextButton(
              onPressed: _clearAll,
              child: Text(
                'ອ່ານທັງໝົດ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'ບໍ່ມີການແຈ້ງເຕືອນໃໝ່',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Dismissible(
                  key: Key(notification['id']),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    _deleteNotification(notification['id']);
                  },
                  child: _buildNotificationTile(notification),
                );
              },
            ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification) {
    IconData iconData;
    Color iconColor;
    Color iconBgColor;

    switch (notification['type']) {
      case 'order':
        iconData = Icons.shopping_bag;
        iconColor = Colors.blue.shade700;
        iconBgColor = Colors.blue.shade50;
        break;
      case 'payment':
        iconData = Icons.monetization_on;
        iconColor = Colors.green.shade700;
        iconBgColor = Colors.green.shade50;
        break;
      case 'review':
        iconData = Icons.rate_review;
        iconColor = Colors.amber.shade700;
        iconBgColor = Colors.amber.shade50;
        break;
      case 'system':
      default:
        iconData = Icons.settings;
        iconColor = Colors.purple.shade700;
        iconBgColor = Colors.purple.shade50;
    }

    return Container(
      color: notification['isRead'] ? Colors.white : Colors.pink.shade50.withOpacity(0.3),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: iconBgColor,
              radius: 24,
              child: Icon(iconData, color: iconColor, size: 24),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    notification['title'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  notification['time'],
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                notification['body'],
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close, size: 18, color: Colors.grey.shade400),
              onPressed: () => _deleteNotification(notification['id']),
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
        ],
      ),
    );
  }
}
