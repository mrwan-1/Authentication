import "package:flutter/material.dart";

class SignInBtn extends StatelessWidget {
  const SignInBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, size.height * 0.05),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            backgroundColor: Color(0xFFF77D8E),
          ),
          onPressed: () {},
          label: Text('Login', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.arrow_right)),
    );
  }
}
