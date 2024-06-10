// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, sort_child_properties_last

import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  String _selectedSubscription = 'Basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change the app bar color to blue
        foregroundColor: Colors.white,
        title: Text('Subscription Center'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    height: 2000,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Select Subscription',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildSubscriptionCard('Basic', 'Rs.0'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: _buildSubscriptionCard(
                                        'Standard', 'Rs.0'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: _buildSubscriptionCard(
                                        'Premium', 'Rs.0'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  '${_selectedSubscription} Plan:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    _buildPlanFeatures(_selectedSubscription),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              // Action to perform when the button is pressed
            },
            child: Text(
              'Buy this plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<Widget> _buildPlanFeatures(String subscriptionType) {
    switch (subscriptionType) {
      case 'Basic':
        return [
          _buildBasicPlanFeature('Overview of Financial Status'),
          _buildBasicPlanFeature('Core Accounting Functions'),
          _buildBasicPlanFeature('General Ledger'),
          _buildBasicPlanFeature('Create and Send Invoices'),
          _buildBasicPlanFeature('Proposals'),
          _buildBasicPlanFeature('Expense Tracking'),
          _buildBasicPlanFeature('Multi-Currency Support'),
          _buildBasicPlanFeature('Profit and Loss Statement'),
        ];
      case 'Standard':
        return [
          _buildStandardPlanFeature('Advanced Invoicing'),
          _buildStandardPlanFeature('Sales and Expense Analytics'),
          _buildStandardPlanFeature('Collaboration Tools'),
          _buildStandardPlanFeature('Budgeting and Forecasting'),
        ];
      case 'Premium':
        return [
          _buildPremiumPlanFeature('Inventory Management'),
          _buildPremiumPlanFeature('Income and Expense Tracking'),
          _buildPremiumPlanFeature('Enhanced Security'),
        ];
      default:
        return []; // Return an empty list if subscription type is invalid
    }
  }

  Widget _buildBasicPlanFeature(String feature) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.blue)), // Change border color to blue
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(feature)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumPlanFeature(String feature) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.blue)), // Change border color to blue
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(feature)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardPlanFeature(String feature) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.blue)), // Change border color to blue
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(feature)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(String title, String price) {
    final isSelected = _selectedSubscription == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSubscription = title; // Update selected subscription
        });
      },
      child: Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isSelected ? Colors.blue : null, // Set color to blue if selected
          border: Border.all(
              color: isSelected
                  ? Colors.blue
                  : const Color.fromARGB(255, 224, 224,
                      224)), // Set border color to blue if selected
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(5, 0),
            ),
          ],
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? Colors.white
                        : null, // Change text color to white if selected
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : null, // Change text color to white if selected
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
