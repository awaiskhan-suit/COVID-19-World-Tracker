/// updated : 1789212121077
/// cases : 704753890
/// todayCases : 0
/// deaths : 7010681
/// todayDeaths : 0
/// recovered : 675619811
/// todayRecovered : 790
/// active : 22123398
/// critical : 34794
/// casesPerOneMillion : 90413
/// deathsPerOneMillion : 899.4
/// tests : 7026505313
/// testsPerOneMillion : 884400.59
/// population : 7944935131
/// oneCasePerPeople : 0
/// oneDeathPerPeople : 0
/// oneTestPerPeople : 0
/// activePerOneMillion : 2784.59
/// recoveredPerOneMillion : 85037.8
/// criticalPerOneMillion : 4.38
/// affectedCountries : 231

class WorldStateModel {
  // Constructor
  WorldStateModel({
    required num updated,
    required num cases,
    required num todayCases,
    required num deaths,
    required num todayDeaths,
    required num recovered,
    required num todayRecovered,
    required num active,
    required num critical,
    required num casesPerOneMillion,
    required num deathsPerOneMillion,
    required num tests,
    required num testsPerOneMillion,
    required num population,
    required num oneCasePerPeople,
    required num oneDeathPerPeople,
    required num oneTestPerPeople,
    required num activePerOneMillion,
    required num recoveredPerOneMillion,
    required num criticalPerOneMillion,
    required num affectedCountries,
  }) {
    _updated = updated;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _todayDeaths = todayDeaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _casesPerOneMillion = casesPerOneMillion;
    _deathsPerOneMillion = deathsPerOneMillion;
    _tests = tests;
    _testsPerOneMillion = testsPerOneMillion;
    _population = population;
    _oneCasePerPeople = oneCasePerPeople;
    _oneDeathPerPeople = oneDeathPerPeople;
    _oneTestPerPeople = oneTestPerPeople;
    _activePerOneMillion = activePerOneMillion;
    _recoveredPerOneMillion = recoveredPerOneMillion;
    _criticalPerOneMillion = criticalPerOneMillion;
    _affectedCountries = affectedCountries;
  }

  // From JSON
  WorldStateModel.fromJson(dynamic json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }

  // Variables
  late num _updated;
  late num _cases;
  late num _todayCases;
  late num _deaths;
  late num _todayDeaths;
  late num _recovered;
  late num _todayRecovered;
  late num _active;
  late num _critical;
  late num _casesPerOneMillion;
  late num _deathsPerOneMillion;
  late num _tests;
  late num _testsPerOneMillion;
  late num _population;
  late num _oneCasePerPeople;
  late num _oneDeathPerPeople;
  late num _oneTestPerPeople;
  late num _activePerOneMillion;
  late num _recoveredPerOneMillion;
  late num _criticalPerOneMillion;
  late num _affectedCountries;

  // Copy With
  WorldStateModel copyWith({
    num? updated,
    num? cases,
    num? todayCases,
    num? deaths,
    num? todayDeaths,
    num? recovered,
    num? todayRecovered,
    num? active,
    num? critical,
    num? casesPerOneMillion,
    num? deathsPerOneMillion,
    num? tests,
    num? testsPerOneMillion,
    num? population,
    num? oneCasePerPeople,
    num? oneDeathPerPeople,
    num? oneTestPerPeople,
    num? activePerOneMillion,
    num? recoveredPerOneMillion,
    num? criticalPerOneMillion,
    num? affectedCountries,
  }) {
    return WorldStateModel(
      updated: updated ?? _updated,
      cases: cases ?? _cases,
      todayCases: todayCases ?? _todayCases,
      deaths: deaths ?? _deaths,
      todayDeaths: todayDeaths ?? _todayDeaths,
      recovered: recovered ?? _recovered,
      todayRecovered: todayRecovered ?? _todayRecovered,
      active: active ?? _active,
      critical: critical ?? _critical,
      casesPerOneMillion:
      casesPerOneMillion ?? _casesPerOneMillion,
      deathsPerOneMillion:
      deathsPerOneMillion ?? _deathsPerOneMillion,
      tests: tests ?? _tests,
      testsPerOneMillion:
      testsPerOneMillion ?? _testsPerOneMillion,
      population: population ?? _population,
      oneCasePerPeople:
      oneCasePerPeople ?? _oneCasePerPeople,
      oneDeathPerPeople:
      oneDeathPerPeople ?? _oneDeathPerPeople,
      oneTestPerPeople:
      oneTestPerPeople ?? _oneTestPerPeople,
      activePerOneMillion:
      activePerOneMillion ?? _activePerOneMillion,
      recoveredPerOneMillion:
      recoveredPerOneMillion ?? _recoveredPerOneMillion,
      criticalPerOneMillion:
      criticalPerOneMillion ?? _criticalPerOneMillion,
      affectedCountries:
      affectedCountries ?? _affectedCountries,
    );
  }

  // Getters
  num get updated => _updated;
  num get cases => _cases;
  num get todayCases => _todayCases;
  num get deaths => _deaths;
  num get todayDeaths => _todayDeaths;
  num get recovered => _recovered;
  num get todayRecovered => _todayRecovered;
  num get active => _active;
  num get critical => _critical;
  num get casesPerOneMillion => _casesPerOneMillion;
  num get deathsPerOneMillion => _deathsPerOneMillion;
  num get tests => _tests;
  num get testsPerOneMillion => _testsPerOneMillion;
  num get population => _population;
  num get oneCasePerPeople => _oneCasePerPeople;
  num get oneDeathPerPeople => _oneDeathPerPeople;
  num get oneTestPerPeople => _oneTestPerPeople;
  num get activePerOneMillion => _activePerOneMillion;
  num get recoveredPerOneMillion => _recoveredPerOneMillion;
  num get criticalPerOneMillion => _criticalPerOneMillion;
  num get affectedCountries => _affectedCountries;

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['updated'] = _updated;
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['todayDeaths'] = _todayDeaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;
    map['casesPerOneMillion'] = _casesPerOneMillion;
    map['deathsPerOneMillion'] = _deathsPerOneMillion;
    map['tests'] = _tests;
    map['testsPerOneMillion'] = _testsPerOneMillion;
    map['population'] = _population;
    map['oneCasePerPeople'] = _oneCasePerPeople;
    map['oneDeathPerPeople'] = _oneDeathPerPeople;
    map['oneTestPerPeople'] = _oneTestPerPeople;
    map['activePerOneMillion'] = _activePerOneMillion;
    map['recoveredPerOneMillion'] = _recoveredPerOneMillion;
    map['criticalPerOneMillion'] = _criticalPerOneMillion;
    map['affectedCountries'] = _affectedCountries;

    return map;
  }
}