import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/available_periods_cubit/available_periods_state.dart';
import 'package:reservision_app/models/available_period.dart';

class AvailablePeriodsCubit extends Cubit<AvailablePeriodsState> {
  AvailablePeriodsCubit()
      : super(AvailablePeriodsState(periods: [], pricePerHour: 0));

  void addPeriod(AvailablePeriod period) {
    emit(state.copyWith(periods: [...state.periods, period]));
  }

  void updatePeriod(String id, AvailablePeriod newPeriod) {
    final updated = state.periods.map((p) => p.id == id ? newPeriod : p).toList();
    emit(state.copyWith(periods: updated));
  }

  void deletePeriod(String id) {
    emit(state.copyWith(
        periods: state.periods.where((p) => p.id != id).toList()));
  }

  void setPricePerHour(double price) {
    emit(state.copyWith(pricePerHour: price));
  }
}

