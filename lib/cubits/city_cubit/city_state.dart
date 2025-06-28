import 'package:reservision_app/models/city_model.dart';

class CityState {
  final String? selectedCity;
  final List<CityModel> playgrounds;
  final List<CityModel> filteredPlaygrounds;
  final bool hasSearched;

  CityState({
    this.selectedCity,
    this.playgrounds = const [],
    this.filteredPlaygrounds = const [],
    this.hasSearched = false,
  });

  CityState copyWith({
    String? selectedCity,
    List<CityModel>? playgrounds,
    List<CityModel>? filteredPlaygrounds,
    bool? hasSearched,
  }) {
    return CityState(
      selectedCity: selectedCity ?? this.selectedCity,
      playgrounds: playgrounds ?? this.playgrounds,
      filteredPlaygrounds: filteredPlaygrounds ?? this.filteredPlaygrounds,
      hasSearched: hasSearched ?? this.hasSearched,
    );
  }
}
