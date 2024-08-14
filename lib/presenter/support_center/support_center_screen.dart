import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/model/dto/faq_category.dart';
import 'package:numeroid/domain/model/dto/faq_question.dart';
import 'package:numeroid/domain/repository/support_repository.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../../domain/model/dto/faq.dart';
import '../../utils/dialogs.dart';
import '../../widgets/kit/app_typography.dart';
import '../../widgets/kit/kit_textfield.dart';

class SupportCenterScreen extends StatefulWidget {
  const SupportCenterScreen({super.key});

  @override
  State<SupportCenterScreen> createState() => _SupportCenterScreenState();
}

class _SupportCenterScreenState extends State<SupportCenterScreen> {
  Faq? faq;
  FaqCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    loadFaq();
  }

  Future<void> loadFaq() async {
    final data = await SupportRepository().loadFaq();
    setState(() {
      selectedCategory = data.categories.first;
      faq = data;
    });
  }

  List<FaqQuestion> getQuestionList() {
    if (faq == null) return [];
    if (selectedCategory == null) return [];
    return faq!.questions.where((element) => selectedCategory!.questions.contains(element.id)).toList();
  }

  void onTapFastRequest() {
    Dialogs.showAppDialog(
      context: context,
      title: 'Детали бронирования',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Укажите номер бронирования и пин-код. Эти данные можно посмотреть вверху письма подтверждения',
              style: KitTextStyles.semiBold15,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: KitTextField(
                onChange: (v) {},
                title: 'Введите номер бронирования',
                maxLenght: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: KitTextField(
                onChange: (v) {},
                title: 'Введите пин-код',
                maxLenght: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: KitTextField(
                onChange: (v) {},
                title: 'Ваш вопрос в свободной форме',
                maxLenght: 100,
              ),
             
            ),
            Container(
              height: 1,
              color: appTheme.colors.border.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Повторная отправка подтверждения',
                style: KitTextStyles.semiBold16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: KitTextField(
                onChange: (v) {},
                title: 'Электронная почта',
                maxLenght: 20,
              ),
            ),
            AppButtonBlue(
              text: 'Отправить',
              onTap: () {},
              enable: false,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Центр поддержки',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Text(
                      'Свяжитесь с нами любым удобным способом. Мы работаем круглосуточно!',
                      style: KitTextStyles.medium14,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: 0.3,
                            child: _SupportButton(
                              text: 'Письмо в Нумероид',
                              iconPath: 'assets/icons/icon_mail.png',
                              onTap: () {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _SupportButton(
                            text: 'Форма мгновенной связи',
                            iconPath: 'assets/icons/icon_lightning.png',
                            onTap: onTapFastRequest,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (faq != null)
                Container(
                  width: double.infinity,
                  color: appTheme.colors.elements.paleBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                    child: Column(
                      children: [
                        const Text(
                          'Часто задаваемые вопросы',
                          style: KitTextStyles.bold18,
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: faq!.categories
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: _CategoryButton(
                                    category: e,
                                    isActive: e.name == selectedCategory?.name,
                                    onTap: (FaqCategory value) {
                                      setState(() {
                                        selectedCategory = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                            children: getQuestionList()
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: _Question(
                                      question: e,
                                    ),
                                  ),
                                )
                                .toList())
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportButton extends StatelessWidget {
  const _SupportButton({
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  final String iconPath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: appTheme.colors.elements.paleBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(iconPath),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 14),
                child: Text(
                  text,
                  style: KitTextStyles.bold16,
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                'assets/icons/icon_info.png',
                width: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.category,
    required this.onTap,
    required this.isActive,
  });

  final FaqCategory category;
  final ValueSetter<FaqCategory> onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(category),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: (isActive) ? appTheme.colors.brand.blue : Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            category.name,
            style: KitTextStyles.semiBold14.copyWith(color: (isActive) ? appTheme.colors.brand.blue : Colors.black),
          ),
        ),
      ),
    );
  }
}

class _Question extends StatefulWidget {
  const _Question({
    required this.question,
  });

  final FaqQuestion question;

  @override
  State<_Question> createState() => _QuestionState();
}

class _QuestionState extends State<_Question> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => setState(() {
                _expanded = !_expanded;
              }),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.question.question,
                        style: KitTextStyles.semiBold14,
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: (_expanded) ? appTheme.colors.background.greyLight : appTheme.colors.elements.paleBlue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: (_expanded) ? appTheme.colors.border.grey : appTheme.colors.border.blue,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        (_expanded) ? Icons.close_rounded : Icons.add_rounded,
                        size: 20,
                        color: (_expanded) ? appTheme.colors.elements.grey : appTheme.colors.brand.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.question.answer,
                  style: KitTextStyles.medium14,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
