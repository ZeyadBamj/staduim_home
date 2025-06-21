import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart'; // مسار جديد للحالة

// BookingCubit يدير حالة BookingState
class BookingCubit extends Cubit<BookingState> {
  // الحالة الأولية عند إنشاء Cubit
  BookingCubit() : super(BookingState(selectedDate: DateTime.now()));

  // دوال لتحديث الحالة بناءً على تفاعلات المستخدم
  void selectDate(DateTime date) {
    print('Cubit: Date selected in Cubit: $date');
    emit(state.copyWith(selectedDate: date));
  }

  void selectPlayerCategory(String category) {
    emit(state.copyWith(selectedPlayerCategory: category));
  }

  void selectFieldSize(String size) {
    emit(state.copyWith(selectedFieldSize: size));
  }

  void selectPeriod(String period) {
    emit(state.copyWith(selectedPeriod: period));
  }

  void selectPitchNumber(String pitchNumber) {
    emit(state.copyWith(selectedPitchNumber: pitchNumber));
  }

  void updateMessage(String message) {
    emit(state.copyWith(message: message));
  }
}
