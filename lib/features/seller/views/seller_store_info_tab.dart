import 'package:flutter/material.dart';

class SellerStoreInfoTab extends StatefulWidget {
  final Map<String, String> storeInfo;
  final ValueChanged<Map<String, String>> onSave;

  const SellerStoreInfoTab({
    required this.storeInfo,
    required this.onSave,
  });

  @override
  _SellerStoreInfoTabState createState() => _SellerStoreInfoTabState();
}

class _SellerStoreInfoTabState extends State<SellerStoreInfoTab> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _phoneController;
  late TextEditingController _hoursController;
  late TextEditingController _addressController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _nameController = TextEditingController(text: widget.storeInfo['name']);
    _categoryController = TextEditingController(text: widget.storeInfo['category']);
    _phoneController = TextEditingController(text: widget.storeInfo['phone']);
    _hoursController = TextEditingController(text: widget.storeInfo['hours']);
    _addressController = TextEditingController(text: widget.storeInfo['address']);
    _descController = TextEditingController(text: widget.storeInfo['desc']);
  }

  @override
  void didUpdateWidget(SellerStoreInfoTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.storeInfo != widget.storeInfo) {
      _initControllers();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _phoneController.dispose();
    _hoursController.dispose();
    _addressController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave({
        'name': _nameController.text.trim(),
        'category': _categoryController.text.trim(),
        'phone': _phoneController.text.trim(),
        'hours': _hoursController.text.trim(),
        'address': _addressController.text.trim(),
        'desc': _descController.text.trim(),
        'rating': widget.storeInfo['rating']!,
        'image': widget.storeInfo['image']!,
      });
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ບັນທຶກຂໍ້ມູນຮ້ານສຳເລັດແລ້ວ!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store Banner Card
            _buildStoreBannerCard(),
            SizedBox(height: 20),

            // Profile Title and Edit Switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ລາຍລະອຽດຮ້ານ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      if (_isEditing) {
                        // Cancel editing, reset controllers
                        _initControllers();
                        _isEditing = false;
                      } else {
                        _isEditing = true;
                      }
                    });
                  },
                  icon: Icon(
                    _isEditing ? Icons.cancel_outlined : Icons.edit_outlined,
                    color: _isEditing ? Colors.red : Colors.pink,
                  ),
                  label: Text(
                    _isEditing ? 'ຍົກເລີກ' : 'ແກ້ໄຂຂໍ້ມູນ',
                    style: TextStyle(
                      color: _isEditing ? Colors.red : Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Store Info Details/Form List
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoField(
                      label: 'ຊື່ຮ້ານອາຫານ',
                      controller: _nameController,
                      icon: Icons.store,
                      isEditable: _isEditing,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນຊື່ຮ້ານ' : null,
                    ),
                    Divider(height: 24),
                    _buildInfoField(
                      label: 'ປະເພດອາຫານ',
                      controller: _categoryController,
                      icon: Icons.restaurant_menu,
                      isEditable: _isEditing,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນປະເພດອາຫານ' : null,
                    ),
                    Divider(height: 24),
                    _buildInfoField(
                      label: 'ເບີໂທຕິດຕໍ່',
                      controller: _phoneController,
                      icon: Icons.phone,
                      isEditable: _isEditing,
                      keyboardType: TextInputType.phone,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນເບີໂທຕິດຕໍ່' : null,
                    ),
                    Divider(height: 24),
                    _buildInfoField(
                      label: 'ເວລາເປີດ - ປິດ',
                      controller: _hoursController,
                      icon: Icons.access_time,
                      isEditable: _isEditing,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນເວລາເປີດ-ປິດ' : null,
                    ),
                    Divider(height: 24),
                    _buildInfoField(
                      label: 'ທີ່ຢູ່ຂອງຮ້ານ',
                      controller: _addressController,
                      icon: Icons.location_on,
                      isEditable: _isEditing,
                      maxLines: 2,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນທີ່ຢູ່' : null,
                    ),
                    Divider(height: 24),
                    _buildInfoField(
                      label: 'ຄຳອະທິບາຍຮ້ານ',
                      controller: _descController,
                      icon: Icons.description,
                      isEditable: _isEditing,
                      maxLines: 3,
                      validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນຄຳອະທິບາຍ' : null,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Save button when editing
            if (_isEditing)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'ບັນທຶກຂໍ້ມູນ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreBannerCard() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1552566626-52f8b828add9?auto=format&fit=crop&q=80&w=600',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Partner Merchant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.storeInfo['name']!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black45,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  '${widget.storeInfo['rating']} (120+ ຣີວິວ)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.access_time, color: Colors.white70, size: 16),
                SizedBox(width: 4),
                Text(
                  widget.storeInfo['hours']!,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool isEditable,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Row(
      crossAxisAlignment:
          maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: maxLines > 1 ? 4 : 0),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.pink, size: 20),
        ),
        SizedBox(width: 16),
        Expanded(
          child: isEditable
              ? TextFormField(
                  controller: controller,
                  maxLines: maxLines,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(color: Colors.pink),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2),
                    ),
                  ),
                  validator: validator,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      controller.text,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: maxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
