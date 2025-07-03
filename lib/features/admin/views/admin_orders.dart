import 'package:flutter/material.dart';

class AdminOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Order Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                List<String> statuses = [
                  'Pending',
                  'Confirmed',
                  'Preparing',
                  'On the way',
                  'Delivered',
                ];
                String status = statuses[index % statuses.length];
                Color statusColor = _getStatusColor(status);

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: statusColor.withOpacity(0.1),
                      child: Text(
                        '#${1000 + index}',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    title: Text('Order #${1000 + index}'),
                    subtitle: Text(
                      'Customer: John Doe • Restaurant: Pizza Palace',
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(color: statusColor, fontSize: 12),
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Confirmed':
        return Colors.blue;
      case 'Preparing':
        return Colors.purple;
      case 'On the way':
        return Colors.indigo;
      case 'Delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
