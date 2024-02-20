import 'package:flutter/material.dart';
import 'package:kpms_ecom/src/features/cart/presentation/view/pages/cart_page.dart';

import 'features/products/presentation/views/pages/product_list_page.dart';
import 'features/profile/presentation/view/pages/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<String, Widget> widgets = {
    "Products": ProductListPage(),
    "Cart": CartPage(),
    "Profile": ProfilePage()
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widgets.keys.elementAt(selectedIndex)),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16,),
          Icon(Icons.headphones),
          SizedBox(width: 24,),
        ],
      ),
      body: SafeArea(child: widgets.values.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), label: "Profile"),
        ],
      ),
    );
  }
}
