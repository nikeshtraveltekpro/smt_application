import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sniggy_controller.dart';

class SniggyView extends GetView<SniggyController> {
  const SniggyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SniggyView'), centerTitle: true),
      body: const Center(
        child: Text('SniggyView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
