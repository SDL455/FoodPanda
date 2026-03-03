import 'package:flutter/material.dart';
import 'package:foodpanda/cores/themes/themes.dart';

class AdminOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Order Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
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
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.withOpacity(statusColor, 0.1),
                      child: Text(
                        '#${1000 + index}',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                    title: Text('Order #${1000 + index}'),
                    subtitle: const Text(
                      'Customer: John Doe • Restaurant: Pizza Palace',
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.withOpacity(statusColor, 0.1),
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
        return AppColors.statusPending;
      case 'Confirmed':
        return AppColors.statusConfirmed;
      case 'Preparing':
        return AppColors.statusPreparing;
      case 'On the way':
        return AppColors.statusOnTheWay;
      case 'Delivered':
        return AppColors.statusDelivered;
      default:
        return AppColors.statusDefault;
    }
  }
}
