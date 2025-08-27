import 'package:flutter/material.dart';
import 'package:food_apps/controllers/auth_controller.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/signin_screen.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final List<OnboardingItems> _items = [
    OnboardingItems(
      image: 'assets/images/onboarding1.jpg',
      title: 'Discover Delicious Food',
      description:
          'Explore a wide variety of cuisines and dishes from around the world.',
    ),
    OnboardingItems(
      image: 'assets/images/onboarding2.jpg',
      title: 'Fast and Reliable Delivery',
      description:
          'Get your favorite meals delivered to your doorstep quickly and safely.',
    ),
    OnboardingItems(
      image: 'assets/images/onboarding3.jpg',
      title: 'Exclusive Offers and Discounts',
      description:
          'Enjoy special deals and discounts available only to our app users.',
    ),
  ];

  // handle get started button pressed
  void _handleGetStarted() {
    final AuthenticationController authController =
        Get.find<AuthenticationController>();
    authController.setFirstTime();
    // Navigate to the sign-in screen
    Get.off(() => SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _items[index].title,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[600] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    "Skip",
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    currentPage < _items.length - 1 ? "Next" : "Get Started",
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItems {
  final String image;
  final String title;
  final String description;

  OnboardingItems({
    required this.image,
    required this.title,
    required this.description,
  });
}
