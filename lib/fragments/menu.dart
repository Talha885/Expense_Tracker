// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finance/fragments/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: 20,
                child: Container(
                  height: 1000,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        _buildMenuItem(
                          'assets/invoice.png',
                          'Invoicing',
                          'Create and Send Invoices',
                          isPremium: false,
                        ),
                        _buildMenuItem(
                          'assets/proposal.png',
                          'Proposals',
                          'Create and Send Proposals',
                          isPremium: false,
                        ),
                        _buildMenuItem(
                          'assets/advanced_invoice.png',
                          'Advanced Invoicing',
                          'Automated Late Payment Reminders',
                          isPremium: true,
                        ),
                        _buildMenuItem(
                          'assets/collaboration.png',
                          'Collaboration',
                          'Multiple User Access',
                          isPremium: true,
                        ),
                        _buildMenuItem(
                          'assets/tracking.png',
                          'Income and Expense Tracking',
                          'Allows tracking of financial performance',
                          isPremium: true,
                        ),
                        _buildMenuItem(
                          'assets/security.png',
                          'Enhanced Security',
                          'Advanced Encryption Process',
                          isPremium: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    String imagePath,
    String title,
    String subtitle, {
    bool isPremium = false,
  }) {
    return GestureDetector(
        onTap: () {
          // Handle card click
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: AppColors.dullColor),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.dullColor, // Change color as needed
                        ),
                        child: Center(
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              subtitle,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              if (isPremium)
                Positioned(
                  right: 1,
                  top: -10,
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/premium.png'),
                  ),
                ),
            ],
          ),
        ));
  }
}
