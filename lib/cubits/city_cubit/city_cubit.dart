import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/models/cities_model.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityState());

  final Map<String, List<CitiesModel>> cityPlaygrounds = {
    'عدن': [
      CitiesModel(
        name: 'ملعب الملك فهد',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(
        name: 'ملعب جامعة الملك سعود',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
    ],
    'المهرة': [
      CitiesModel(
        name: 'ملعب الجوهرة',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(
        name: 'ملعب الأمير عبدالله الفيصل',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
    ],
    'شبوة': [
      CitiesModel(
        name: 'ملعب الأمير محمد بن فهد',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
    ],
    'حضرموت': [
      CitiesModel(
        name: 'ملعب الأمير محمد بن فهد',
        image: 'assets/images/enma_staduim.jpg',
      ),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
      CitiesModel(name: 'ملعب الراكة', image: 'assets/images/enma_staduim.jpg'),
    ],
  };

  void selectCity(String city) {
    emit(
      state.copyWith(selectedCity: city, playgrounds: cityPlaygrounds[city]),
    );
  }
  void reset() {
  emit(CityState()); // يعيد الحالة إلى الوضع الافتراضي (null)
}
}
