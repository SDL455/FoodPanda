import 'package:flutter/material.dart';
import 'package:foodpanda/features/rider/views/widgets/Profile_menu_item.dart';

class RiderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            SizedBox(height: 16),
            Text(
              'John Rider',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('ລະຫັດຜູ້ຈັດສົ່ງ: RID12345', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                Text(
                  ' ຄະແນນ 4.8',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    icon: Icons.account_circle,
                    title: 'ຂໍ້ມູນສ່ວນຕົວ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.directions_bike,
                    title: 'ຂໍ້ມູນຍານພາຫະນະ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.assessment,
                    title: 'ຜົນງານການແລ່ນ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.payment,
                    title: 'ລາຍລະອຽດການຊຳລະເງິນ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.help,
                    title: 'ຊ່ວຍເຫຼືອ & ສະໜັບສະໜູນ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings,
                    title: 'ການຕັ້ງຄ່າ',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: 'ອອກຈາກລະບົບ',
                    onTap: () {},
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
