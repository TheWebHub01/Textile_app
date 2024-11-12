import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:textile_app/utils/widget.dart';

class PurchaseAnalysisScreen extends StatelessWidget {
  const PurchaseAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar("Purchase Analysis"),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        // const Text(
                        //   'Sales in Lac',
                        //   style: TextStyle(
                        //       color: Colors.red, fontWeight: FontWeight.bold),
                        //   textAlign: TextAlign.center,
                        // ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 16,
                                height: 16,
                                color: const Color(0xffFF3F66)),
                            const SizedBox(width: 4),
                            const Text('Sales in Lac',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xff6F6F6E),
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(
                          height: 300,
                          child: BarChartWidget(),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Top 10 Selling Items by Quality',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const LegendWidget(),
                        const SizedBox(
                          height: 300,
                          child: PieChartWidget(),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Top 10 Parties by Transactions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 12, height: 12, color: Colors.red),
                            const SizedBox(width: 4),
                            const Text('Sales in Lac'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        titlesData: FlTitlesData(
          show: true,
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text(
                      'April',
                      style: TextStyle(color: Color(0xff6F6F6E)),
                    );
                  case 1:
                    return const Text(
                      'May',
                      style: TextStyle(color: Color(0xff6F6F6E)),
                    );
                  case 2:
                    return const Text(
                      'June',
                      style: TextStyle(color: Color(0xff6F6F6E)),
                    );
                  case 3:
                    return const Text(
                      'July',
                      style: TextStyle(color: Color(0xff6F6F6E)),
                    );
                  default:
                    return const Text('');
                }
              },
            ),
          ),
        ),
        gridData: const FlGridData(
          drawVerticalLine: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Color(0xffD7D7D7), width: 2),
            bottom: BorderSide(color: Color(0xffD7D7D7), width: 2),
            right: BorderSide.none,
            top: BorderSide.none,
          ),
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 45,
                color: Colors.red,
                width: 45,
                borderRadius: BorderRadius.circular(0),
              )
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 35,
                color: Colors.orange,
                width: 45,
                borderRadius: BorderRadius.circular(0),
              )
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 25,
                color: Colors.amber,
                width: 45,
                borderRadius: BorderRadius.circular(0),
              )
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 20,
                color: Colors.yellow,
                width: 45,
                borderRadius: BorderRadius.circular(0),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/// Pie Chart Widget using fl_chart
class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.red,
            value: 55.19,
            showTitle: false,
            // title: '55.19%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.orange,
            value: 6.13,
            // title: '6.13%',
            showTitle: false,
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.amber,
            value: 1.95,
            showTitle: false,

            // title: '1.95%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.yellow,
            value: 1.97,
            showTitle: false,

            // title: '0.97%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.lightGreen,
            value: 2.84,
            showTitle: false,

            // title: '0.84%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.teal,
            showTitle: false,

            value: 22.15,
            // title: '22.15%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.lightBlue,
            value: 4.46,
            showTitle: false,

            // title: '4.46%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.blue,
            value: 1.95,
            showTitle: false,

            // title: '1.95%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: const Color(0xffFF6D3F),
            value: 4.13,
            showTitle: false,

            // title: '6.13%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: const Color(0xffFF3F66),
            showTitle: false,
            value: 55.19,
            // title: '55.19%',
            radius: 55,
            titleStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
        sectionsSpace: 1,
        centerSpaceRadius: 55,
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegendItem('Kumari', Colors.red, '30.19 %'),
            verticalSpace(10),
            _buildLegendItem('Kota Checks', Colors.orange, '6.13 %'),
            verticalSpace(10),
            _buildLegendItem('Row Slik', Colors.amber, '1.95 %'),
            verticalSpace(10),
            _buildLegendItem('Orgenza', Colors.yellow, '0.97 %'),
            verticalSpace(10),
            _buildLegendItem('Rayon Max', Colors.lightGreen, '0.84 %'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegendItem('R X L', Colors.teal, '22.15 %'),
            verticalSpace(10),
            _buildLegendItem('Satin 1', Colors.lightBlue, '4.46 %'),
            verticalSpace(10),
            _buildLegendItem('Rayon', Colors.blue, '1.58 %'),
            verticalSpace(10),
            _buildLegendItem('Ot-1', Colors.purple, '0.90 %'),
            verticalSpace(10),
            _buildLegendItem('Sliver Kota', Colors.pink, '0.65 %'),
          ],
        ),
      ],
    );

    //    _buildLegendItem('Kumari', Colors.red, '30.19 %'),
    //
    //         _buildLegendItem('Row Slik', Colors.amber, '1.95 %'),
    //         _buildLegendItem('Orgenza', Colors.yellow, '0.97 %'),
    //         _buildLegendItem('Rayon Max', Colors.lightGreen, '0.84 %'),
    //         _buildLegendItem('R X L', Colors.teal, '22.15 %'),
    //         _buildLegendItem('Satin 1', Colors.lightBlue, '4.46 %'),
    //         _buildLegendItem('Rayon', Colors.blue, '1.58 %'),
    //         _buildLegendItem('Ot-1', Colors.purple, '0.90 %'),
    //         _buildLegendItem('Sliver Kota', Colors.pink, '0.65 %'),
  }

  Widget _buildLegendItem(String text, Color color, String percentage) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 4),
        Text('$text ($percentage)',
            style: const TextStyle(
                fontSize: 11,
                color: Color(0xff6F6F6E),
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
