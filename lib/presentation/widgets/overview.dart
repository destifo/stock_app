import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stock_app/BLoC/stock/stock_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_state.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget vertSpace = SizedBox(
      height: MediaQuery.of(context).size.height * 0.025,
    );
    double fontsize = 17;
    Color textColor = Color.fromARGB(255, 18, 102, 176);
    Color buttonColor = Colors.amber;
    var formatter = NumberFormat('#,###,000');

    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is DataLoaded) {
          final data = state.overView;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                    fontSize: 19,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sector',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.house_sharp),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Text(
                        data['Sector'],
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Industry',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.house_sharp),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Text(
                        data['Industry'],
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market Cap.',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "${formatter.format(data['MCAP'])} Cr.",
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enterprise Value (EV)',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        data['EV'] ?? '-',
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Book Value / Share',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        data['BookNavPerShare'].toStringAsFixed(2),
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price-Earning Ratio (PE)',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        data['TTMPE'].toStringAsFixed(2),
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PEG Ratio',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        data['PEGRatio'].toStringAsFixed(2),
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dividend Yield',
                    style: TextStyle(fontSize: fontsize, color: textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        data['Yield'].toStringAsFixed(2),
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ],
                  ),
                ],
              ),
              vertSpace,
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
              )
            ],
          );
        }

        if (state is LoadingData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                    fontSize: 19,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }

        return const Center(
          child: Text('Something went wrong'),
        );
      },
    );
  }
}
