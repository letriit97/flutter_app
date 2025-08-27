import 'package:flutter/material.dart';
import 'package:food_apps/_services/widget_support.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset('assets/images/chicken-medium.png'),
            const SizedBox(height: 20),
            Text(
              "Thức ăn nhanh vừa ngon vừa rẻ",
              textAlign: TextAlign.center,
              style: AppWidget.HeadLineTextFieldStyle(),
            ),
            Text(
              "Chúng tôi cung cấp các món ăn nhanh \n với giá cả phải chăng và chất lượng tuyệt vời.",
              style: AppWidget.SimpleTextFieldStyle(),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Đặt hàng ngay",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
