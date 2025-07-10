import 'package:flutter/material.dart';
import 'package:my_demo_flutter/viewmodel/splash_view_model.dart';
import 'package:my_demo_flutter/views/product_listing_screen.dart';
import 'package:my_demo_flutter/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash  ',
      home: Consumer<SplashViewModel>(
        builder: (context, splashVM, _) {
          return splashVM.isSplashDone ? ProductListingScreen() : const SplashScreen();
        },
      ),
    );
  }
}


