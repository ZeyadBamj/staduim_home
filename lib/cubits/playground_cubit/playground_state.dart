import 'package:reservision_app/models/playground_model.dart';

class PlayGroundState {
  final String? selectedCity;
  final List<PlayGroundModel> playgrounds;
  final List<PlayGroundModel> filteredPlaygrounds;
  final bool hasSearched;

  PlayGroundState({
    this.selectedCity,
    this.playgrounds = const [],
    this.filteredPlaygrounds = const [],
    this.hasSearched = false,
  });

  PlayGroundState copyWith({
    String? selectedCity,
    List<PlayGroundModel>? playgrounds,
    List<PlayGroundModel>? filteredPlaygrounds,
    bool? hasSearched,
  }) {
    return PlayGroundState(
      selectedCity: selectedCity ?? this.selectedCity,
      playgrounds: playgrounds ?? this.playgrounds,
      filteredPlaygrounds: filteredPlaygrounds ?? this.filteredPlaygrounds,
      hasSearched: hasSearched ?? this.hasSearched,
    );
  }
}
