// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:finance/Authentication/login.dart';
import 'package:finance/fragments/color.dart';
import 'package:finance/fragments/page_transition.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              WalkthroughItem(
                image: 'assets/boarding1.png',
                title: 'Financial Management',
                subtitle:
                    'Simplify your financial management with our easy-to-use app by your own hands.',
              ),
              WalkthroughItem(
                image: 'assets/boarding1.png',
                title: 'Track Your Records',
                subtitle:
                    'Keep track of your financial records and transactions effortlessly.',
              ),
              WalkthroughItem(
                image: 'assets/boarding1.png',
                title: 'Save Time and Effort',
                subtitle:
                    'Save time and effort managing your finances with our efficient tools.',
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Row(
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, BottomToTopPageRoute(page: LoginPage()));
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, BottomToTopPageRoute(page: LoginPage()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text('Get Started')),
                )),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

class WalkthroughItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const WalkthroughItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 200),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
