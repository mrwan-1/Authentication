import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../screen/widgets/animitd_btn.dart';
import '../screen/widgets/signin_btn.dart';
import '../screen/widgets/signin_textform.dart';

class OnBodingScreen extends StatefulWidget {
  const OnBodingScreen({super.key});

  @override
  State<OnBodingScreen> createState() => _OnBodingScreenState();
}

class _OnBodingScreenState extends State<OnBodingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      'active',
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
            width: size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png')),
        const RiveAnimation.asset(
          'assets/riveAssets/shapes.riv',
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: const SizedBox(),
          ),
        ),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: const Column(
                  children: [
                    Text('Dragon code',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontSize: 60, height: 1.2)),
                    Text('A coding community for dragons!',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16))
                  ],
                ),
              ),
              const Spacer(flex: 3),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                ontap: () {
                  _btnAnimationController.isActive = true;
                  customSigninDialog(context, size);
                },
              ),
              SizedBox(
                height: size.height * 0.10,
              )
            ],
          ),
        )),
      ],
    );
  }

  Future<Object?> customSigninDialog(BuildContext context, Size size) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In ",
      context: context,
      transitionDuration: Duration(milliseconds: 700),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tValue = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tValue.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: Container(
          height: size.height * 0.80,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05, horizontal: size.width * 0.10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: BorderRadius.circular(40),
          ),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text('Sign In',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Poppins',
                            )),
                        SignInTextForm(),
                        SignInBtn(),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text('OR',
                                  style: TextStyle(color: Colors.black26)),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          child: Text('Sign Up With Email, Apple or Google',
                              style: TextStyle(color: Colors.black54)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/email.svg',
                                  width: size.width * 0.09,
                                  height: size.height * 0.08,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  width: size.width * 0.09,
                                  height: size.height * 0.08,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  width: size.width * 0.09,
                                  height: size.height * 0.08,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    // top: ,
                    right: 0,
                    left: 0,
                    bottom: -142,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
