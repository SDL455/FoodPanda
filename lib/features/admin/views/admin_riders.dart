import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_status_badge.dart';

class AdminRiders extends StatelessWidget {
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
              Text('ຜູ້ຈັດສົ່ງ (ໄຮເດີ)', style: AppTextStyles.pageTitle()),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add),
                label: const Text('ເພີ່ມ'),
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
              itemCount: 15,
              itemBuilder: (context, index) {
                final isOnline = index % 3 == 0;
                final rating = '4.${index % 5 + 1}';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: AppShapes.card,
                  elevation: AppDimens.cardElevation,
                  child: ListTile(
                    leading: Stack(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFE3F2FD),
                          child: Icon(Icons.delivery_dining, color: AppColors.admin),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: isOnline ? AppColors.success : Colors.grey,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      'ຜູ້ຈັດສົ່ງ ${index + 1}',
                      style: AppTextStyles.cardTitle(),
                    ),
                    subtitle: Text(
                      'ໄລຍະທາງ: ${(index + 1) * 12} km  •  ⭐ $rating',
                      style: AppTextStyles.caption(),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppStatusBadge.fromStatus(isOnline ? 'online' : 'offline'),
                        const SizedBox(width: 4),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert, size: 18),
                          itemBuilder: (_) => [
                            const PopupMenuItem(child: Text('ເບິ່ງໂປຣຟາຍ')),
                            const PopupMenuItem(child: Text('ຜົນງານ')),
                            const PopupMenuItem(child: Text('ສົ່ງຂໍ້ຄວາມ')),
                          ],
                        ),
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
