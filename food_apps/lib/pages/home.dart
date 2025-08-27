import 'package:flutter/material.dart';

// import 'package:food_apps/_services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu action
          },
        ),
        title: const Text('Trang chủ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
    );
  }
}
