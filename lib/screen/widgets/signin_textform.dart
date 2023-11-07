import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class SignInTextForm extends StatelessWidget {
  const SignInTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'Emil',
            style: TextStyle(color: Colors.black54),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(6)),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset('assets/icons/email.svg'),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            'Password',
            style: TextStyle(color: Colors.black54),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(6)),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset('assets/icons/password.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
