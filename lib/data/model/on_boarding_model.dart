import '../../constant/constant.dart';

class OnBoardingModel {
  String image;
  String title;
  String description;

  OnBoardingModel(
      {required this.image,
        required this.title,
        required this.description,
        });
}

List data = [];
List<OnBoardingModel> contents = [
  OnBoardingModel(
      title: Constant.send_and_recive,
      image: Constant.animation_one,
      description: Constant.dec_one),
  OnBoardingModel(
      title: Constant.send_whatever_u,
      image: Constant.animation_two,
      description: Constant.dec_two),
  OnBoardingModel(
      title: Constant.all_files,
      image: Constant.animation_three,
      description: Constant.dec_three),
];
