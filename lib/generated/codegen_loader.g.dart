// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Hello": "Hi",
    "inputusername": "What do people call you?",
    "username": "Full Name",
    "userphone": "Phone Number",
    "phonenumber": "Enter your phone number",
    "inputphone": "Phone format: (XXX)-XXX-XX-XX",
    "inputemail": "Enter a email address",
    "inputcountry": "Country",
  };
  static const Map<String, dynamic> kk = {
    "Hello": "Сәлем",
    "inputusername": "Сізді қалай атаған жөн?",
    "username": "Толық Атыңыз",
    "userphone": "Телефон Нөмірі",
    "phonenumber": "Нөміріңізді енгізіңіз",
    "inputphone": "Телефон форматы: (XXX)-XXX-XX-XX",
    "inputemail": "Өзіңіздің email адрессіңізді жазыңыз",
    "inputcountry": "Мемлекет",
  };
  static const Map<String, dynamic> ru = {
    "Hello": "Привет",
    "inputusername": "Как вы хотите чтобы вас звали?",
    "username": "Полное Имя",
    "userphone": "Номер Телефона",
    "phonenumber": "Введите номер телефона",
    "inputphone": "Формат телефона: (XXX)-XXX-XX-XX",
    "inputemail": "Введите ваш email адресс",
    "inputcountry": "Страна",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
