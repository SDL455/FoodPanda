import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
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
            _buildHeader(),
            _buildCategories(),
            _buildPromotions(),
            _buildRestaurants(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: AppColors.pinkGradient,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(color: AppColors.pink.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 8)),
        ],
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
                    'Deliver to',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13.sp),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Home - 123 Main St',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.glassWhiteLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.glassWhite,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(color: AppColors.shadowLight, blurRadius: 12, offset: const Offset(0, 4)),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for restaurants and food',
                hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 14.sp),
                prefixIcon: Icon(Icons.search, color: AppColors.textGrey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What would you like to eat?',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 80.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(icon: Icons.local_pizza, label: 'Pizza'),
                CategoryItem(icon: Icons.lunch_dining, label: 'Burger'),
                CategoryItem(icon: Icons.rice_bowl, label: 'Asian'),
                CategoryItem(icon: Icons.local_drink, label: 'Drinks'),
                CategoryItem(icon: Icons.cake, label: 'Dessert'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Offers',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 150.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PromoCard(
                  title: '50% OFF',
                  subtitle: 'On first order',
                  color: AppColors.orangeGradient.colors.first,
                ),
                PromoCard(
                  title: 'Free Delivery',
                  subtitle: 'Orders above \$20',
                  color: AppColors.greenGradient.colors.first,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurants() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Restaurants',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          SizedBox(height: 12.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return RestaurantCard(
                name: 'Restaurant ${index + 1}',
                cuisine: 'Italian, Pizza',
                rating: 4.5,
                deliveryTime: '25-30 min',
                imageUrl:
                    'https://images.immediate.co.uk/production/volatile/sites/30/2023/06/Ultraprocessed-food-58d54c3.jpg?quality=90&webp=true&resize=440,400',
              );
            },
          ),
        ],
      ),
    );
  }
}
