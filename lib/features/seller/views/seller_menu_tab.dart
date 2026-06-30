import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerMenuTab extends StatefulWidget {
  @override
  _SellerMenuTabState createState() => _SellerMenuTabState();
}

class _SellerMockFoodItem {
  final String id;
  final String name;
  final double price;
  final String category;
  final String? imageUrl;
  final File? imageFile;

  _SellerMockFoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.imageUrl,
    this.imageFile,
  });
}

class _SellerMenuTabState extends State<SellerMenuTab> {
  String _searchQuery = '';
  
  // Initial categories list
  List<String> _categories = ['ສົ້ມຕຳ', 'ປິ້ງ/ຍ່າງ', 'ຕົ້ມ/ແກງ', 'ເຄື່ອງດື່ມ'];

  // Initial mock food items list
  List<_SellerMockFoodItem> _menuItems = [
    _SellerMockFoodItem(
      id: 'm-1',
      name: 'ຕຳໝາກຫຸ່ງທາດ',
      price: 45000,
      category: 'ສົ້ມຕຳ',
      imageUrl: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&q=80&w=300',
    ),
    _SellerMockFoodItem(
      id: 'm-2',
      name: 'ປິ້ງໄກ່ນາປົ່ງ (ໂຕ)',
      price: 85000,
      category: 'ປິ້ງ/ຍ່າງ',
      imageUrl: 'https://images.unsplash.com/photo-1598515214211-89d3e73ae83b?auto=format&fit=crop&q=80&w=300',
    ),
    _SellerMockFoodItem(
      id: 'm-3',
      name: 'ແກງໜໍ່ໄມ້ໃສ່ຍານາງ',
      price: 40000,
      category: 'ຕົ້ມ/ແກງ',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&q=80&w=300',
    ),
    _SellerMockFoodItem(
      id: 'm-4',
      name: 'ນ້ຳໝາກພ້າວປັ່ນ',
      price: 15000,
      category: 'ເຄື່ອງດື່ມ',
      imageUrl: 'https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&q=80&w=300',
    ),
  ];

  // Preset sample food images for testing
  final List<String> _sampleImages = [
    'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&q=80&w=300', // Som Tum
    'https://images.unsplash.com/photo-1598515214211-89d3e73ae83b?auto=format&fit=crop&q=80&w=300', // Roast Chicken/Meat
    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&q=80&w=300', // Soup/Curry
    'https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&q=80&w=300', // Juice/Drinks
    'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&q=80&w=300', // Dessert
    'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&q=80&w=300', // Rice Dish
  ];

