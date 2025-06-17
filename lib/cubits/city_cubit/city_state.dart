import 'package:reservision_app/models/cities_model.dart';


class CityState {
  final String? selectedCity;
  final List<CitiesModel> playgrounds;

  CityState({this.selectedCity, this.playgrounds = const []});

  CityState copyWith({
    String? selectedCity,
    List<CitiesModel>? playgrounds,
  }) {
    return CityState(
      selectedCity: selectedCity ?? this.selectedCity,
      playgrounds: playgrounds ?? this.playgrounds,
    );
  }
}
