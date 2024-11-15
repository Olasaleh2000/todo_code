import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_code/app_theme.dart';
import 'package:todo_code/auth/login_screen.dart';
import 'package:todo_code/auth/register_screen.dart';
import 'package:todo_code/auth/user_provider.dart';
import 'package:todo_code/home_screen.dart';
import 'package:todo_code/tabs/settings/settings_provider.dart';
import 'package:todo_code/tabs/tasks/tasks_provider.dart';
import 'package:todo_code/tabs/tasks/update_task_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TasksProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        UpdateTaskScreen.routeName: (context) => UpdateTaskScreen(),
      },
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
