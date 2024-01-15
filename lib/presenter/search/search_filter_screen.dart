import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import 'bloc/search_bloc.dart';
import 'models/filter_parameters.dart';

@RoutePage()
class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({
    super.key,
  });

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  bool onCha = false;

  late FilterParameters params;

  @override
  void initState() {
    params = locator<SearchBloc>().filterParameters;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<SearchBloc>(),
      child: AppScaffold(
        title: 'Выбрать по критериям',
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppButtonBlue(
                      text: 'Применить',
                      onTap: () {
                        locator<SearchBloc>().add(
                          ChangeFilterParameters(
                            filterParameters: params,
                          ),
                        );
                        appNavigator.pop();
                      }),
                ),
                _FilterGroup(
                  title: 'Ваш бюджет (за ночь)',
                  items: [
                    _FilterItem(
                      text: '0 руб. - 5 000 руб.',
                      count: 0,
                      isOn: params.budget.contains(FilterBudget.zeroFive),
                      onChanged: (value) {
                        setState(() {
                          params.changeBudget(FilterBudget.zeroFive);
                        });
                      },
                    ),
                    _FilterItem(
                      text: '5 000 руб. - 10 000 руб.',
                      count: 0,
                      isOn: params.budget.contains(FilterBudget.fiveTen),
                      onChanged: (value) {
                        setState(() {
                          params.changeBudget(FilterBudget.fiveTen);
                        });
                      },
                    ),
                    _FilterItem(
                      text: '10 000 руб. - 15 000 руб.',
                      count: 0,
                      isOn: params.budget.contains(FilterBudget.tenFifteen),
                      onChanged: (value) {
                        setState(() {
                          params.changeBudget(FilterBudget.tenFifteen);
                        });
                      },
                    ),
                    _FilterItem(
                      text: '15 000 руб. - 20 000 руб.',
                      count: 0,
                      isOn: params.budget.contains(FilterBudget.fifteenTwenty),
                      onChanged: (value) {
                        setState(() {
                          params.changeBudget(FilterBudget.fifteenTwenty);
                        });
                      },
                    ),
                    _FilterItem(
                      text: '20 000 руб. +',
                      count: 0,
                      isOn: params.budget.contains(FilterBudget.twentyMore),
                      onChanged: (value) {
                        setState(() {
                          params.changeBudget(FilterBudget.twentyMore);
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: appTheme.colors.border.grey,
                ),
                _FilterGroup(
                  title: 'Количество звезд',
                  items: [
                    _FilterItem(
                      text: 'Без звезд',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.zero),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.zero);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Одна звезда',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.one),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.one);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Две звезды',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.two),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.two);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Три звезды',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.three),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.three);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Четыре звезды',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.four),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.four);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Пять звезд',
                      count: 0,
                      isOn: params.stars.contains(FilterStars.five),
                      onChanged: (value) {
                        setState(() {
                          params.changeStars(FilterStars.five);
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: appTheme.colors.border.grey,
                ),
                _FilterGroup(
                  title: '<city.name>: расстояние от цента',
                  items: [
                    _FilterItem(
                      text: 'Меньше 1 километра',
                      count: 0,
                      isOn: params.distance.contains(FilterDistance.one),
                      onChanged: (value) {
                        setState(() {
                          params.changeDistance(FilterDistance.one);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Меньше 3 километров',
                      count: 0,
                      isOn: params.distance.contains(FilterDistance.three),
                      onChanged: (value) {
                        setState(() {
                          params.changeDistance(FilterDistance.three);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Меньше 5 километров',
                      count: 0,
                      isOn: params.distance.contains(FilterDistance.fiveLess),
                      onChanged: (value) {
                        setState(() {
                          params.changeDistance(FilterDistance.fiveLess);
                        });
                      },
                    ),
                    _FilterItem(
                      text: 'Больше 5 километров',
                      count: 0,
                      isOn: params.distance.contains(FilterDistance.fiveMore),
                      onChanged: (value) {
                        setState(() {
                          params.changeDistance(FilterDistance.fiveMore);
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: appTheme.colors.border.grey,
                ),
                _FilterGroup(
                  title: 'Политика отмены',
                  items: [
                    _FilterItem(
                      text: 'Бесплатная отмена',
                      count: 0,
                      isOn: params.cancelled,
                      onChanged: (value) {
                        setState(() {
                          params.cancelled = !params.cancelled;
                        });
                      },
                    ),
                  ],
                ),
                _FilterGroup(
                  title: 'Питание',
                  items: [
                    _FilterItem(
                      text: 'Завтрак включен',
                      count: 0,
                      isOn: params.cancelled,
                      onChanged: (value) {
                        setState(() {
                          params.meal = !params.meal;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterGroup extends StatelessWidget {
  const _FilterGroup({
    required this.title,
    required this.items,
  });

  final String title;
  final List<_FilterItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: AppTypography.bold16,
            ),
          ),
          Column(
            children: items,
          )
        ],
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  const _FilterItem({
    required this.onChanged,
    required this.isOn,
    required this.text,
    required this.count,
  });

  final String text;
  final int count;
  final bool isOn;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: appTheme.colors.brand.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1, color: Colors.grey.shade500),
                ),
                value: isOn,
                onChanged: onChanged,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.medium14,
            ),
          ),
          Text(
            count.toString(),
            style: AppTypography.semiBold14,
          ),
        ],
      ),
    );
  }
}
