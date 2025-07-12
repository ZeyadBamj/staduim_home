import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/models/playground_model.dart';
import 'playground_state.dart';

class PlaygroundCubit extends Cubit<PlayGroundState> {
  PlaygroundCubit() : super(PlayGroundState());
  final Map<PlayGroundModel, String> playgroundCityMap = {};

  final Map<String, List<PlayGroundModel>> playGrounds = {
    'عدن': [
      PlayGroundModel(
        name: 'ملعب إنماء الجديد',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب جامعة الملك سعود',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
    ],
    'المهرة': [
      PlayGroundModel(
        name: 'ملعب الجوهرة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الأمير عبدالله الفيصل',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
    ],
    'شبوة': [
      PlayGroundModel(
        name: 'ملعب الأمير محمد بن فهد',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
    ],
    'حضرموت': [
      PlayGroundModel(
        name: 'ملعب الأمير محمد بن فهد',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
      PlayGroundModel(
        name: 'ملعب الراكة',
        images: [
          kEnamImage,
          kBallImage,
          kCategoryImage,
          kBackgroundImage,
          kEnamImage,
        ],
        image: kEnamImage,
      ),
    ],
  };

  void selectCity(String city) {
    emit(state.copyWith(selectedCity: city, playgrounds: playGrounds[city]));
  }

  List<PlayGroundModel> getAllPlaygrounds() {
    return playGrounds.values.expand((list) => list).toList();
  }

  void searchAllCitiesPlaygrounds(String query) {
  playgroundCityMap.clear(); // امسح القديم قبل كل عملية بحث

  final results = <PlayGroundModel>[];

  playGrounds.forEach((city, playgroundsList) {
    for (final pg in playgroundsList) {
      if (pg.name.toLowerCase().contains(query.toLowerCase()) ||
          city.toLowerCase().contains(query.toLowerCase())) {
        results.add(pg);
        playgroundCityMap[pg] = city; // اربط كل ملعب بمدينة
      }
    }
  });

  emit(
    state.copyWith(
      filteredPlaygrounds: results,
      hasSearched: query.isNotEmpty,
    ),
  );
}
}
