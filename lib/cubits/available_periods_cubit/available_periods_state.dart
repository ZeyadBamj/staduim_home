import 'package:reservision_app/models/available_period.dart';

class AvailablePeriodsState {
  final List<AvailablePeriod> periods;
  final double pricePerHour;

  AvailablePeriodsState({
    required this.periods,
    required this.pricePerHour,
  });

  AvailablePeriodsState copyWith({
    List<AvailablePeriod>? periods,
    double? pricePerHour,
  }) {
    return AvailablePeriodsState(
      periods: periods ?? this.periods,
      pricePerHour: pricePerHour ?? this.pricePerHour,
    );
  }
}
