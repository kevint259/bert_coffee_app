import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:bert_coffee/pages/coffee_nav/account_page.dart';
import 'package:bert_coffee/pages/coffee_nav/offers_page.dart';
import 'package:bert_coffee/pages/coffee_nav/order_page.dart';
import 'package:bert_coffee/pages/coffee_nav/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = const [
    AccountPage(),
    OffersPage(),
    OrderPage(),
    ScanPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[300],
          selectedItemColor: Colors.blue,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          currentIndex: 2,
          items: const [
            // scan
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2),
              label: "Scan",
            ),
            // order
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: "Order",
            ),

            // home
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            // offers
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Offers",
            ),

            // personal account
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: "Account",
            ),
          ],
        ),
        body: SafeArea(
            child: SafeArea(
                child: Column(
          children: [
            const Text(
              "WELCOME TO THIS PAGE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // logout button
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEventLogOut());
              },
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ))));
  }
}
