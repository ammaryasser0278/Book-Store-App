import 'dart:async';
import 'package:book_store_app/features/home_feature/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Logo.png', height: 55.0),
          const SizedBox(height: 10.0),
          TextAnimation(slidingAnimation: _slidingAnimation),
        ],
      ),
    );
  }

  // Animation Method
  void initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();
  }

  // Navigation Method
  void navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(HomeView.screenRoute);
    });
  }
}

// custom animation for text Widget
class TextAnimation extends StatelessWidget {
  final Animation<Offset> _slidingAnimation;

  const TextAnimation({super.key, required Animation<Offset> slidingAnimation})
    : _slidingAnimation = slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slidingAnimation,
      builder: (context, _) => SlideTransition(
        position: _slidingAnimation,
        child: const Text(
          textAlign: TextAlign.center,
          'Discover your next great read.',
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
