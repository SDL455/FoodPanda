import 'package:flutter/material.dart';

class SellerReviewsTab extends StatelessWidget {
  // Mock data for reviews
  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'ວິໄລວັນ ສິດທິມານ',
      'rating': 5,
      'date': 'ມື້ວານນີ້',
      'comment': 'ອາຫານແຊບຫຼາຍ! ສົ້ມຕຳລົດເດັດເຜັດກຳລັງດີ ປິ້ງໄກ່ນາປົ່ງກໍຮ້ອນໆຫອມໆ. ຈະສັ່ງອີກແນ່ນອນ!',
    },
    {
      'name': 'ໄຊຍະພອນ ແກ້ວບົວລາ',
      'rating': 5,
      'date': '2 ມື້ກ່ອນ',
      'comment': 'ປະທັບໃຈຫຼາຍ ເຮັດອາຫານໄວ ແລະ ໄດ້ອາຫານຕາມທີ່ສັ່ງທຸກຢ່າງ ປະລິມານຄຸ້ມຄ່າກັບລາຄາ.',
    },
    {
      'name': 'ເກດມະນີ ແສງອາລຸນ',
      'rating': 4,
      'date': '4 ມື້ກ່ອນ',
      'comment': 'ລົດຊາດດີຫຼາຍ ແຕ່ຢາກໃຫ້ເພີ່ມຜັກກັບແກ້ມໃຫ້ຫຼາຍກວ່າ ນີ້ໜ້ອຍໜຶ່ງ ໂດຍລວມແມ່ນດີເລີດ.',
    },
    {
      'name': 'ພູວົງ ມະນີວັນ',
      'rating': 3,
      'date': '1 ອາທິດກ່ອນ',
      'comment': 'ຕຳໝາກຫຸ່ງເຄັມໄປໜ້ອຍໜຶ່ງ ແຕ່ປິ້ງໄກ່ແຊບຫຼາຍ ຫວັງວ່າຈະປັບປຸງລົດຊາດສົ້ມຕຳໃຫ້ກົມກ່ອມກວ່າ ນີ້.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating Summary Card
          _buildRatingSummaryCard(),
          SizedBox(height: 24),

          // Reviews Section Header
          Text(
            'ຄຳຕິຊົມຈາກລູກຄ້າ (${_reviews.length})',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 12),

          // Reviews List
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _reviews.length,
            itemBuilder: (context, index) {
              final review = _reviews[index];
              return _buildReviewCard(review);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRatingSummaryCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            // Left Column: Big Average Rating
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  _buildStarsRow(4.8, size: 18),
                  SizedBox(height: 8),
                  Text(
                    'ຄະແນນສະເລ່ຍ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '120 ຄຳຕິຊົມ',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Middle: Vertical Divider
            Container(
              height: 100,
              width: 1,
              color: Colors.grey.shade200,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            
            // Right Column: Progress Indicators for each star rating
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildRatingProgressRow(5, 0.82), // 82% are 5 stars
                  _buildRatingProgressRow(4, 0.12), // 12% are 4 stars
                  _buildRatingProgressRow(3, 0.04), // 4% are 3 stars
                  _buildRatingProgressRow(2, 0.01), // 1% are 2 stars
                  _buildRatingProgressRow(1, 0.01), // 1% are 1 star
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingProgressRow(int starRating, double ratio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            '$starRating',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Icon(Icons.star, color: Colors.amber, size: 12),
          SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: ratio,
                backgroundColor: Colors.grey.shade100,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade300),
                minHeight: 6,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            '${(ratio * 100).toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviewer Header (Name, Rating Stars, Date)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2),
                    _buildStarsRow(review['rating'].toDouble(), size: 14),
                  ],
                ),
                Text(
                  review['date'],
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
            SizedBox(height: 12),
            
            // Comment Text
            Text(
              review['comment'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarsRow(double rating, {double size = 16}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: Colors.amber, size: size);
        } else if (index < rating) {
          return Icon(Icons.star_half, color: Colors.amber, size: size);
        } else {
          return Icon(Icons.star_border, color: Colors.amber, size: size);
        }
      }),
    );
  }
}
