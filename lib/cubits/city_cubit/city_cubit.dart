import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/models/city_model.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityState());

  final Map<String, List<CityModel>> cityPlayGrounds = {
    'عدن': [
      CityModel(name: 'ملعب إنماء الجديد', image: kEnamImage),
      CityModel(name: 'ملعب جامعة الملك سعود', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
    ],
    'المهرة': [
      CityModel(name: 'ملعب الجوهرة', image: kEnamImage),
      CityModel(
        name: 'ملعب الأمير عبدالله الفيصل',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
    ],
    'شبوة': [
      CityModel(name: 'ملعب الأمير محمد بن فهد', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
    ],
    'حضرموت': [
      CityModel(name: 'ملعب الأمير محمد بن فهد', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
      CityModel(name: 'ملعب الراكة', image: kEnamImage),
    ],
  };

  void selectCity(String city) {
    emit(
      state.copyWith(selectedCity: city, playgrounds: cityPlayGrounds[city]),
    );
  }

  void reset() {
    emit(CityState()); // يعيد الحالة إلى الوضع الافتراضي (null)
  }
}
