import 'package:flutter/material.dart';

class AdminOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Total Orders',
                  value: '1,234',
                  icon: Icons.receipt,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatsCard(
                  title: 'Active Riders',
                  value: '89',
                  icon: Icons.delivery_dining,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Restaurants',
                  value: '456',
                  icon: Icons.restaurant,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatsCard(
                  title: 'Revenue',
                  value: '\$12.5K',
                  icon: Icons.attach_money,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Recent Activities',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ActivityTile(
                  title: 'New restaurant registered',
                  subtitle: 'Pizza Palace joined the platform',
                  time: '2 hours ago',
                  icon: Icons.restaurant,
                ),
                ActivityTile(
                  title: 'Rider completed training',
                  subtitle: 'John Doe completed safety training',
                  time: '4 hours ago',
                  icon: Icons.school,
                ),
                ActivityTile(
                  title: 'System maintenance',
                  subtitle: 'Payment gateway updated',
                  time: '1 day ago',
                  icon: Icons.build,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const ActivityTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
