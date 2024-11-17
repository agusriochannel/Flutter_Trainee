import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nest_movie/core/domain/entities/media.dart';
import 'package:nest_movie/core/resources/app_router.dart';
import 'package:nest_movie/core/services/service_locator.dart';
import 'package:nest_movie/core/resources/app_strings.dart';
import 'package:nest_movie/core/resources/app_theme.dart';
import 'package:nest_movie/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

void main() async {
  //Initializes Hive with a valid directory in your app files
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();

  runApp(
    BlocProvider(
      create: (context) => sl<WatchlistBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}

// source: https://github.com/mohamadayash22/flutter-movie-app/tree/main/lib