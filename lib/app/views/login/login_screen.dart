import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
                highlightColor: Colors.grey,
                baseColor: Colors.white,
                child: Center(
                    child: Image.asset(
                  "assets/cinemaven.png",
                  width: 250,
                ))),
            SizedBox(
              height: 20,
            ),
          TextFormField(
            
          ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
