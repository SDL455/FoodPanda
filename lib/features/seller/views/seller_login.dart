import 'package:flutter/material.dart';
import 'package:foodpanda/features/seller/views/seller_dashboard.dart';

class SellerLoginScreen extends StatefulWidget {
  @override
  _SellerLoginScreenState createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a small delay for premium feels
      Future.delayed(Duration(milliseconds: 1200), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SellerDashboard()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink.shade800,
              Colors.pink.shade500,
              Colors.deepOrange.shade400,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.storefront_outlined,
                          size: 60,
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'ເຂົ້າສູ່ລະບົບຜູ້ຂາຍ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade700,
                        ),
                      ),
                      Text(
                        'Foodpanda Merchant Portal',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 24),
                      // Info Banner: Account created by admin
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.blue.shade800),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'ຂໍ້ມູນເຂົ້າລະບົບແມ່ນໄດ້ຮັບການສ້າງ ແລະ ອະນຸມັດຈາກຜູ້ດູແລລະບົບ (Admin) ເທົ່ານັ້ນ.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'ອີເມວ / ຊື່ຜູ້ໃຊ້',
                          prefixIcon: Icon(Icons.email, color: Colors.pink),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.pink, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'ກະລຸນາປ້ອນອີເມວ ຫຼື ຊື່ຜູ້ໃຊ້ຂອງທ່ານ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'ລະຫັດຜ່ານ',
                          prefixIcon: Icon(Icons.lock, color: Colors.pink),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.pink, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງທ່ານ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : Text(
                                  'ເຂົ້າສູ່ລະບົບ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // Show instructions modal/dialog for contacting Admin
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Row(
                                children: [
                                  Icon(Icons.contact_support, color: Colors.pink),
                                  SizedBox(width: 8),
                                  Text('ຕິດຕໍ່ຜູ້ດູແລລະບົບ'),
                                ],
                              ),
                              content: Text(
                                'ຫາກທ່ານບໍ່ທັນມີບັນຊີຜູ້ຂາຍ ຫຼື ລືມລະຫັດຜ່ານ, ກະລຸນາຕິດຕໍ່ພະແນກ Admin ຂອງ Foodpanda ເພື່ອຂໍຂໍ້ມູນການເຂົ້າໃຊ້ງານ.',
                                style: TextStyle(height: 1.5),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'ຕົກລົງ',
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'ລືມລະຫັດຜ່ານ ຫຼື ບໍ່ທັນມີບັນຊີ?',
                          style: TextStyle(
                            color: Colors.pink.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
