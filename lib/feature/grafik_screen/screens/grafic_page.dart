import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficPage extends StatefulWidget {
  const GraficPage({super.key});

  @override
  State<GraficPage> createState() => _GraficPageState();
}

class _GraficPageState extends State<GraficPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grafic Page",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (_, index) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .4,
                width: MediaQuery.sizeOf(context).width,
                child: LineChart(
                  LineChartData(
                      titlesData: const FlTitlesData(
                          topTitles: AxisTitles(
                            axisNameWidget: Text("Days"),
                          ),
                          leftTitles:
                              AxisTitles(axisNameWidget: Text("Salary"))),
                      minX: 1,
                      maxX: 31,
                      minY: 0,
                      maxY: 3000000,
                      lineBarsData: [
                        LineChartBarData(spots: const [
                          FlSpot(2,200000)
                        ]),
                      ]),
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 2),
      ),
    );
  }
}
