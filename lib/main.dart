import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/theme_data.dart';
import 'package:flutter_shop/providers/dark_theme_provider.dart';
import 'package:flutter_shop/screens/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var themeProvider = DarkThemeProvider();

  void getDartTheme() async {
    themeProvider.setDarkTheme = await themeProvider.themePreference.getTheme();
  }

  @override
  void initState() {
    getDartTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(create: (_) => themeProvider)
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(theme.getDarkTheme, context),
            home: BottomNavigation(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
