
import 'package:api/models/World_State_Model.dart';
import 'package:api/services/States_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'countries_list.dart';

class WorldStatesScreen extends StatefulWidget {
const WorldStatesScreen({super.key});

@override
State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
with TickerProviderStateMixin {

late final AnimationController _controller = AnimationController(
duration: const Duration(seconds: 3),
vsync: this,
)..repeat();

final StatesServices statesServices = StatesServices();

final colorList = <Color>[
const Color(0xFF006400),
const Color(0xFF8B0000),
const Color(0xFF00008B),
];

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(15.0),
child: Column(
children: [

SizedBox(
height: MediaQuery.of(context).size.height * 0.01,
),

Expanded(
child: FutureBuilder<WorldStateModel>(
future: statesServices.fetchWorldStateRecords(),

builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {

// Loading
if (snapshot.connectionState == ConnectionState.waiting) {
return Center(
child: SpinKitFadingCircle(
color: Colors.green,
size: 50.0,
controller: _controller,
),
);
}

// Error
if (snapshot.hasError) {
return Center(
child: Text(
"Something went wrong:\n${snapshot.error}",
textAlign: TextAlign.center,
),
);
}

// No data
if (!snapshot.hasData) {
return const Center(
child: Text("No data available"),
);
}

final data = snapshot.data!;

return SingleChildScrollView(
child: Column(
children: [

// =========================
// PIE CHART
// =========================

PieChart(
dataMap: {
"Total": double.parse(
data.cases.toString(),
),
"Recovered": double.parse(
data.recovered.toString(),
),
"Death": double.parse(
data.deaths.toString(),
),
},

chartValuesOptions:
const ChartValuesOptions(
showChartValuesInPercentage: true,
),

chartRadius:
MediaQuery.of(context).size.width / 3.2,

legendOptions: const LegendOptions(
legendPosition: LegendPosition.left,
),

animationDuration:
const Duration(milliseconds: 1200),

chartType: ChartType.ring,

colorList: colorList,
),

// =========================
// STATISTICS CARD
// =========================

Padding(
padding: EdgeInsets.symmetric(
vertical:
MediaQuery.of(context).size.height * 0.06,
),

child: Card(
child: Column(
children: [

ReusableRow(
title: "Total",
value: data.cases.toString(),
),

ReusableRow(
title: "Recovered",
value: data.recovered.toString(),
),

ReusableRow(
title: "Deaths",
value: data.deaths.toString(),
),

ReusableRow(
title: "Active",
value: data.active.toString(),
),

ReusableRow(
title: "Critical",
value: data.critical.toString(),
),

ReusableRow(
title: "Today Deaths",
value: data.todayDeaths.toString(),
),

ReusableRow(
title: "Today Recovered",
value: data.todayRecovered.toString(),
),
],
),
),
),

// =========================
// TRACK COUNTRIES BUTTON
// =========================

GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>
const CountriesList(),
),
);
},

child: Container(
height: 50,
width: double.infinity,

decoration: BoxDecoration(
color: Colors.green.shade600,
borderRadius:
BorderRadius.circular(10),
),

child: const Center(
child: Text(
"Track Countries",
style: TextStyle(
color: Colors.white,
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
),
),

const SizedBox(height: 20),
],
),
);
},
),
),
],
),
),
),
);
}
}


// =====================================================
// REUSABLE ROW
// =====================================================

class ReusableRow extends StatelessWidget {

final String title;
final String value;

const ReusableRow({
Key? key,
required this.title,
required this.value,
}) : super(key: key);

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.only(
left: 10,
right: 10,
top: 10,
bottom: 5,
),

child: Column(
children: [

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,

children: [
Text(title),
Text(value),
],
),

const SizedBox(height: 5),

const Divider(),
],
),
);
}
}

