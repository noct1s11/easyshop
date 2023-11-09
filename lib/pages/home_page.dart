import 'package:easyshop/pages/bmi_calculator.dart';
import 'package:easyshop/pages/cart_page.dart';
import 'package:easyshop/pages/const.dart';
import 'package:easyshop/pages/setting_page.dart';
import 'package:easyshop/pages/shop_page.dart';
import 'package:easyshop/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/bottom_nav_bar.dart';
import 'calculator.dart';

class HomePage extends StatefulWidget {
  final User user = FirebaseAuth.instance.currentUser!;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectedIndex =0;
  void navigateBottomBar (int index) {
    setState(() {
      _SelectedIndex =index;
    });
  }

  final List<Widget> _HomePage = [
  ShopPage(), // Uncomment this line to include the ShopPage
  CartPage(), // Uncomment this line to include the CartPage
];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index) ,
      ),
      body: _HomePage[_SelectedIndex],
      appBar: AppBar(
        
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('lib/images/airjordanlogo.png')),
            Divider(
              color: Colors.grey[800],
            ),
            const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                navigateToUserProfile(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                signUserOut();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                color: Colors.white,
              ),
              title: Text(
                'Calculator',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                navigateToCalculator(context);
              },
            ),
            ListTile(
  leading: Icon(
    Icons.calculate,
    color: Colors.white,
  ),
  title: Text(
    'BMI Calculator',
    style: TextStyle(color: Colors.white),
  ),
  onTap: () {
    navigateToBMICalculator(context);
    },
),
          ],
        ),
      ),
      
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void navigateToCalculator(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Calculator()),
    );
  }

  void navigateToUserProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return UserProfilePage(user: widget.user);
        },
      ),
    );
  }
  void navigateToBMICalculator(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BMICalculator()),
  );
}
}