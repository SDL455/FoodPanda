import 'package:flutter/material.dart';
import 'package:foodpanda/features/customer/views/widgets/category_item.dart';
import 'package:foodpanda/features/customer/views/widgets/promo_card.dart';
import 'package:foodpanda/features/customer/views/widgets/restaurant_card.dart';

class CustomerHomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade400, Colors.pink.shade600],
                ),
              ),
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
                            'ຈັດສົ່ງໄປທີ່',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'ບ້ານ - 123 ຖະໜົນຫຼັກ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ຄົ້ນຫາຮ້ານອາຫານ ແລະ ເມນູ...',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Categories
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ທ່ານຢາກຮັບປະທານຫຍັງດີ?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryItem(icon: Icons.local_pizza, label: 'ພິດຊ່າ'),
                        CategoryItem(icon: Icons.lunch_dining, label: 'ເບີເກີ'),
                        CategoryItem(icon: Icons.rice_bowl, label: 'ອາຫານລາວ'),
                        CategoryItem(icon: Icons.local_drink, label: 'ເຄື່ອງດື່ມ'),
                        CategoryItem(icon: Icons.cake, label: 'ຂອງຫວານ'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Promotions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ໂປຣໂມຊັນພິເສດ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        PromoCard(
                          title: 'ຫຼຸດ 50%',
                          subtitle: 'ສຳລັບອໍເດີທຳອິດ',
                          color: Colors.orange,
                        ),
                        PromoCard(
                          title: 'ຈັດສົ່ງຟຣີ',
                          subtitle: 'ເມື່ອສັ່ງຊື້ເກີນ 200,000 ກີບ',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Restaurants
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ຮ້ານອາຫານຍອດນິຍົມ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return RestaurantCard(
                        name: 'ຮ້ານອາຫານ ${index + 1}',
                        cuisine: 'ອາຫານລາວ, ສົ້ມຕຳ',
                        rating: 4.8,
                        deliveryTime: '25-30 ນາທີ',
                        imageUrl:
                            'https://images.immediate.co.uk/production/volatile/sites/30/2023/06/Ultraprocessed-food-58d54c3.jpg?quality=90&webp=true&resize=440,400',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
