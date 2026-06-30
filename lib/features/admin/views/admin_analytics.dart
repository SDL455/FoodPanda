import 'package:flutter/material.dart';

class AdminAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ສະຖິຕິ ແລະ ວິເຄາະຂໍ້ມູນ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ແນວໂນ້ມລາຍຮັບ (Revenue Trends)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'ຕົວຢ່າງແຜນພູມ\n(ລາຍຮັບຕາມຊ່ວງເວລາ)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, height: 1.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ສະຖິຕິການສັ່ງຊື້ (Order Statistics)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'ຕົວຢ່າງແຜນພູມ\n(ການແຈກຢາຍອໍເດີ)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, height: 1.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
