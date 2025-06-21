import 'package:bloc/bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  goTo(int index) {
    print('Click on BottomNavigationBar number: $index');
    emit(index);
  }
}
