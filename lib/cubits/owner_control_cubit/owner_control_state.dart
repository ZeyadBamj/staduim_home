import 'package:equatable/equatable.dart';
import 'package:reservision_app/models/owner_available_period_model.dart';

class OwnerControlState extends Equatable {
  final String? selectedSize;
  final Map<String, List<OwnerAvailablePeriodModel>> periods;
  final Map<String, double> pricePerHour;

  const OwnerControlState({
    this.selectedSize,
    required this.periods,
    required this.pricePerHour,
  });

  factory OwnerControlState.initial() => const OwnerControlState(
    selectedSize: null,
    periods: {},
    pricePerHour: {},
  );

  OwnerControlState copyWith({
    String? selectedSize,
    Map<String, List<OwnerAvailablePeriodModel>>? periods,
    Map<String, double>? pricePerHour,
  }) {
    return OwnerControlState(
      selectedSize: selectedSize ?? this.selectedSize,
      periods: periods ?? this.periods,
      pricePerHour: pricePerHour ?? this.pricePerHour,
    );
  }

  @override
  List<Object?> get props => [selectedSize, periods, pricePerHour];
}
