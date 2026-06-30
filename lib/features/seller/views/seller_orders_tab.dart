import 'package:flutter/material.dart';

class SellerOrdersTab extends StatefulWidget {
  @override
  _SellerOrdersTabState createState() => _SellerOrdersTabState();
}

class _SellerOrdersTabState extends State<SellerOrdersTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock list of orders
  List<Map<String, dynamic>> _orders = [
    {
      'id': 'FP-9831',
      'customer': 'ສົມພອນ ສິດທິພົນ',
      'items': [
        {'name': 'ຕຳໝາກຫຸ່ງທາດ', 'qty': 1, 'price': 45000},
        {'name': 'ປິ້ງໄກ່ນາປົ່ງ (ໂຕ)', 'qty': 1, 'price': 85000},
        {'name': 'ເຂົ້າໜຽວ', 'qty': 2, 'price': 10000},
      ],
      'total': 150000,
      'time': '10:24',
      'payment': 'ເງິນສົດ (COD)',
      'status': 'new', // new, preparing, ready, delivered
    },
    {
      'id': 'FP-9824',
      'customer': 'ມານີ ວົງສາ',
      'items': [
        {'name': 'ຕຳປູປາແດກ', 'qty': 2, 'price': 30000},
        {'name': 'ປິ້ງໝູສາມຊັ້ນ', 'qty': 3, 'price': 25000},
        {'name': 'ນ້ຳດື່ມບໍລິສຸດ (ໃຫຍ່)', 'qty': 1, 'price': 10000},
      ],
      'total': 145000,
      'time': '10:12',
      'payment': 'BCELOne Pay',
      'status': 'preparing',
    },
    {
      'id': 'FP-9820',
      'customer': 'ອານຸສອນ ແສງຈັນ',
      'items': [
        {'name': 'ຕຳມາມ່າທະເລ', 'qty': 1, 'price': 55000},
        {'name': 'ປິ້ງປີກໄກ່', 'qty': 4, 'price': 15000},
      ],
      'total': 115000,
      'time': '09:45',
      'payment': 'BCELOne Pay',
      'status': 'ready',
    },
    {
      'id': 'FP-9802',
      'customer': 'ແກ້ວມະນີ ຈັນທະລາ',
      'items': [
        {'name': 'ຕຳລາວໃສ່ປູ', 'qty': 1, 'price': 25000},
        {'name': 'ແກງໜໍ່ໄມ້ໃສ່ຍານາງ', 'qty': 1, 'price': 40000},
        {'name': 'ເຂົ້າປຸ້ນ', 'qty': 2, 'price': 10000},
      ],
      'total': 85000,
      'time': '08:30',
      'payment': 'ເງິນສົດ (COD)',
      'status': 'delivered',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateOrderStatus(String orderId, String newStatus) {
    setState(() {
      final orderIndex = _orders.indexWhere((o) => o['id'] == orderId);
      if (orderIndex != -1) {
        _orders[orderIndex]['status'] = newStatus;
      }
    });

    String message = '';
    if (newStatus == 'preparing') message = 'ຍອມຮັບອໍເດີ ແລະ ກຳລັງປຸງແຕ່ງ';
    if (newStatus == 'ready') message = 'ອາຫານປຸງແຕ່ງສຳເລັດແລ້ວ! ແຈ້ງເຕືອນໄຮເດີ';
    if (newStatus == 'delivered') message = 'ມອບອໍເດີໃຫ້ໄຮເດີ/ລູກຄ້າສຳເລັດ';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message ($orderId)'),
        backgroundColor: Colors.pink.shade700,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Header
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey.shade600,
            indicatorColor: Colors.pink,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'ທັງໝົດ (${_orders.length})'),
              Tab(text: 'ໃໝ່ (${_orders.where((o) => o['status'] == 'new').length})'),
              Tab(text: 'ກຳລັງເຮັດ (${_orders.where((o) => o['status'] == 'preparing').length})'),
              Tab(text: 'ພ້ອມສົ່ງ (${_orders.where((o) => o['status'] == 'ready').length})'),
              Tab(text: 'ສົ່ງແລ້ວ (${_orders.where((o) => o['status'] == 'delivered').length})'),
            ],
          ),
        ),
        
        // Tab Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildOrdersList('all'),
              _buildOrdersList('new'),
              _buildOrdersList('preparing'),
              _buildOrdersList('ready'),
              _buildOrdersList('delivered'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersList(String filterStatus) {
    final filteredOrders = filterStatus == 'all'
        ? _orders
        : _orders.where((o) => o['status'] == filterStatus).toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade300),
            SizedBox(height: 12),
            Text(
              'ບໍ່ມີລາຍການອໍເດີໃນເວລານີ້',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    Color statusColor;
    String statusText;

    switch (order['status']) {
      case 'new':
        statusColor = Colors.blue;
        statusText = 'ອໍເດີໃໝ່';
        break;
      case 'preparing':
        statusColor = Colors.orange;
        statusText = 'ກຳລັງປຸງແຕ່ງ';
        break;
      case 'ready':
        statusColor = Colors.teal;
        statusText = 'ພ້ອມສົ່ງ';
        break;
      case 'delivered':
        statusColor = Colors.grey;
        statusText = 'ສົ່ງແລ້ວ';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'ບໍ່ລະບຸ';
    }

    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row (ID, Time, Status Tag)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      order['id'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade700,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '• ${order['time']}',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withOpacity(0.3)),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 24),
            
            // Customer Info
            Row(
              children: [
                Icon(Icons.person_outline, size: 18, color: Colors.grey.shade600),
                SizedBox(width: 8),
                Text(
                  'ລູກຄ້າ: ',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                Text(
                  order['customer'],
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            
            // Ordered Items
            Text(
              'ລາຍການອາຫານ:',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Column(
              children: (order['items'] as List).map<Widget>((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item['qty']}x  ${item['name']}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${(item['price'] * item['qty'] / 1000).toStringAsFixed(0)}K ກີບ',
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Divider(height: 24),
            
            // Footer Info (Payment, Total, Actions)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ການຊຳລະ: ${order['payment']}',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'ລວມທັງໝົດ:',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                    ),
                    Text(
                      '${(order['total'] / 1000).toStringAsFixed(0)}K ກີບ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                _buildActionButtons(order),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(Map<String, dynamic> order) {
    if (order['status'] == 'new') {
      return ElevatedButton(
        onPressed: () => _updateOrderStatus(order['id'], 'preparing'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Text('ຍອມຮັບອໍເດີ'),
      );
    } else if (order['status'] == 'preparing') {
      return ElevatedButton(
        onPressed: () => _updateOrderStatus(order['id'], 'ready'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Text('ປຸງແຕ່ງສຳເລັດ'),
      );
    } else if (order['status'] == 'ready') {
      return ElevatedButton(
        onPressed: () => _updateOrderStatus(order['id'], 'delivered'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        child: Text('ມອບໃຫ້ໄຮເດີ'),
      );
    }
    
    // Delivered
    return OutlinedButton.icon(
      onPressed: null,
      icon: Icon(Icons.check, size: 16, color: Colors.grey),
      label: Text('ສົ່ງຮຽບຮ້ອຍ', style: TextStyle(color: Colors.grey)),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
