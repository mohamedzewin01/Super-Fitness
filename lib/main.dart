import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness/core/resources/theme_manager.dart';
import 'core/di/di.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/auth/presentation/pages/register_view.dart';
import 'localization/locale_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const SuperFitness());
}

class SuperFitness extends StatelessWidget {
  const SuperFitness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ar'),
            ],
            theme: getApplicationTheme(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.onBoarding,
            home: RegisterView(),
          );
        },
      ),
    );
  }
}
