import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/BLoC/network/network_bloc.dart';
import 'package:stock_app/BLoC/network/network_event.dart';
import 'package:stock_app/BLoC/stock/stock_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_event.dart';
import 'package:stock_app/data/overview_remote_data_provider.dart';
import 'package:stock_app/data/performance_remote_data_provider.dart';

import 'presentation/screens/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final OverviewRemoteDataProvider overviewRemoteDataProvider =
      OverviewRemoteDataProvider();

  final PerformanceRemoteDataProvider performanceRemoteDataProvider =
      PerformanceRemoteDataProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => StockBloc(
              overviewRemoteDataProvider: overviewRemoteDataProvider,
              performanceRemoteDataProvider: performanceRemoteDataProvider)
            ..add(LoadData()),
        ),
        BlocProvider(
          create: (context) => NetworkBloc()..add(Disconnected()),
        )
      ], child: const MyHomePage()),
    );
  }
}
