import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_state.dart';

import 'performance_tile.dart';

class Performance extends StatelessWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget vertSpace = SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
    double fontsize = 17;
    Color textColor = Color.fromARGB(255, 18, 102, 176);
    Color buttonColor = Colors.amber;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance',
            style: TextStyle(
                fontSize: 19, color: textColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          BlocBuilder<StockBloc, StockState>(builder: (context, state) {
            if (state is LoadingData) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DataLoaded) {
              final data = state.perfStats;
              List<Widget> tiles = [];
              for (int i = 0; i < data.length; i++) {
                // print(data[i]);
                tiles.add(PerformanceTile(
                  data: data[i],
                  maxChange: data[data.length - 1]['ChangePercent'],
                ));
                tiles.add(vertSpace);
              }
              tiles.add(
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View More',
                          style:
                              TextStyle(color: buttonColor, fontSize: fontsize),
                        )),
                  ],
                ),
              );
              return Column(children: tiles);
            }

            return const Center(
              child: Text('Something went wrong with stock bloc'),
            );
          }),
        ],
      ),
    );
  }
}
