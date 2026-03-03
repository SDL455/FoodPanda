import 'package:flutter/material.dart';
import 'package:foodpanda/features/auth/controllers/auth_controller.dart';
import 'package:foodpanda/features/auth/views/customer_login_page.dart';
import 'package:foodpanda/features/rider/views/widgets/profile_menu_item.dart';
import 'package:get/get.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.isRegistered<AuthController>()
        ? Get.find<AuthController>()
        : Get.put(AuthController(), permanent: true);

    return Obx(() {
      final user = auth.user.value;
      if (user == null) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.person_outline,
                        size: 52,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'ກະລຸນາເຂົ້າສູ່ລະບົບ',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ເຂົ້າສູ່ລະບົບເພື່ອເບິ່ງຂໍ້ມູນໂປຣໄຟລ໌ ແລະ ຈັດການການຕັ້ງຄ່າ.',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            Get.to(() => const CustomerLoginPage()),
                        icon: const Icon(Icons.login),
                        label: const Text('ເຂົ້າສູ່ລະບົບ'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      final name = user.displayName?.trim().isNotEmpty == true
          ? user.displayName!.trim()
          : 'Customer';
      final email = user.email?.trim().isNotEmpty == true
          ? user.email!.trim()
          : 'No email';
      final photoUrl = user.photoURL;

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: photoUrl == null || photoUrl.isEmpty
                    ? null
                    : NetworkImage(photoUrl),
                child: photoUrl == null || photoUrl.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(email, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
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
                    ProfileMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () => _confirmLogout(context, auth),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _goto(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  void _confirmLogout(BuildContext context, AuthController auth) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await auth.signOut();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

//───────────────────────────────────────────────────────────────────────────────
//  ADDRESSES PAGE
//───────────────────────────────────────────────────────────────────────────────

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Addresses')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: 3,
        itemBuilder: (_, i) => Card(
          child: ListTile(
            title: Text('Home #${i + 1}'),
            subtitle: const Text('123 Main St, Springfield'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Address',
        child: const Icon(Icons.add_location_alt_outlined),
      ),
    );
  }
}

//───────────────────────────────────────────────────────────────────────────────
//  PAYMENT METHODS PAGE
//───────────────────────────────────────────────────────────────────────────────

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            title: 'Visa **** 4242',
            subtitle: 'Expires 12/25',
            brandIcon: Icons.credit_card,
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'MasterCard **** 1111',
            subtitle: 'Expires 03/26',
            brandIcon: Icons.credit_card,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Card',
        child: const Icon(Icons.add_card),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData brandIcon,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(brandIcon, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
      ),
    );
  }
}

//───────────────────────────────────────────────────────────────────────────────
//  NOTIFICATIONS PAGE
//───────────────────────────────────────────────────────────────────────────────

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
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: [
          SwitchListTile(
            value: orderUpdates,
            title: const Text('Order Updates'),
            subtitle: const Text('Get updates on your orders'),
            onChanged: (val) => setState(() => orderUpdates = val),
          ),
          SwitchListTile(
            value: promos,
            title: const Text('Promotions'),
            subtitle: const Text('Receive promotional emails and push'),
            onChanged: (val) => setState(() => promos = val),
          ),
          SwitchListTile(
            value: appUpdates,
            title: const Text('App Updates'),
            subtitle: const Text('Be notified of new features'),
            onChanged: (val) => setState(() => appUpdates = val),
          ),
        ],
      ),
    );
  }
}

//───────────────────────────────────────────────────────────────────────────────
//  HELP & SUPPORT PAGE
//───────────────────────────────────────────────────────────────────────────────

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _faqTile('How to place an order?'),
          _faqTile('How to track my delivery?'),
          _faqTile('Refund policy'),
          _faqTile('Contact customer service'),
        ],
      ),
    );
  }

  Widget _faqTile(String question) => Card(
    child: ListTile(
      title: Text(question),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: navigate to FAQ detail or open a webview
      },
    ),
  );
}

//───────────────────────────────────────────────────────────────────────────────
//  SETTINGS PAGE
//───────────────────────────────────────────────────────────────────────────────

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: 'John Doe');
    final emailController = TextEditingController(text: 'john.doe@email.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: save settings
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