  void _showAddFoodBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _AddFoodSheet(
          categories: _categories,
          sampleImages: _sampleImages,
          onAddCategory: (newCat) {
            setState(() {
              _categories.add(newCat);
            });
          },
          onAddItem: (name, price, category, file, mockUrl) {
            setState(() {
              _menuItems.insert(
                0,
                _SellerMockFoodItem(
                  id: 'm-${_menuItems.length + 1}',
                  name: name,
                  price: price,
                  category: category,
                  imageFile: file,
                  imageUrl: mockUrl,
                ),
              );
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ເພີ່ມລາຍການອາຫານ "$name" ສຳເລັດແລ້ວ!'),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },
    );
  }

  void _deleteFoodItem(String id) {
    setState(() {
      _menuItems.removeWhere((item) => item.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ລຶບລາຍການອາຫານຮຽບຮ້ອຍ'),
        backgroundColor: Colors.grey.shade800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter items based on search query
    final filteredItems = _menuItems.where((item) {
      return item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddFoodBottomSheet,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add),
        label: Text('ເພີ່ມອາຫານ', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          // Search & Filter Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'ຄົ້ນຫາລາຍການອາຫານ...',
                      prefixIcon: Icon(Icons.search, color: Colors.pink),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // List of Foods grouped by Category
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant_menu, size: 64, color: Colors.grey.shade300),
                        SizedBox(height: 12),
                        Text(
                          'ບໍ່ພົບລາຍການອາຫານ',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 80), // leave space for FAB
                    itemCount: _categories.length,
                    itemBuilder: (context, catIndex) {
                      final category = _categories[catIndex];
                      final catItems = filteredItems.where((item) => item.category == category).toList();
                      
                      if (catItems.isEmpty) return SizedBox.shrink();
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category Title Badge
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '(${catItems.length})',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          
                          // Food Items List in Category
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: catItems.length,
                            itemBuilder: (context, itemIndex) {
                              final item = catItems[itemIndex];
                              return _buildFoodItemCard(item);
                            },
                          ),
                          SizedBox(height: 12),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItemCard(_SellerMockFoodItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Food Image Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 70,
                height: 70,
                color: Colors.grey.shade100,
                child: item.imageFile != null
                    ? Image.file(item.imageFile!, fit: BoxFit.cover)
                    : (item.imageUrl != null
                        ? Image.network(item.imageUrl!, fit: BoxFit.cover, errorBuilder: (c, e, s) {
                            return Icon(Icons.fastfood, color: Colors.pink.shade100);
                          })
                        : Icon(Icons.fastfood, color: Colors.pink.shade100)),
              ),
            ),
            SizedBox(width: 16),
            
            // Name and Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${(item.price / 1000).toStringAsFixed(0)}K ກີບ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.pink.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.category,
                      style: TextStyle(fontSize: 10, color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            
            // Actions
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('ລຶບລາຍການອາຫານ'),
                    content: Text('ທ່ານຕ້ອງການລຶບລາຍການ "${item.name}" ແທ້ຫຼືບໍ່?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('ຍົກເລີກ', style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _deleteFoodItem(item.id);
                        },
                        child: Text('ລຶບ', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for the Add Food Sheet
class _AddFoodSheet extends StatefulWidget {
  final List<String> categories;
  final List<String> sampleImages;
  final ValueChanged<String> onAddCategory;
  final Function(String, double, String, File?, String?) onAddItem;

  const _AddFoodSheet({
    required this.categories,
    required this.sampleImages,
    required this.onAddCategory,
    required this.onAddItem,
  });

  @override
  __AddFoodSheetState createState() => __AddFoodSheetState();
}

class __AddFoodSheetState extends State<_AddFoodSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  
  String? _selectedCategory;
  File? _selectedImageFile;
  String? _selectedMockImageUrl;
  
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      _selectedCategory = widget.categories.first;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (image != null) {
        setState(() {
          _selectedImageFile = File(image.path);
          _selectedMockImageUrl = null;
        });
      }
    } catch (e) {
      // In case of platform exceptions (e.g. on desktop windows or emulator without camera permission setup)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ບໍ່ສາມາດເປີດແກເລີຣີໄດ້. ກະລຸນາເລືອກຮູບຕົວຢ່າງດ້ານລຸ່ມແທນ.'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  void _showNewCategoryDialog() {
    final catController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('ເພີ່ມປະເພດອາຫານໃໝ່'),
          content: TextField(
            controller: catController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'ປ້ອນຊື່ປະເພດ (e.g. ຂອງຫວານ)',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ຍົກເລີກ', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                final text = catController.text.trim();
                if (text.isNotEmpty) {
                  widget.onAddCategory(text);
                  setState(() {
                    _selectedCategory = text;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('ເພີ່ມປະເພດ', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ກະລຸນາເລືອກປະເພດອາຫານ')),
        );
        return;
      }
      
      final price = double.tryParse(_priceController.text) ?? 0.0;
      
      widget.onAddItem(
        _nameController.text.trim(),
        price,
        _selectedCategory!,
        _selectedImageFile,
        _selectedMockImageUrl ?? widget.sampleImages[0], // fallback image
      );
      
      Navigator.pop(context); // close bottom sheet
    }
  }

  @override
  Widget build(BuildContext context) {
    // Keep it responsive when keyboard is up
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 20, 16, bottomInset + 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Sheet handle/title
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'ເພີ່ມລາຍການອາຫານໃໝ່',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink.shade800),
              ),
              SizedBox(height: 16),
              
              // Image Picker Section
              Text(
                'ຮູບພາບອາຫານ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade700),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: _selectedImageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(_selectedImageFile!, fit: BoxFit.cover),
                            )
                          : (_selectedMockImageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(_selectedMockImageUrl!, fit: BoxFit.cover),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_photo_alternate, color: Colors.pink, size: 36),
                                    SizedBox(height: 4),
                                    Text('ອັບໂຫຼດຮູບ', style: TextStyle(fontSize: 10, color: Colors.pink, fontWeight: FontWeight.bold)),
                                  ],
                                )),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ເລືອກອັບໂຫຼດຈາກແກເລີຣີ ຫຼື ເລືອກຮູບຕົວຢ່າງດ້ານລຸ່ມ',
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: _pickImage,
                          icon: Icon(Icons.image_search, size: 16, color: Colors.pink),
                          label: Text('ເລືອກຮູບຈາກເຄື່ອງ', style: TextStyle(color: Colors.pink, fontSize: 12)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.pink),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              
              // Horizontal Scrollable Sample Mock Images Grid
              Text(
                'ຫຼື ເລືອກຮູບຕົວຢ່າງທີ່ມີໃຫ້:',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
              SizedBox(height: 6),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.sampleImages.length,
                  itemBuilder: (context, idx) {
                    final imgUrl = widget.sampleImages[idx];
                    final isSelected = _selectedMockImageUrl == imgUrl && _selectedImageFile == null;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMockImageUrl = imgUrl;
                          _selectedImageFile = null;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isSelected ? Colors.pink : Colors.transparent,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(imgUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              
              // Food Name Form Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'ຊື່ອາຫານ *',
                  labelStyle: TextStyle(color: Colors.pink),
                  prefixIcon: Icon(Icons.fastfood_outlined, color: Colors.pink),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
                validator: (val) => val!.trim().isEmpty ? 'ກະລຸນາປ້ອນຊື່ອາຫານ' : null,
              ),
              SizedBox(height: 16),
              
              // Price Form Field
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ລາຄາ (ກີບ) *',
                  labelStyle: TextStyle(color: Colors.pink),
                  prefixIcon: Icon(Icons.monetization_on_outlined, color: Colors.pink),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
                validator: (val) {
                  if (val!.trim().isEmpty) return 'ກະລຸນາປ້ອນລາຄາອາຫານ';
                  if (double.tryParse(val.trim()) == null) return 'ລາຄາຕ້ອງເປັນຕົວເລກເທົ່ານັ້ນ';
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Category Row (Dropdown and Create Category Button)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        labelText: 'ປະເພດອາຫານ',
                        labelStyle: TextStyle(color: Colors.pink),
                        prefixIcon: Icon(Icons.category_outlined, color: Colors.pink),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                      items: widget.categories.map((cat) {
                        return DropdownMenuItem<String>(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedCategory = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  
                  // Add Category Button
                  SizedBox(
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: _showNewCategoryDialog,
                      icon: Icon(Icons.add, size: 18),
                      label: Text('ປະເພດໃໝ່', style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade50,
                        foregroundColor: Colors.pink.shade700,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.pink.shade200),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              
              // Submit button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                  ),
                  child: Text(
                    'ເພີ່ມລາຍການ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
