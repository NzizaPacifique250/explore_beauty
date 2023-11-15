import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController _controller = PageController();

List<Color> color = [
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(builder: (context, size) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.screenSize.height * .7,
                child: PageView(
                    controller: _controller,
                    onPageChanged: (int page) {},
                    children: List.generate(
                      color.length,
                      (index) => Center(
                        child: Container(
                          width: size.screenSize.width * .85,
                          height: size.screenSize.height * .8,
                          decoration: BoxDecoration(
                              color: color[index],
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(39)),
                          child: Center(
                            child: Text(
                              'Container ${(index + 1)}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: size.screenSize.height * .04,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: color.length,
                effect: const SwapEffect(activeDotColor: Colors.black),
              )
            ],
          ),
        ));
      }),
    );
  }
}
