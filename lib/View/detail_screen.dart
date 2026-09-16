
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
final Map<String, dynamic> country;

const CountryDetailScreen({
super.key,
required this.country,
});

@override
Widget build(BuildContext context) {
// Country information
final String countryName =
country['country']?.toString() ?? 'Unknown';

final String flag =
country['countryInfo']?['flag']?.toString() ?? '';

return Scaffold(
appBar: AppBar(
title: Text(countryName),
backgroundColor: Colors.green.shade800,
foregroundColor: Colors.white,
centerTitle: true,
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(16),

child: Column(
children: [

// ==========================================
// COUNTRY HEADER
// ==========================================

Card(
elevation: 4,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),

child: Padding(
padding: const EdgeInsets.all(20),

child: Column(
children: [

// Flag
if (flag.isNotEmpty)
Image.network(
flag,
height: 100,
width: 150,
fit: BoxFit.contain,

errorBuilder:
(context, error, stackTrace) {
return const Icon(
Icons.flag,
size: 80,
);
},
),

const SizedBox(height: 15),

// Country Name
Text(
countryName,
style: const TextStyle(
fontSize: 26,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 8),

Text(
country['continent']?.toString() ??
'Unknown Continent',
style: TextStyle(
fontSize: 16,
color: Colors.grey.shade600,
),
),
],
),
),
),

const SizedBox(height: 20),

// ==========================================
// COVID STATISTICS
// ==========================================

const Align(
alignment: Alignment.centerLeft,
child: Text(
"COVID-19 Statistics",
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
),
),
),

const SizedBox(height: 10),

DetailCard(
title: "Total Cases",
value: country['cases'],
icon: Icons.coronavirus,
),

DetailCard(
title: "Today Cases",
value: country['todayCases'],
icon: Icons.today,
),

DetailCard(
title: "Deaths",
value: country['deaths'],
icon: Icons.dangerous,
),

DetailCard(
title: "Today Deaths",
value: country['todayDeaths'],
icon: Icons.warning,
),

DetailCard(
title: "Recovered",
value: country['recovered'],
icon: Icons.health_and_safety,
),

DetailCard(
title: "Today Recovered",
value: country['todayRecovered'],
icon: Icons.healing,
),

DetailCard(
title: "Active Cases",
value: country['active'],
icon: Icons.personal_injury,
),

DetailCard(
title: "Critical Cases",
value: country['critical'],
icon: Icons.local_hospital,
),

DetailCard(
title: "Cases Per One Million",
value: country['casesPerOneMillion'],
icon: Icons.analytics,
),

DetailCard(
title: "Deaths Per One Million",
value: country['deathsPerOneMillion'],
icon: Icons.bar_chart,
),

DetailCard(
title: "Tests",
value: country['tests'],
icon: Icons.science,
),

DetailCard(
title: "Tests Per One Million",
value: country['testsPerOneMillion'],
icon: Icons.biotech,
),

// ==========================================
// COUNTRY INFORMATION
// ==========================================

const SizedBox(height: 20),

const Align(
alignment: Alignment.centerLeft,
child: Text(
"Country Information",
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
),
),
),

const SizedBox(height: 10),

DetailCard(
title: "Population",
value: country['population'],
icon: Icons.people,
),

DetailCard(
title: "Continent",
value: country['continent'],
icon: Icons.public,
),

DetailCard(
title: "Country Code",
value: country['countryInfo']?['iso2'],
icon: Icons.flag,
),

DetailCard(
title: "ISO3 Code",
value: country['countryInfo']?['iso3'],
icon: Icons.code,
),

DetailCard(
title: "Latitude",
value: country['countryInfo']?['lat'],
icon: Icons.location_on,
),

DetailCard(
title: "Longitude",
value: country['countryInfo']?['long'],
icon: Icons.location_on,
),

const SizedBox(height: 20),
],
),
),
);
}
}


// ======================================================
// REUSABLE DETAIL CARD
// ======================================================

class DetailCard extends StatelessWidget {
final String title;
final dynamic value;
final IconData icon;

const DetailCard({
super.key,
required this.title,
required this.value,
required this.icon,
});

@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.only(bottom: 10),

elevation: 2,

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),

child: ListTile(
leading: CircleAvatar(
backgroundColor: Colors.green.shade100,

child: Icon(
icon,
color: Colors.green.shade700,
),
),

title: Text(
title,
style: const TextStyle(
fontWeight: FontWeight.w500,
),
),

trailing: Text(
value?.toString() ?? 'N/A',
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
);
}
}

