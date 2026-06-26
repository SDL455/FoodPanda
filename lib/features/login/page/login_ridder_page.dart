import 'package:flutter/material.dart';
import 'package:foodpanda/features/login/controller/login_ridder_controller.dart';
import 'package:get/get.dart';

class LoginRidderPage extends GetView<LoginRidderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login ridder')),
      body: Text('MyPage'),
    );
  }
}
