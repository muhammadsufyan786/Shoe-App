import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yt_ecommerce_nike_1/dashboard_screen.dart';
import 'package:yt_ecommerce_nike_1/my_colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin  {

  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0, 1)),
    )..addListener(() {
      setState(() {});
    });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(.5, 1)),
    )..addListener(() {
      setState(() {});
    });
    // Always repeat animation
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: MyColors.myBlack,
        child: Stack(
          children: [
            Positioned(
              bottom: -250,
              child: Container(
                width: size.width,
                height: size.width + 250,
                decoration: const BoxDecoration(
                    gradient: RadialGradient(radius: 0.65, colors: [
                  MyColors.myOrange,
                  MyColors.myBlack,
                ])),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                width: size.width,
                child: Image.asset(
                  "assets/img_nike_text.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                width: size.width,
                child: Image.asset(
                  "assets/img_shoes.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                height: size.height / 2,
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "LIVE YOUR\nPERFECT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 37.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20,),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Smart, gorgeous & fashionable\ncollection makes you cool",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: (){
                      //   print("assa");
                      //   Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: DashboardScreen()));
                      // },
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if(details.delta.dy < -sensitivity){
                          Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: DashboardScreen()));
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Opacity(
                                  opacity: _opacity.value,
                                  child: const Icon(
                                    CommunityMaterialIcons.chevron_double_up,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text: "Get Started",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16)),
                              ),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
