 import 'package:flutter/material.dart';
import 'package:valorant/data/repo/repo_layer.dart';
import 'package:valorant/data/web_services/web_services.dart';

const String baseUrl = "https://valorant-api.com/v1";

final WebServices webServices = WebServices();
 final RepoLayer charactersRepository = RepoLayer( webServices: webServices);
 class Constant {
  static const String animation_one ='assets/lottie/intro_one_animation.json';
  static const String animation_two ='assets/lottie/intro_two_animated.json';
  static const String animation_three ='assets/lottie/intro_three_animation.json';







  static const String send_and_recive="Valorant";
  static const String quickly="Quickly";
  static const String send_whatever_u="Know your character";
  static const String all_files="Explore";
  static const String want="Want";
  static const String r_safe="Are Safe";
  static const String dec_one="Valorant is a team-based first-person tactical hero shooter set in the near future";
  static const String dec_two="Players play as one of a set of Agents, characters based on several countries and cultures around the world. In the main";
  static const String dec_three="game mode, players are assigned to either the attacking or defending team with each team having five players on it.";






  static Color title_onBoaronstding =const Color(0xff222221);
  static Color kora_color =const Color.fromRGBO(255, 178, 0, 0.2);
  static Color black_color =  Colors.black;
  static Color white_color = Colors.white;
  static Color disc_onBoarconstding =const Color(0xffB3B3B3);
  static Color next_btn_onBoarconstding =const Color(0xff277BC0);
  static Color go_to_gallary_color =const Color(0xff277BC0);
  static Color primary_color=const Color(0xffFFB200);
  static Color scaffold_background=const Color(0xffF5F5F5);
  static Color onboarding_dots=const Color(0xffD9D9D9);
  static Color brown_card=  const Color(0xff161615);
  static Color last_connection_card=  const Color(0xffFEF7DF);
  static Color icons_color=  const Color(0xff9D9D9D);
  static Color container_color=  const Color(0xff9D9D9D);
  static Color terminate_color=  const Color(0xffFA9579);
  static Color alert_color=  const Color(0xff1F1F1F);
  static Color terminate_session_color=  const Color(0xff1F1F1F);
  static Color last_date_color=  const Color(0xffB7B7B7);



  static TextStyle title_onBoarconstding_textStyle=  TextStyle(
      fontWeight: FontWeight.w700,fontSize: 32,fontFamily: "Ubuntu",color: title_onBoaronstding);
  static TextStyle desc_onBoarconstding_textStyle=  TextStyle(
      fontWeight: FontWeight.w500,fontSize: 18,fontFamily: "Ubuntu",color: disc_onBoarconstding);
  static TextStyle btn_onBoarconstding_textStyle= const TextStyle(
      fontSize: 18,
      fontFamily: "Ubuntu",
      fontWeight: FontWeight.w700,
      color: Color(0xffFFFFFF));
  static TextStyle avaliable_textStyle=const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: "Ubuntu"
  );
  static TextStyle gb_textStyle=const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xffFFF2D3),
      fontFamily: "Ubuntu"
  );
  static TextStyle go_to_gallary_textStyle= TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Constant.go_to_gallary_color,
      fontFamily: "Ubuntu"
  );

  static TextStyle last_date_textStyle=  TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Constant.last_date_color,
      fontFamily: "Ubuntu"
  );
  static TextStyle eight_textStyle=const TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Ubuntu"
  );
  static TextStyle take_textStyle=const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color : Color(0xff2C2D2E),
      fontFamily: "Ubuntu"
  );
  static TextStyle save_textStyle=const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color : Color(0xffFFB200),
      fontFamily: "Ubuntu"
  );
  static TextStyle last_textStyle=const TextStyle(
      color : Color(0xff141414),
      fontSize: 18, fontWeight: FontWeight.w500,

      fontFamily: "Ubuntu"
  );
  static TextStyle make_sure_textStyle=  TextStyle(
      color : Constant.primary_color,
      fontSize: 18, fontWeight: FontWeight.w500,

      fontFamily: "Ubuntu"
  );
  static TextStyle stay_textStyle=  const TextStyle(
      color : Colors.white,
      fontSize: 16, fontWeight: FontWeight.w500,
      fontFamily: "Ubuntu"
  );
  static TextStyle has_send_textStyle=  TextStyle(
      color : Constant.terminate_session_color,
      fontSize: 14, fontWeight: FontWeight.w500,
      fontFamily: "Ubuntu"
  );

  static TextStyle terminate_textStyle=   TextStyle(
      color : Constant.terminate_color,
      fontSize: 16, fontWeight: FontWeight.w500,
      fontFamily: "Ubuntu"
  );
  static TextStyle terminate_session_textStyle=   TextStyle(
      color : Constant.terminate_session_color,
      fontSize: 18, fontWeight: FontWeight.w700,
      fontFamily: "Ubuntu"
  );
  static TextStyle server_textStyle=  TextStyle(
      color : Constant.primary_color,
      fontSize: 18, fontWeight: FontWeight.w500,

      fontFamily: "Ubuntu"
  );
  static TextStyle go_back_textStyle=  TextStyle(
      color : Constant.next_btn_onBoarconstding,
      fontSize: 16, fontWeight: FontWeight.w500,

      fontFamily: "Ubuntu"
  );
  static TextStyle see_textStyle=const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color(0xff277BC0),

      fontFamily: "Ubuntu"
  );
  static TextStyle scanning_textStyle=const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xff1F1F1F),
      fontFamily: "Ubuntu"
  );
  static TextStyle alert_textStyle= TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Constant.alert_color,
      fontFamily: "Ubuntu"
  );
  static TextStyle receiving_textStyle=const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xff1F1F1F),
      fontFamily: "Ubuntu"
  );
  static TextStyle access_denied_textStyle=const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Color(0xff1F1F1F),
      fontFamily: "Ubuntu"
  );
  static TextStyle your_file_textStyle=const TextStyle(
      color: Color(0xff1F1F1F),
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontFamily: "Ubuntu"
  );
  static TextStyle scanning_share_textStyle=const TextStyle(
      color: Color(0xff181817),
      fontWeight: FontWeight.w500,
      fontSize: 32,
      fontFamily: "Ubuntu"
  );
  static TextStyle select_sender_textStyle=const TextStyle(
      color: Color(0xff181817),
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: "Ubuntu"
  );
  static TextStyle following_list_textStyle=  TextStyle(
      color: Constant.primary_color,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: "Ubuntu"
  );
  static TextStyle file_saved_textStyle=const TextStyle(
      color: Color(0x44181817),
      fontWeight: FontWeight.w300,
      fontSize: 13,
      fontFamily: "Ubuntu"
  );
  static TextStyle no_device_textStyle=const TextStyle(
      color: Color(0x44181817),
      fontWeight: FontWeight.w300,
      fontSize: 13,
      fontFamily: "Ubuntu"
  );
  static TextStyle wait_sender_textStyle=const TextStyle(
      color: Color(0xff181817),
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: "Ubuntu"
  );
  static TextStyle plz_re_scan_textStyle=  TextStyle(
      color: Constant.scaffold_background,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: "Ubuntu"
  );

  Constant._();
 }

