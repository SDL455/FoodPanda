import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_status_badge.dart';

class AdminOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> statuses = [
      {'key': 'pending', 'name': 'ລໍຖ້າ'},
      {'key': 'confirmed', 'name': 'ຢືນຢັນ'},
      {'key': 'preparing', 'name': 'ປຸງແຕ່ງ'},
      {'key': 'delivering', 'name': 'ຈັດສົ່ງ'},
      {'key': 'delivered', 'name': 'ສຳເລັດ'},
    ];

    return Padding(
      padding: const EdgeInsets.all(AppDimens.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ການຈັດການອໍເດີ', style: AppTextStyles.pageTitle()),
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final status = statuses[index % statuses.length];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: AppShapes.card,
                  elevation: AppDimens.cardElevation,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.admin.withOpacity(0.1),
                      child: Text(
                        '${1000 + index}',
                        style: const TextStyle(
                          fontSize: 9,
                          color: AppColors.admin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      'ອໍເດີ #${1000 + index}',
                      style: AppTextStyles.cardTitle(),
                    ),
                    subtitle: Text(
                      'ລູກຄ້າ: John Doe • ຮ້ານ: Pizza Palace',
                      style: AppTextStyles.caption(),
                    ),
                    trailing: AppStatusBadge.fromStatus(status['key']!),
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
}
