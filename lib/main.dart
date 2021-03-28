import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import './screens/timer_screen.dart';
import './screens/tracking_screen.dart';
import './screens/pick_exercise_only_screen.dart';
import './screens/edit_event_screen.dart';
import './screens/tab_screen.dart';
import './screens/pick_exercise_screen.dart';

import './providers/tap_page_index.dart';
import './providers/filters.dart';
import './providers/events.dart';
import './providers/exercises.dart';
import './providers/calendar_state.dart';
import './providers/routines.dart';
import 'providers/stopwatch_state.dart';
import './providers/lap_times.dart';
import './providers/satisfactions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Events(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Exercises(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Filters(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CalendarState(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Satisfactions(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Routines(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TapPageIndex(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => StopWatchState(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LapTimes(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        title: 'WorkOut_Tracker',
        //* Theme *//
        theme: ThemeData(
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.teal,
          ),
          primaryColor: Colors.teal[300],
          // primarySwatch: Colors.teal[300],
          accentColor: Colors.deepOrange[300],
          // AppBar theme
          appBarTheme: AppBarTheme(
            color: Colors.teal[200],
            titleTextStyle: TextStyle(color: Colors.teal[200]),
            elevation: 5,
            shadowColor: Colors.black,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(color: Colors.red),
                // headline6: TextStyle(color: Colors.deepOrange[700]),
                headline3: TextStyle(color: Colors.black),
                headline4: TextStyle(color: Colors.red),
              ),
        ),
        // routes
        // home: TabScreen(),
        routes: {
          '/': (ctx) => TabScreen(),
          // InsertEventScreen.routeName: (ctx) => InsertEventScreen(),
          // ManageScreen.routeName: (ctx) => ManageScreen(),
          PickExerciseScreen.routeName: (ctx) => PickExerciseScreen(),
          PickExerciseOnlyScreen.routeName: (ctx) => PickExerciseOnlyScreen(),
          EditEventScreen.routeName: (ctx) => EditEventScreen(),
          TrackingScreen.routeName: (ctx) => TrackingScreen(),
          TimerScreen.routeName: (ctx) => TimerScreen(),
        },
      ),
    );
  }
}
