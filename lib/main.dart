import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/ui/constants/theme.dart';
import 'package:hangman/ui/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logic/cubits/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    sharedPreferences: await SharedPreferences.getInstance(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final SharedPreferences sharedPreferences;
  const MyApp(
      {Key? key, required this.sharedPreferences, required this.appRouter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(sharedPreferences),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather Better',
            theme: appThemeData[AppTheme.light],
            darkTheme: appThemeData[AppTheme.dark],
            themeMode: state.themeMode,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
