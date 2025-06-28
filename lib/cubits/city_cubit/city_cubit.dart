import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/models/city_model.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityState());
  CityModel? cityModel;

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

  void searchPlaygrounds(String query) {
    final results =
        state.playgrounds.where((playground) {
          return playground.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

    emit(
      state.copyWith(
        filteredPlaygrounds: results,
        hasSearched: query.isNotEmpty,
      ),
    );
  }

  List<CityModel> get allPlaygrounds {
    return cityPlayGrounds.values.expand((list) => list).toList();
  }
  //   void searchAllCitiesPlaygrounds(String query) {
  //   final allFields = allPlaygrounds;
  //   final results = allFields.where((field) {
  //     return field.name.toLowerCase().contains(query.toLowerCase());
  //   }).toList();

  //   emit(state.copyWith(
  //     filteredPlaygrounds: results,
  //     hasSearched: query.isNotEmpty,
  //   ));
  // }

  void searchAllCitiesPlaygrounds(String query) {
    final all = getAllPlaygrounds();

    final results =
        all.where((playground) {
          return playground.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

    emit(
      state.copyWith(
        filteredPlaygrounds: results,
        hasSearched: query.isNotEmpty,
      ),
    );
  }

  void loadAllPlaygrounds() {
    final all = allPlaygrounds;
    emit(
      state.copyWith(
        playgrounds: all,
        filteredPlaygrounds: all,
        hasSearched: false,
      ),
    );
  }

  List<CityModel> getAllPlaygrounds() {
    return cityPlayGrounds.values.expand((list) => list).toList();
  }
}
