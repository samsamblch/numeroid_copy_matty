import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/dto/faq.dart';

class SupportRepository {
  Future<Faq> loadFaq() async {
    final String response = await rootBundle.loadString('assets/jsons/support_faq_ru.json');
    final Faq faq = Faq.fromJson(json.decode(response));
    return faq;
  }

  Future<String> loadText({required String fileName}) async {
    return await rootBundle.loadString('assets/texts/$fileName');
  }
}
