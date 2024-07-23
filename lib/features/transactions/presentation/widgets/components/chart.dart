import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(mainBarData());
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: leftTiles,
          ),
        ),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: bottomTiles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: groupData(),
    );
  }

  BarChartGroupData singleData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 50),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> groupData() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return singleData(0, 3.2);
          case 1:
            return singleData(1, 4.5);
          case 2:
            return singleData(2, 2.7);
          case 3:
            return singleData(3, 5);
          case 4:
            return singleData(4, 3.8);
          case 5:
            return singleData(5, 4.2);
          case 6:
            return singleData(6, 3.9);
          case 7:
            return singleData(7, 4.6);
          default:
            return throw Error();
        }
      });

  Widget bottomTiles(double value, TitleMeta meta) {
    final titles = <String>['01', '02', '03', '04', '05', '06', '07', '08'];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Theme.of(context).colorScheme.outline,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget leftTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = r'$ 1K';
    } else if (value == 1) {
      text = r'$ 2K';
    } else if (value == 2) {
      text = r'$ 3K';
    } else if (value == 3) {
      text = r'$ 4K';
    } else if (value == 4) {
      text = r'$ 5K';
    } else if (value == 5) {
      text = r'$ 10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
