// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/consts/const.dart';
import 'package:food_apps/controllers/auth_controller.dart';
import 'package:food_apps/views/main_screen.dart';
import 'package:food_apps/views/onboarding_screen.dart';
import 'package:food_apps/views/signin_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final AuthenticationController authController =
      Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    // Chuyển qua màn hình chính sau khi kiểm tra Authentication 2.5s
    Future.delayed(const Duration(milliseconds: 2500), () {
      // Nếu là lần đầu tiên
      if (authController.isFirstTime) {
        Get.off(() => const OnboardingScreen());
      }
      // Nếu đã đăng nhập
      else if (authController.isLoggedIn) {
        Get.off(() => const MainScreen());
      }
      // Nếu chưa đăng nhập
      else {
        Get.off(() => SignInScreen());
      }
    });
    return Scaffold(
      backgroundColor: redColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: GridPattent(color: Colors.white),
              ),
            ),

            // MAIN CONTENT
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // animated logo
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(microseconds: 1200),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 48,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // animated text
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(microseconds: 1200),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 20),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          "FASHION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 8,
                          ),
                        ),
                        Text(
                          "STORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Tag Line
                ],
              ),
            ),

            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(microseconds: 1200),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 20),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  "Welcome to Swat App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridPattent extends StatefulWidget {
  final Color color;
  const GridPattent({super.key, required this.color});

  @override
  State<GridPattent> createState() => _GridPattentState();
}

class _GridPattentState extends State<GridPattent> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _GridPainter(color: widget.color));
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  const _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    const gridSize = 20.0;

    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
