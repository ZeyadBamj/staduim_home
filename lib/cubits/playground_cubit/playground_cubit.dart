import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/models/playground_model.dart';
import 'playground_state.dart';

class PlaygroundCubit extends Cubit<PlayGroundState> {
  PlaygroundCubit() : super(PlayGroundState());

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
}
