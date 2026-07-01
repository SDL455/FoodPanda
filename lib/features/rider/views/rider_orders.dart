import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_status_badge.dart';
import 'package:foodpanda/shared/widgets/app_empty_state.dart';

class RiderOrders extends StatefulWidget {
  @override
  _RiderOrdersState createState() => _RiderOrdersState();
}

class _RiderOrdersState extends State<RiderOrders> {
  // Mock active orders – in production these come from a backend stream
  final List<Map<String, dynamic>> _orders = [
    {
      'id': '1001',
      'restaurant': 'ຮ້ານ Pizza Palace',
      'address': '123 ຖະໜົນຫຼັກ, ຕົວເມືອງ',
      'status': 'delivering',
      'amount': '85,000 ກີບ',
    },
    {
      'id': '1002',
      'restaurant': 'ຮ້ານ Burger King',
      'address': '45 ຖະໜົນໄກສອນ, ບ້ານຫານ',
      'status': 'ready',
      'amount': '120,000 ກີບ',
    },
    {
      'id': '1003',
      'restaurant': 'ຮ້ານ ຕຳແຊບ',
      'address': '67 ຖ. ລ້ານຊ້າງ, ຈັນທະບູລີ',
      'status': 'ready',
      'amount': '65,000 ກີບ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ອໍເດີທີ່ກຳລັງດຳເນີນການ', style: AppTextStyles.pageTitle()),
            const SizedBox(height: 20),

            _orders.isEmpty
                // NEW: empty state (was missing before)
                ? const AppEmptyState(
                    icon: Icons.delivery_dining,
                    message: 'ບໍ່ມີອໍເດີໃນຂະນະນີ້',
                    subMessage: 'ຄອຍຮັບອໍເດີໃໝ່ – ຕ້ອງເປີດ ອອນລາຍ ກ່ອນ',
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _orders.length,
                      itemBuilder: (context, index) {
                        final order = _orders[index];
                        return _buildOrderCard(order);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: AppShapes.card,
      elevation: AppDimens.cardElevation,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ອໍເດີ #${order['id']}', style: AppTextStyles.cardTitle()),
                AppStatusBadge.fromStatus(order['status']),
              ],
            ),
            const SizedBox(height: 12),

            // Restaurant
            Row(
              children: [
                Icon(Icons.restaurant, size: 16, color: Colors.grey.shade500),
                const SizedBox(width: 8),
                Text(order['restaurant'], style: AppTextStyles.body()),
              ],
            ),
            const SizedBox(height: 6),

            // Address
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey.shade500),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(order['address'], style: AppTextStyles.body()),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Amount
            Row(
              children: [
                Icon(
                  Icons.payments_outlined,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 8),
                Text(
                  order['amount'],
                  style: AppTextStyles.body(
                    color: AppColors.success,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text('ຮັບອໍເດີ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.rider,
                      foregroundColor: Colors.white,
                      shape: AppShapes.button as OutlinedBorder?,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.cardGap),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.close, size: 18),
                    label: const Text('ປະຕິເສດ'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      shape: AppShapes.button as OutlinedBorder?,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
