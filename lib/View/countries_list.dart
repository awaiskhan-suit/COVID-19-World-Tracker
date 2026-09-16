
import 'package:api/services/States_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


import 'detail_screen.dart';

class CountriesList extends StatefulWidget {
const CountriesList({super.key});

@override
State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
// Search controller
final TextEditingController searchController =
TextEditingController();

// API service
final StatesServices statesServices = StatesServices();

@override
void dispose() {
searchController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
// ==================================================
// APP BAR
// ==================================================

appBar: AppBar(
elevation: 0,
backgroundColor: Colors.green.shade800,
foregroundColor: Colors.white,
centerTitle: true,
title: const Text(
"Countries",
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
),

// ==================================================
// BODY
// ==================================================

body: SafeArea(
child: Column(
children: [

// ==================================================
// SEARCH FIELD
// ==================================================

Padding(
padding: const EdgeInsets.all(8.0),

child: TextFormField(
controller: searchController,

// Update list when user types
onChanged: (value) {
setState(() {});
},

decoration: InputDecoration(
contentPadding: const EdgeInsets.symmetric(
horizontal: 20,
),

hintText: "Search with Country name...",

prefixIcon: const Icon(
Icons.search,
),

suffixIcon: searchController.text.isNotEmpty
? IconButton(
onPressed: () {
searchController.clear();
setState(() {});
},
icon: const Icon(Icons.clear),
)
    : null,

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(50.0),
),
),
),
),

// ==================================================
// COUNTRIES LIST
// ==================================================

Expanded(
child: FutureBuilder<List<dynamic>>(
future: statesServices.countriesListApi(),

builder: (
context,
AsyncSnapshot<List<dynamic>> snapshot,
) {

// ==================================================
// LOADING
// ==================================================

if (snapshot.connectionState ==
ConnectionState.waiting) {

return ListView.builder(
itemCount: 6,

itemBuilder: (context, index) {

return Shimmer.fromColors(
baseColor: Colors.grey.shade700,
highlightColor: Colors.grey.shade100,

child: const ListTile(

leading: CircleAvatar(
radius: 25,
backgroundColor: Colors.white,
),

title: SizedBox(
height: 12,
width: 100,
child: ColoredBox(
color: Colors.white,
),
),

subtitle: Padding(
padding: EdgeInsets.only(top: 8),

child: SizedBox(
height: 10,
width: 70,

child: ColoredBox(
color: Colors.white,
),
),
),
),
);
},
);
}

// ==================================================
// ERROR
// ==================================================

if (snapshot.hasError) {
return Center(
child: Padding(
padding: const EdgeInsets.all(20),

child: Column(
mainAxisAlignment:
MainAxisAlignment.center,

children: [

const Icon(
Icons.error_outline,
size: 60,
color: Colors.red,
),

const SizedBox(height: 15),

const Text(
"Something went wrong",
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 8),

Text(
"${snapshot.error}",
textAlign: TextAlign.center,
),
],
),
),
);
}

// ==================================================
// NO DATA
// ==================================================

if (!snapshot.hasData ||
snapshot.data!.isEmpty) {

return const Center(
child: Text(
"No countries found",
style: TextStyle(
fontSize: 16,
),
),
);
}

// ==================================================
// COUNTRY DATA
// ==================================================

final countries = snapshot.data!;

// Search text
final searchText =
searchController.text.toLowerCase().trim();

// ==================================================
// FILTER COUNTRIES
// ==================================================

final filteredCountries =
countries.where((country) {

final String name =
country['country']
    .toString()
    .toLowerCase();

return name.contains(searchText);

}).toList();

// ==================================================
// NO SEARCH RESULT
// ==================================================

if (filteredCountries.isEmpty) {
return const Center(
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,

children: [

Icon(
Icons.search_off,
size: 60,
color: Colors.grey,
),

SizedBox(height: 10),

Text(
"Country not found",
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
],
),
);
}

// ==================================================
// COUNTRY LIST
// ==================================================

return ListView.builder(
itemCount: filteredCountries.length,

itemBuilder: (context, index) {

// Current country
final Map<String, dynamic> country =
Map<String, dynamic>.from(
filteredCountries[index],
);

// Country name
final String countryName =
country['country']?.toString() ??
'Unknown';

// Cases
final String cases =
country['cases']?.toString() ??
'0';

// Flag
final String flag =
country['countryInfo']?['flag']
    ?.toString() ??
'';

// ==================================================
// COUNTRY TILE
// ==================================================

return Column(
children: [

ListTile(

// ==========================================
// TAP COUNTRY
// ==========================================

onTap: () {

Navigator.push(
context,

MaterialPageRoute(
builder: (context) =>
CountryDetailScreen(
country: country,
),
),
);
},

// ==========================================
// COUNTRY NAME
// ==========================================

title: Text(
countryName,

style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
),
),

// ==========================================
// CASES
// ==========================================

subtitle: Text(
"Cases: $cases",
),

// ==========================================
// FLAG
// ==========================================

leading: ClipRRect(
borderRadius:
BorderRadius.circular(5),

child: flag.isNotEmpty
? Image.network(
flag,

height: 50,
width: 70,

fit: BoxFit.cover,

errorBuilder:
(
context,
error,
stackTrace,
) {
return const Icon(
Icons.flag,
size: 40,
);
},
)
    : const Icon(
Icons.flag,
size: 40,
),
),

// ==========================================
// ARROW
// ==========================================

trailing: const Icon(
Icons.arrow_forward_ios,
size: 18,
),
),

const Divider(
height: 1,
),
],
);
},
);
},
),
),
],
),
),
);
}
}

