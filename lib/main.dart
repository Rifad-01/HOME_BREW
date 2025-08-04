import 'package:first_app/models/coffee_shop.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => CoffeeShop(),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Coffee Shop',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              fontFamily: 'Roboto',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              // Responsive text scaling
              textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.0,
              ),
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}

// Utility class for responsive design
class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
  
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }
  
  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024) {
      return baseFontSize * 1.2;
    } else if (screenWidth >= 600) {
      return baseFontSize * 1.1;
    }
    return baseFontSize;
  }
  
  static EdgeInsets getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024) {
      return EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: 40,
      );
    } else if (screenWidth >= 600) {
      return EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: 30,
      );
    }
    return EdgeInsets.symmetric(
      horizontal: screenWidth * 0.06,
      vertical: 25,
    );
  }
  
  static int getGridCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1400) {
      return 3;
    } else if (screenWidth >= 1024) {
      return 2;
    } else if (screenWidth >= 600) {
      return 2;
    }
    return 1;
  }
}
      ),
    );
  }
}
