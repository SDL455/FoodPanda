import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';
import 'package:foodpanda/shared/widgets/app_empty_state.dart';

class CustomerSearch extends StatefulWidget {
  const CustomerSearch({super.key});

  @override
  State<CustomerSearch> createState() => _CustomerSearchState();
}

class _CustomerSearchState extends State<CustomerSearch> {
  final _controller = TextEditingController();
  String _query = '';

  final List<String> _recent = ['ພິດຊ່າ', 'ເບີເກີຄິງ', 'ສົ້ມຕຳ', 'ໝູຍ່າງ'];
  final List<Map<String, String>> _popular = [
    {'name': 'ຮ້ານ ຕຳແຊບ',    'tag': 'ອາຫານລາວ'},
    {'name': 'ຮ້ານ Pizza House', 'tag': 'ຝາລັ່ງ'},
    {'name': 'ໂຊກດີ Burger',    'tag': 'ເບີເກີ'},
    {'name': 'ຮ້ານ ໜໍ່ໄມ້ ດົງ', 'tag': 'ອາຫານລາວ'},
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _popular
        .where((r) =>
            _query.isEmpty ||
            r['name']!.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ຄົ້ນຫາ', style: AppTextStyles.pageTitle()),
            const SizedBox(height: 16),

            // ── Search field ─────────────────────────────────────────────
            TextField(
              controller: _controller,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'ຄົ້ນຫາຮ້ານ, ອາຫານ, ຫຼື ເມນູ...',
                prefixIcon: const Icon(Icons.search, color: AppColors.customer),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() {
                          _query = '';
                          _controller.clear();
                        }),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                  borderSide: const BorderSide(color: AppColors.customer, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 24),

            // ── Recent searches (only when not typing) ───────────────────
            if (_query.isEmpty) ...[
              AppSectionHeader(
                'ການຄົ້ນຫາຫຼ້າສຸດ',
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('ລ້າງທັງໝົດ',
                      style: TextStyle(color: AppColors.customer)),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _recent
                    .map((term) => GestureDetector(
                          onTap: () => setState(() {
                            _query = term;
                            _controller.text = term;
                          }),
                          child: Chip(
                            avatar: const Icon(Icons.history, size: 16),
                            label: Text(term),
                            backgroundColor: Colors.grey.shade100,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
            ],

            // ── Results / Popular restaurants ────────────────────────────
            AppSectionHeader(_query.isEmpty ? 'ຮ້ານຍອດນິຍົມ' : 'ຜົນການຄົ້ນຫາ'),
            const SizedBox(height: 12),

            Expanded(
              child: filtered.isEmpty
                  ? AppEmptyState(
                      icon: Icons.search_off,
                      message: 'ບໍ່ພົບຜົນສຳລັບ "$_query"',
                      subMessage: 'ລອງໃຊ້ຄຳຄົ້ນຫາອື່ນ',
                      iconColor: AppColors.customer,
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (_, i) {
                        final r = filtered[i];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.customer.withOpacity(0.1),
                            child: const Icon(Icons.restaurant,
                                color: AppColors.customer),
                          ),
                          title: Text(r['name']!, style: AppTextStyles.cardTitle()),
                          subtitle: Text(r['tag']!, style: AppTextStyles.caption()),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
