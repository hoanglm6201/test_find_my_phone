import 'package:flutter/cupertino.dart';
import 'package:test_find_my_phone/data/model/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';

class Language {
  final BuildContext context;
  Language(this.context);

  List<LanguageModel> get languageItems => [
    LanguageModel(context.locale.spanish, 'es', 'assets/images/spanish_flag.png'),
    LanguageModel(context.locale.french, 'fr', 'assets/images/french_flag.png'),
    LanguageModel(context.locale.hindi, 'hi', 'assets/images/hindi_flag.png'),
    LanguageModel(context.locale.portuguese, 'pt', 'assets/images/portuguese_flag.png'),
    LanguageModel(context.locale.german, 'de', 'assets/images/german_flag.png'),
    LanguageModel(context.locale.korean, 'ko', 'assets/images/korean_flag.png'),
    LanguageModel(context.locale.japanese, 'ja', 'assets/images/japanese_flag.png'),
    LanguageModel(context.locale.english, 'en', 'assets/images/english_flag.png'),
  ];
}