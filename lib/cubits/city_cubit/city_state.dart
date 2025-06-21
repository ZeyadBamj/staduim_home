import 'package:reservision_app/models/city_model.dart';

class CityState {
  final String? selectedCity;
  final List<CityModel> playgrounds;

  CityState({this.selectedCity, this.playgrounds = const []});

  CityState copyWith({String? selectedCity, List<CityModel>? playgrounds}) {
    return CityState(
      selectedCity: selectedCity ?? this.selectedCity,
      playgrounds: playgrounds ?? this.playgrounds,
    );
  }
}
