import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';
import 'package:foodpanda/shared/widgets/app_status_badge.dart';
import 'package:foodpanda/shared/widgets/app_empty_state.dart';

class CustomerOrders extends StatefulWidget {
  const CustomerOrders({super.key});

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Mock orders list – active + history
  final List<Map<String, dynamic>> _orders = List.generate(10, (i) {
    final statuses = ['delivered', 'delivered', 'delivering', 'preparing', 'pending'];
    final status = statuses[i % statuses.length];
    final price = 150000 + i * 20000;
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return {
      'id': 1000 + i,
      'restaurant': 'ຮ້ານອາຫານ ${i + 1}',
      'items': '${2 + i % 3} ລາຍການ',
      'price': '$formatted ກີບ',
      'status': status,
      'date':
          '${DateTime.now().subtract(Duration(days: i)).day}/${DateTime.now().month}/${DateTime.now().year}',
    };
  });

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = _orders
        .where((o) => ['pending', 'confirmed', 'preparing', 'delivering']
            .contains(o['status']))
        .toList();
    final history = _orders
        .where((o) => ['delivered', 'cancelled'].contains(o['status']))
        .toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimens.pagePadding, AppDimens.pagePadding,
              AppDimens.pagePadding, 0,
            ),
            child: Text('ອໍເດີຂອງທ່ານ', style: AppTextStyles.pageTitle()),
          ),

          // ── Tab bar ──────────────────────────────────────────────────────
          TabBar(
            controller: _tabController,
            labelColor: AppColors.customer,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.customer,
            tabs: [
              Tab(text: 'ກຳລັງດຳເນີນ (${active.length})'),
              Tab(text: 'ປະຫວັດ (${history.length})'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildList(active, emptyMsg: 'ທ່ານຍັງບໍ່ມີອໍເດີທີ່ກຳລັງດຳເນີນ'),
                _buildList(history, emptyMsg: 'ຍັງບໍ່ມີປະຫວັດການສັ່ງຊື້'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> orders, {required String emptyMsg}) {
    if (orders.isEmpty) {
      return AppEmptyState(
        icon: Icons.receipt_long_outlined,
        message: emptyMsg,
        iconColor: AppColors.customer,
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(AppDimens.pagePadding),
      itemCount: orders.length,
      itemBuilder: (_, i) => _buildOrderCard(orders[i]),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: AppShapes.card,
      elevation: AppDimens.cardElevation,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: ID + status badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ອໍເດີ #${order['id']}', style: AppTextStyles.cardTitle()),
                AppStatusBadge.fromStatus(order['status']),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 10),

            // Restaurant & items
            Row(children: [
              Icon(Icons.restaurant, size: 16, color: Colors.grey.shade500),
              const SizedBox(width: 8),
              Text(order['restaurant'], style: AppTextStyles.body()),
            ]),
            const SizedBox(height: 4),
            Row(children: [
              Icon(Icons.shopping_bag_outlined, size: 16, color: Colors.grey.shade500),
              const SizedBox(width: 8),
              Text('${order['items']} • ${order['price']}',
                  style: AppTextStyles.body()),
            ]),
            const SizedBox(height: 10),

            // Footer: date + reorder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order['date'], style: AppTextStyles.caption()),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.replay, size: 16),
                  label: const Text('ສັ່ງອີກຄັ້ງ'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.customer,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
