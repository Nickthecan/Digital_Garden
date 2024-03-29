import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:digital_garden/features/models/budget_model.dart';
import 'package:digital_garden/features/models/purchase_model.dart';

class Chart extends StatefulWidget {
  final BudgetModel budgetModel;
  final List<PurchaseModel> purchases;
  const Chart({super.key, required this.budgetModel, required this.purchases});

  @override
  State<Chart> createState() => ChartLineChart();
}

class ChartLineChart extends State<Chart> {
  List<Color> gradientColors = [
    Color(0xFF58E47F),
    Color(0xFF58E47F),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Align(
            alignment: Alignment.center,
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<FlSpot> spots = [];
    double total = 0;

    for (int i = 1; i <= DateTime.now().day; i++) {
      total += widget.budgetModel.calculateAmountSpentToday(widget.purchases, i, DateTime.now().month);
      spots.add(FlSpot(i.toDouble(), total));
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color(0xff37434d)),
      ),
      minX: 0,
      maxX: calculateNumberOfDays().toDouble(),
      minY: 0,
      maxY: widget.budgetModel.totalAmount,
      lineBarsData: [
        LineChartBarData(
          spots: [...spots],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    int day = calculateNumberOfDays();
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;

    if (value.toInt() == 0)
      text = Text('1', style: style);
    else if (value.toInt() == 15)
      text = Text('15', style: style);
    else if (value.toInt() == day)
      text = Text("$day", style: style);
    else
      text = Text('', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    if (value.toInt() == ((widget.budgetModel.totalAmount / 4) * 1).toInt())
      text = '\$${((widget.budgetModel.totalAmount / 4) * 1).toInt()}';
    else if (value.toInt() == ((widget.budgetModel.totalAmount / 4) * 2).toInt())
      text = '\$${((widget.budgetModel.totalAmount / 4) * 2).toInt()}';
    else if (value.toInt() == ((widget.budgetModel.totalAmount / 4) * 3).toInt())
      text = '\$${((widget.budgetModel.totalAmount / 4) * 3).toInt()}';
    else if (value.toInt() == ((widget.budgetModel.totalAmount / 4) * 4).toInt())
      text = '\$${((widget.budgetModel.totalAmount / 4) * 4).toInt()}';
    else
      return Container();
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  int calculateNumberOfDays() {
    DateTime now  = DateTime.now();
    DateTime daysOfTheMonth = DateTime(now.year, now.month + 1, 0);
    return daysOfTheMonth.day;
  }
}