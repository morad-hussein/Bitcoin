/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screens/view_model/provider/coin/details_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailsProvider>(context);
    var data = [
      ChartData("1Y", provider.coinDetails?.percentChange_1y ?? 0),
      ChartData("6M", provider.coinDetails?.percentChange_200 ?? 0),
      ChartData("2M", provider.coinDetails?.percentChange_60 ?? 0),
      ChartData("1M", provider.coinDetails?.percentChange_30 ?? 0),
      ChartData("2W", provider.coinDetails?.percentChange_14 ?? 0),
      ChartData("1W", provider.coinDetails?.percentChange_7d ?? 0),
      ChartData("24H", provider.coinDetails?.percentChange_24h ?? 0),
    ];
    return Scaffold(
      body: SafeArea(
        child: provider.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                // design
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // graph
                    Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Color(0xff151f2c),
                        ),
                        child: Card(
                          color: Color(0xff151f2c),
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(isVisible: true,
                                majorGridLines: MajorGridLines(width: 1),
                                axisLine: AxisLine(width: 3, color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                                majorTickLines: MajorTickLines(size: 0),
                              ),
                              primaryYAxis: CategoryAxis(isVisible:false),
                              series: <ChartSeries<ChartData, String>>[
                                LineSeries(
                                  dataLabelSettings: DataLabelSettings(isVisible: true),
                                  color: Colors.green,
                                  width: 3,
                                  dataSource: data,
                                  xValueMapper: (ChartData sales, _) => sales.x.toString(),
                                  yValueMapper: (ChartData sales, _) => sales.y,
                                ),
                              ]),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
*/
import 'package:end/view_model/provider/coin/details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class  DetailsScreen extends StatelessWidget {
    DetailsScreen({Key? key ,required  this.id}) : super(key: key);
  String ?id;
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<DetailsProvider>(context);
    provider.getCoinDetails(id!);
    var data = [
      ChartData("1Y", provider.coinDetails?.percentChange_1y ?? 0),
      ChartData("6M", provider.coinDetails?.percentChange_200 ?? 0),
      ChartData("2M", provider.coinDetails?.percentChange_60 ?? 0),
      ChartData("1M", provider.coinDetails?.percentChange_30 ?? 0),
      ChartData("2W", provider.coinDetails?.percentChange_14 ?? 0),
      ChartData("1W", provider.coinDetails?.percentChange_7d ?? 0),
      ChartData("24H", provider.coinDetails?.percentChange_24h ?? 0),
    ];
    return Scaffold(
      body: SafeArea(
        child: provider.isLoading == true
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          // design
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  provider.coinDetails!.imgURL,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bitcoin',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'btc',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.54,
                  ),
                  Text(
                    'Rank',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '1232656.2326 \$\ ' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        '1232656.2326 \%\ ' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // graph
              Center(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0xff151f2c),
                  ),
                  child: Card(
                    color: Color(0xff151f2c),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(isVisible: true,
                          majorGridLines: MajorGridLines(width: 1),
                          axisLine: AxisLine(width: 3, color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                          majorTickLines: MajorTickLines(size: 0),
                        ),
                        primaryYAxis: CategoryAxis(isVisible:false),
                        series: <ChartSeries<ChartData, String>>[
                          LineSeries(
                            dataLabelSettings: DataLabelSettings(isVisible: true),
                            color: Colors.green,
                            width: 3,
                            dataSource: data,
                            xValueMapper: (ChartData sales, _) => sales.x.toString(),
                            yValueMapper: (ChartData sales, _) => sales.y,
                          ),

                        ]),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;

}


