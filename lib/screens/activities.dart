// ignore_for_file: prefer_const_constructors
import 'package:finance/fragments/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final List<Map<String, String>> activities = [
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.10,000',
      'type': 'Subscription',
      'date': '2024-05-30',
      'status': 'Paid',
    },
    // Additional activities...
    {
      'image': 'assets/expenses.png',
      'price': 'Rs.5,000',
      'type': 'One-time',
      'date': '2024-05-29',
      'status': 'Paid',
    },
  ];

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
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 30),
                          child: Text(
                            'Your Activities',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.dullColor)),
                            height: MediaQuery.of(context).size.height / 1.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: activities.length,
                                  itemBuilder: (context, index) {
                                    return ActivityCard(
                                        activity: activities[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'This app helps you keep a good record of your recent expenses and incomes. By logging each transaction, you can easily track your spending habits and identify areas where you can save money. ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
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
}

class ActivityCard extends StatelessWidget {
  final Map<String, String> activity;

  const ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
              ),
              child: Center(
                child: Image.asset(
                  activity['image']!,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity['price']!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Type: ${activity['type']}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  activity['date']!,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    activity['status']!,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
