import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PerformanceTile extends StatelessWidget {
  const PerformanceTile({required this.data, required this.maxChange, Key? key})
      : super(key: key);

  final Map<String, dynamic> data;
  final maxChange;

  @override
  Widget build(BuildContext context) {
    final String label = data['Label'];
    final double change = data['ChangePercent'];
    final horizSpace = SizedBox(
      width: MediaQuery.of(context).size.width * 0.01,
    );
    // print((change.abs() / maxChange).toString());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.23,
            child: Text(
              label,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          // horizSpace,
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey, width: 1),
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)),
            child: Stack(children: [
              FractionallySizedBox(
                widthFactor: (change.abs() / maxChange),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: change >= 0 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8),
                      bottomLeft: const Radius.circular(8),
                      bottomRight: (change == maxChange)
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                      topRight: (change == maxChange)
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                    ),
                  ),
                ),
              ),
            ]),
          ),

          // horizSpace,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (change >= 0)
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.green,
                    size: 24,
                  ),
                if (change < 0)
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                    size: 24,
                  ),
                Text(
                  '${change.toStringAsFixed(1)}%',
                  style: TextStyle(
                      color: (change >= 0) ? Colors.green.shade800 : Colors.red,
                      fontSize: 17),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
