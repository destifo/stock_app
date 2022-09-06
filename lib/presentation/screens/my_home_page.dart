import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/BLoC/network/network_bloc.dart';
import 'package:stock_app/BLoC/network/network_state.dart';
import 'package:stock_app/BLoC/stock/stock_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_event.dart';
import 'package:stock_app/presentation/widgets/overview.dart';
import 'package:stock_app/presentation/widgets/performance.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state is Online) {
              BlocProvider.of<StockBloc>(context).add(LoadData());
            }
          },
          builder: (context, state) {
            if (state is Checking) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            print(state.toString());
            if (state is Online) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: const [Overview(), Performance()],
                  ),
                ),
              );
            }
            if (state is Offline) {
              return const Center(child: Text('NO Internet Connection'));
            }
            return const Text('Someting went wrong with network bloc');
          },
        ),
      ),
    );
  }
}
