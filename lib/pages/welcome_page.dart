// ignore_for_file: sort_child_properties_last

import 'package:explore_beauty/pages/homepage.dart';
import 'package:explore_beauty/utils/common_widget/big_title.dart';
import 'package:explore_beauty/utils/common_widget/circled_button.dart';
import 'package:explore_beauty/utils/common_widget/rounded_button.dart';
import 'package:explore_beauty/utils/common_widget/small_text.dart';
import 'package:explore_beauty/utils/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();

  List<Map<String, dynamic>> page = [
    {
      'image': 'assets/images/intro1.png',
      'title': 'HOT PIZZA',
      'description':
          'KPC the only place you can find the quality, tasty and hot Pizza to enjoy with family and friends',
    },
    {
      'image': 'assets/images/intro3.png',
      'title': 'YUMMY',
      'description':
          'Come and taste the difference from our proffesional chefs and standart ingridients.',
    },
    {
      'image': 'assets/images/intro2.png',
      'title': 'DELIVERY',
      'description':
          'Explore our menu and make your first order today. Our service is incredible you receive your order in less that a minute.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int page) {},
        children: List.generate(
          page.length,
          (index) {
            Map<String, dynamic> item = page[index];
            String image = item['image'];
            String title = item['title'];
            String description = item['description'];
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: SizedBox(
                  width: width(context),
                  height: height(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 20),
                        child: BigTitle(text: title),
                      ),
                      Expanded(
                        child: Image.asset(image),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: description),
                            spacingHeight(20),
                            Center(
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: page.length,
                                effect: const ExpandingDotsEffect(
                                    activeDotColor: Colors.black),
                              ),
                            ),
                            spacingHeight(60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index == 1 || index == 2
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            CircledButton(
                                              icon: CupertinoIcons.left_chevron,
                                              onTap: () {
                                                if (_controller.page !=
                                                    page.length + 1) {
                                                  _controller.animateToPage(
                                                    _controller.page!.toInt() -
                                                        1,
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              },
                                              type:
                                                  CircledButtonType.textPrimary,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      index != 2
                                          ? CircledButton(
                                              icon:
                                                  CupertinoIcons.right_chevron,
                                              onTap: () {
                                                if (_controller.page !=
                                                    page.length - 1) {
                                                  _controller.animateToPage(
                                                    _controller.page!.toInt() +
                                                        1,
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              },
                                              type: CircledButtonType.bgPrimary,
                                            )
                                          : CircledButton(
                                              icon: CupertinoIcons.check_mark,
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomePage()));
                                              },
                                              type: CircledButtonType.bgPrimary,
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
