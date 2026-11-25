import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isco_bus/core/theme/app_theme.dart';
import 'package:isco_bus/features/splash_screen/presentation/ui_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISCO BUS',
      debugShowCheckedModeBanner: false,
     theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      themeMode: ThemeMode.system,

      home: SplashScreen(),
      
     
    );
  }
}

