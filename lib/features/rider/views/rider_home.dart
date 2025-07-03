import 'package:flutter/material.dart';

class RiderHome extends StatefulWidget {
  @override
  _RiderHomeState createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, John!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ready to start delivering?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              ],
            ),
            SizedBox(height: 30),

            // Online/Offline Toggle
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOnline = !_isOnline;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isOnline ? Colors.green : Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: (_isOnline ? Colors.green : Colors.grey)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(
                        _isOnline
                            ? Icons.power_settings_new
                            : Icons.power_settings_new,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _isOnline ? 'You\'re Online' : 'You\'re Offline',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isOnline ? Colors.green : Colors.grey,
                    ),
                  ),
                  Text(
                    _isOnline ? 'Tap to go offline' : 'Tap to go online',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Today's Stats
            Text(
              'Today\'s Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: RiderStatsCard(
                    title: 'Deliveries',
                    value: '12',
                    icon: Icons.delivery_dining,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RiderStatsCard(
                    title: 'Earnings',
                    value: '\$85',
                    icon: Icons.attach_money,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RiderStatsCard(
                    title: 'Hours',
                    value: '6.5',
                    icon: Icons.access_time,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RiderStatsCard(
                    title: 'Rating',
                    value: '4.8',
                    icon: Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Quick Actions
            if (_isOnline) ...[
              Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      label: Text('View Map'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.help),
                      label: Text('Help'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class RiderStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const RiderStatsCard({
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
