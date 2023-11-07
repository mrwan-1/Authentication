import "package:flutter/material.dart";
import "package:rive/rive.dart";

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required this.ontap,
    required RiveAnimationController btnAnimationController,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: size.width * 0.6,
        height: size.height * 0.1,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/riveAssets/button.riv',
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_right),
                  Text('Login',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
