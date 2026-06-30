import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';

class AdminRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ຮ້ານອາຫານ', style: AppTextStyles.pageTitle()),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('ເພີ່ມຮ້ານ'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.admin,
                  foregroundColor: Colors.white,
                  shape: AppShapes.button as OutlinedBorder?,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final rating = '4.${index % 5 + 1}';
                final orders = '${100 + index * 10}';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: AppShapes.card,
                  elevation: AppDimens.cardElevation,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.admin.withOpacity(0.1),
                      child: Icon(Icons.restaurant, color: AppColors.admin),
                    ),
                    title: Text(
                      'ຮ້ານອາຫານ ${index + 1}',
                      style: AppTextStyles.cardTitle(),
                    ),
                    subtitle: Text(
                      '⭐ $rating  •  ອໍເດີ: $orders',
                      style: AppTextStyles.caption(),
                    ),
                    trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (_) => [
                        const PopupMenuItem(value: 'view',    child: Text('ເບິ່ງລາຍລະອຽດ')),
                        const PopupMenuItem(value: 'edit',    child: Text('ແກ້ໄຂ')),
                        const PopupMenuItem(value: 'suspend', child: Text('ລະງັບ')),
                      ],
                    ),
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
