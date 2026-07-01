import 'package:flutter/material.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';

class SellerHomeTab extends StatefulWidget {
  final bool isStoreOpen;
  final ValueChanged<bool> onStatusChanged;

  const SellerHomeTab({
    required this.isStoreOpen,
    required this.onStatusChanged,
  });

  @override
  _SellerHomeTabState createState() => _SellerHomeTabState();
}

class _SellerHomeTabState extends State<SellerHomeTab> {
  // Mock data for weekly sales
  final List<double> _weeklySalesData = [
    450000,
    680000,
    520000,
    890000,
    1100000,
    1450000,
    1250000,
  ];
  final List<String> _weeklyDays = [
    'ຈັນ',
    'ອັງ',
    'ພຸດ',
    'ພະ',
    'ສຸກ',
    'ເສົາ',
    'ທິດ',
  ];

  double get _maxSale =>
      _weeklySalesData.reduce((curr, next) => curr > next ? curr : next);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Card
          _buildWelcomeHeader(),
          SizedBox(height: 16),

          // Open / Close Status Controller
          _buildStatusToggleCard(),
          SizedBox(height: 20),

          // Quick Stats Row & Grid
          const AppSectionHeader('ສະຫຼຸບຜົນງານມື້ນີ້'),
          SizedBox(height: 12),
          _buildMetricsGrid(),
          SizedBox(height: 24),

          // Sales Chart Card
          _buildSalesChartCard(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ສະບາຍດີ, ຜູ້ຮ່ວມຄ້າ!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'ຍິນດີຕ້ອນຮັບກັບຄືນ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade700,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.pink.shade100,
          child: Icon(Icons.store, color: Colors.pink, size: 28),
        ),
      ],
    );
  }

  Widget _buildStatusToggleCard() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.isStoreOpen
              ? [Colors.green.shade600, Colors.teal.shade500]
              : [Colors.grey.shade700, Colors.grey.shade500],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (widget.isStoreOpen ? Colors.green : Colors.grey)
                .withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.isStoreOpen ? Icons.check_circle : Icons.do_not_disturb_on,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isStoreOpen
                      ? 'ຮ້ານກຳລັງເປີດບໍລິການ'
                      : 'ຮ້ານປິດບໍລິການຊົ່ວຄາວ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.isStoreOpen
                      ? 'ລູກຄ້າສາມາດສັ່ງອາຫານໄດ້ຕາມປົກກະຕິ'
                      : 'ປິດການຮັບອໍເດີຈາກລູກຄ້າໃນເວລານີ້',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 1.1,
            child: Switch(
              value: widget.isStoreOpen,
              activeColor: Colors.white,
              activeTrackColor: Colors.green.shade900.withOpacity(0.5),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.black26,
              onChanged: widget.onStatusChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'ຈຳນວນ Order ມື້ນີ້',
                value: '24 ອໍເດີ',
                icon: Icons.shopping_bag_outlined,
                iconColor: Colors.blue.shade700,
                bgColor: Colors.blue.shade50,
                trend: '+12% ຈາກມື້ວານ',
                trendColor: Colors.green,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                title: 'ລາຍຮັບມື້ນີ້',
                value: '1.45M ກີບ',
                icon: Icons.monetization_on_outlined,
                iconColor: Colors.deepOrange.shade700,
                bgColor: Colors.deepOrange.shade50,
                trend: '+8.4% ຈາກມື້ວານ',
                trendColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        _buildFullWidthMetricCard(
          title: 'ຄະແນນລວມຂອງຮ້ານ (Rating)',
          value: '4.8 / 5.0',
          subtitle: 'ອີງຕາມຄຳຕິຊົມຈາກລູກຄ້າ 120 ຄົນ',
          icon: Icons.star_rounded,
          iconColor: Colors.amber.shade700,
          bgColor: Colors.amber.shade50,
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String trend,
    required Color trendColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                Icon(Icons.trending_up, color: trendColor, size: 20),
              ],
            ),
            SizedBox(height: 16),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            SizedBox(height: 4),
            Text(
              trend,
              style: TextStyle(
                fontSize: 10,
                color: trendColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullWidthMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 36),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade400,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChartCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ສະຖິຕິຍອດຂາຍປະຈຳອາທິດ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'ຍອດຂາຍລວມ: 6,340,000 ກີບ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.pink.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'ອາທິດນີ້',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Custom Animated Bar Chart Graph
            Container(
              height: 180,
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(_weeklySalesData.length, (index) {
                  final sale = _weeklySalesData[index];
                  final ratio = sale / _maxSale;

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Tooltip or value text on top of bar
                        Text(
                          '${(sale / 1000).toStringAsFixed(0)}K',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        // Bar with animated scale
                        Expanded(
                          child: TweenAnimationBuilder<double>(
                            duration: Duration(
                              milliseconds: 800 + (index * 100),
                            ),
                            curve: Curves.easeOutBack,
                            tween: Tween(begin: 0.0, end: ratio),
                            builder: (context, val, child) {
                              return FractionallySizedBox(
                                heightFactor: val,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.pink.shade400,
                                        Colors.pink.shade200,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.pink.withOpacity(0.15),
                                        blurRadius: 4,
                                        offset: Offset(0, -2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        // Day Label
                        Text(
                          _weeklyDays[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
