import 'package:drive_poc/app_screen.dart';
import 'package:drive_poc/core/extensions/context_extension.dart';
import 'package:drive_poc/core/theme/app_theme_provider.dart';
import 'package:drive_poc/features/dashboard/presentation/pages/dash_bord_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return AppThemeProvider(
      theme: context.theme,
      child: MaterialApp(
        title: 'Deriv Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: context.theme.base07Color,
          fontFamily: context.theme.fontFamily,
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark().copyWith(
            primary: context.theme.base01Color,
            secondary: context.theme.brandCoralColor,
          ),
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: context.theme.base07Color,
            centerTitle: false,
          ),
        ),
        navigatorKey: _navigatorKey,
        initialRoute: AppScreen.routeName,
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const AppScreen(),
        ),
        routes: <String, WidgetBuilder>{
          DashboardPage.routeName: (BuildContext context) => const DashboardPage()
        },
      ),
    );
  }
}