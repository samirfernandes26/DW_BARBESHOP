import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/ui/constantes.dart';
import 'package:dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 120 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ImageConstants.backgroundChair,
              ),
              opacity: 0.2,
              fit: BoxFit.cover),
        ),
        child: Center(
          child: AnimatedOpacity(
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            duration: const Duration(seconds: 4),
            onEnd: () {
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: RouteSettings(name: '/auth/login'),
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return LoginPage();
                    },
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  (route) => false);
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              width: _logoAnimationWidth,
              height: _logoAnimationHeight,
              curve: Curves.linearToEaseOut,
              child:
                  Image.asset('assets/images/imgLogo.png', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
