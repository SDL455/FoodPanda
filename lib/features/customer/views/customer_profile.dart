import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/features/rider/views/widgets/profile_menu_item.dart';
import 'package:foodpanda/routes/customer/customer_routes.dart';
import 'package:get/get.dart';

class CustomerProfile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildProfileCard(),
            SizedBox(height: 24.h),
            _buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: AppColors.pinkGradient,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.pink.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.glassWhiteLight,
            backgroundImage: user?.photoURL != null
                ? NetworkImage(user!.photoURL!)
                : null,
            child: user?.photoURL == null
                ? Icon(Icons.person, size: 40.sp, color: Colors.white)
                : null,
          ),
          SizedBox(height: 12.h),
          Text(
            user?.displayName ?? '',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4.h),
          Text(
            user?.email ?? '',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.location_on,
          title: 'Addresses',
          onTap: () => _goto(context, const AddressesPage()),
        ),
        ProfileMenuItem(
          icon: Icons.payment,
          title: 'Payment Methods',
          onTap: () => _goto(context, const PaymentMethodsPage()),
        ),
        ProfileMenuItem(
          icon: Icons.notifications,
          title: 'Notifications',
          onTap: () => _goto(context, const NotificationsPage()),
        ),
        ProfileMenuItem(
          icon: Icons.help,
          title: 'Help & Support',
          onTap: () => _goto(context, const HelpSupportPage()),
        ),
        ProfileMenuItem(
          icon: Icons.settings,
          title: 'Settings',
          onTap: () => _goto(context, const SettingsPage()),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(Icons.logout, color: AppColors.red),
            title: Text('Logout', style: TextStyle(fontSize: 15.sp, color: AppColors.red)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.textGrey),
            onTap: () => _confirmLogout(context),
          ),
        ),
      ],
    );
  }

  void _goto(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cancel', style: TextStyle(color: AppColors.textGrey)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.pinkGradient,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(CustomerRoutes.login);
              },
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemCount: 3,
        itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(Icons.location_on, color: AppColors.pink),
            title: Text('Home #${i + 1}', style: TextStyle(color: AppColors.textDark)),
            subtitle: const Text('123 Main St, Springfield', style: TextStyle(color: AppColors.textGrey)),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: AppColors.pink),
              onPressed: () {},
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Address',
        backgroundColor: AppColors.pink,
        child: const Icon(Icons.add_location_alt_outlined, color: Colors.white),
      ),
    );
  }
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _buildCard(
            title: 'Visa **** 4242',
            subtitle: 'Expires 12/25',
            brandIcon: Icons.credit_card,
          ),
          SizedBox(height: 12.h),
          _buildCard(
            title: 'MasterCard **** 1111',
            subtitle: 'Expires 03/26',
            brandIcon: Icons.credit_card,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Card',
        backgroundColor: AppColors.pink,
        child: const Icon(Icons.add_card, color: Colors.white),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData brandIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(brandIcon, size: 32.sp, color: AppColors.pink),
        title: Text(title, style: TextStyle(color: AppColors.textDark)),
        subtitle: Text(subtitle, style: TextStyle(color: AppColors.textGrey)),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: AppColors.pink),
          onPressed: () {},
        ),
      ),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool orderUpdates = true;
  bool promos = true;
  bool appUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _buildSwitchTile(
            value: orderUpdates,
            title: 'Order Updates',
            subtitle: 'Get updates on your orders',
            onChanged: (val) => setState(() => orderUpdates = val),
          ),
          SizedBox(height: 12.h),
          _buildSwitchTile(
            value: promos,
            title: 'Promotions',
            subtitle: 'Receive promotional emails and push',
            onChanged: (val) => setState(() => promos = val),
          ),
          SizedBox(height: 12.h),
          _buildSwitchTile(
            value: appUpdates,
            title: 'App Updates',
            subtitle: 'Be notified of new features',
            onChanged: (val) => setState(() => appUpdates = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required bool value,
    required String title,
    required String subtitle,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SwitchListTile(
        value: value,
        title: Text(title, style: TextStyle(color: AppColors.textDark)),
        subtitle: Text(subtitle, style: TextStyle(color: AppColors.textGrey)),
        activeColor: AppColors.pink,
        onChanged: onChanged,
      ),
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _faqTile('How to place an order?'),
          SizedBox(height: 12.h),
          _faqTile('How to track my delivery?'),
          SizedBox(height: 12.h),
          _faqTile('Refund policy'),
          SizedBox(height: 12.h),
          _faqTile('Contact customer service'),
        ],
      ),
    );
  }

  Widget _faqTile(String question) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(question, style: TextStyle(color: AppColors.textDark)),
        trailing: Icon(Icons.chevron_right, color: AppColors.textGrey),
        onTap: () {},
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: 'John Doe');
    final emailController = TextEditingController(text: 'john.doe@email.com');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: AppColors.textGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.pink),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.textGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: AppColors.pink),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.pinkGradient,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.pink.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: Text('Save Changes', style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
