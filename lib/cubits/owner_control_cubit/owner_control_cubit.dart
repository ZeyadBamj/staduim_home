import 'package:flutter_bloc/flutter_bloc.dart';
import 'owner_control_state.dart';
import 'package:reservision_app/models/available_period.dart';

class OwnerControlCubit extends Cubit<OwnerControlState> {
  OwnerControlCubit() : super(OwnerControlState.initial());

  void selectSize(String size) {
    emit(state.copyWith(selectedSize: size));
  }

  void setPriceForSize(String size, double price) {
    final newPrices = Map<String, double>.from(state.pricePerHour);
    newPrices[size] = price;
    emit(state.copyWith(pricePerHour: newPrices));
  }

  void addPeriod(String size, AvailablePeriod period) {
    final updatedPeriods = Map<String, List<AvailablePeriod>>.from(state.periods);
    final list = List<AvailablePeriod>.from(updatedPeriods[size] ?? []);
    list.add(period);
    updatedPeriods[size] = list;
    emit(state.copyWith(periods: updatedPeriods));
  }

  void updatePeriod(String size, String id, AvailablePeriod newPeriod) {
    final updatedPeriods = Map<String, List<AvailablePeriod>>.from(state.periods);
    final list = List<AvailablePeriod>.from(updatedPeriods[size] ?? []);
    final index = list.indexWhere((p) => p.id == id);
    if (index != -1) {
      list[index] = newPeriod;
      updatedPeriods[size] = list;
      emit(state.copyWith(periods: updatedPeriods));
    }
  }

  void deletePeriod(String size, String id) {
    final updatedPeriods = Map<String, List<AvailablePeriod>>.from(state.periods);
    final list = List<AvailablePeriod>.from(updatedPeriods[size] ?? []);
    list.removeWhere((p) => p.id == id);
    updatedPeriods[size] = list;
    emit(state.copyWith(periods: updatedPeriods));
  }
}
