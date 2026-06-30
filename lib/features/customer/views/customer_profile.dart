import 'package:flutter/material.dart';
import 'package:foodpanda/features/rider/views/widgets/Profile_menu_item.dart';

/// Updated `CustomerProfile` screen that navigates to dedicated pages for each
/// menu item. Each destination page contains a clean, modern UI scaffold that
/// you can further extend with real data or business logic.
class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://images.immediate.co.uk/production/volatile/sites/30/2023/06/Ultraprocessed-food-58d54c3.jpg?quality=90&webp=true&resize=440,400',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'john.doe@email.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    icon: Icons.location_on,
                    title: 'ທີ່ຢູ່ຂອງຂ້ອຍ',
                    onTap: () => _goto(context, const AddressesPage()),
                  ),
                  ProfileMenuItem(
                    icon: Icons.payment,
                    title: 'ວິທີການຊຳລະເງິນ',
                    onTap: () => _goto(context, const PaymentMethodsPage()),
                  ),
                  ProfileMenuItem(
                    icon: Icons.notifications,
                    title: 'ການແຈ້ງເຕືອນ',
                    onTap: () => _goto(context, const NotificationsPage()),
                  ),
                  ProfileMenuItem(
                    icon: Icons.help,
                    title: 'ຊ່ວຍເຫຼືອ & ສະໜັບສະໜູນ',
                    onTap: () => _goto(context, const HelpSupportPage()),
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings,
                    title: 'ການຕັ້ງຄ່າ',
                    onTap: () => _goto(context, const SettingsPage()),
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: 'ອອກຈາກລະບົບ',
                    onTap: () => _confirmLogout(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goto(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('ອອກຈາກລະບົບ'),
        content: const Text('ທ່ານແນ່ໃຈບໍວ່າຕ້ອງການອອກຈາກລະບົບ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('ຍົກເລີກ'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            child: const Text('ອອກຈາກລະບົບ'),
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
      appBar: AppBar(
        title: const Text('ທີ່ຢູ່ຂອງຂ້ອຍ'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: 3,
        itemBuilder: (_, i) => Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            title: Text('ບ້ານ #${i + 1}'),
            subtitle: const Text('123 ຖະໜົນຫຼັກ, ນະຄອນຫຼວງວຽງຈັນ'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.pink),
              onPressed: () {},
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        tooltip: 'ເພີ່ມທີ່ຢູ່',
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
      appBar: AppBar(
        title: const Text('ວິທີການຊຳລະເງິນ'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            title: 'Visa **** 4242',
            subtitle: 'ໝົດອາຍຸ 12/25',
            brandIcon: Icons.credit_card,
          ),
          const SizedBox(height: 12),
          _buildCard(
            context,
            title: 'MasterCard **** 1111',
            subtitle: 'ໝົດອາຍຸ 03/26',
            brandIcon: Icons.credit_card,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        tooltip: 'ເພີ່ມບັດ',
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(brandIcon, size: 32, color: Colors.pink),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(icon: const Icon(Icons.edit, color: Colors.pink), onPressed: () {}),
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
      appBar: AppBar(
        title: const Text('ການແຈ້ງເຕືອນ'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: orderUpdates,
            activeColor: Colors.pink,
            title: const Text('ອັບເດດອໍເດີ'),
            subtitle: const Text('ຮັບຂໍ້ມູນອັບເດດກ່ຽວກັບອໍເດີຂອງທ່ານ'),
            onChanged: (val) => setState(() => orderUpdates = val),
          ),
          SwitchListTile(
            value: promos,
            activeColor: Colors.pink,
            title: const Text('ໂປຣໂມຊັນ'),
            subtitle: const Text('ຮັບຂໍ້ມູນໂປຣໂມຊັນ ແລະ ຂໍ້ສະເໜີພິເສດ'),
            onChanged: (val) => setState(() => promos = val),
          ),
          SwitchListTile(
            value: appUpdates,
            activeColor: Colors.pink,
            title: const Text('ອັບເດດແອັບ'),
            subtitle: const Text('ຮັບການແຈ້ງເຕືອນເມື່ອມີຟີເຈີໃໝ່'),
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
      appBar: AppBar(
        title: const Text('ຊ່ວຍເຫຼືອ & ສະໜັບສະໜູນ'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _faqTile('ວິທີການສັ່ງຊື້ອໍເດີ?'),
          _faqTile('ວິທີການຕິດຕາມການຈັດສົ່ງ?'),
          _faqTile('ນະໂຍບາຍການຄືນເງິນ'),
          _faqTile('ຕິດຕໍ່ຝ່າຍບໍລິການລູກຄ້າ'),
        ],
      ),
    );
  }

  Widget _faqTile(String question) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      title: Text(question),
      trailing: const Icon(Icons.chevron_right, color: Colors.pink),
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
      appBar: AppBar(
        title: const Text('ການຕັ້ງຄ່າ'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'ຊື່',
                labelStyle: TextStyle(color: Colors.pink),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'ອີເມວ',
                labelStyle: TextStyle(color: Colors.pink),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: save settings
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('ບັນທຶກການປ່ຽນແປງ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
