import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../domain/bloc/search/search_bloc.dart';
import '../../domain/model/bo/filter_budget.dart';
import '../../domain/model/bo/filter_distance.dart';
import '../../domain/model/bo/filter_stars.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({
    super.key,
  });

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<SearchBloc>(),
      child: AppScaffold(
        title: 'Выбрать по критериям',
        child: SingleChildScrollView(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppButtonBlue(
                          text: 'Применить',
                          onTap: () {
                            // context.read<SearchBloc>().add(
                            //   ChangeFilterParameters(
                            //     filterParameters: params,
                            //   ),
                            // );

                            context.pop();
                          }),
                    ),
                    _FilterGroup(
                      title: 'Ваш бюджет (за ночь)',
                      items: [
                        _FilterItem(
                          text: '0 руб. - 5 000 руб.',
                          count: 0,
                          isOn: state.filter.budget.contains(FilterBudget.zeroFive),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeBudget(FilterBudget.zeroFive);
                            });
                          },
                        ),
                        _FilterItem(
                          text: '5 000 руб. - 10 000 руб.',
                          count: 0,
                          isOn: state.filter.budget.contains(FilterBudget.fiveTen),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeBudget(FilterBudget.fiveTen);
                            });
                          },
                        ),
                        _FilterItem(
                          text: '10 000 руб. - 15 000 руб.',
                          count: 0,
                          isOn: state.filter.budget.contains(FilterBudget.tenFifteen),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeBudget(FilterBudget.tenFifteen);
                            });
                          },
                        ),
                        _FilterItem(
                          text: '15 000 руб. - 20 000 руб.',
                          count: 0,
                          isOn: state.filter.budget.contains(FilterBudget.fifteenTwenty),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeBudget(FilterBudget.fifteenTwenty);
                            });
                          },
                        ),
                        _FilterItem(
                          text: '20 000 руб. +',
                          count: 0,
                          isOn: state.filter.budget.contains(FilterBudget.twentyMore),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeBudget(FilterBudget.twentyMore);
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
                          isOn: state.filter.stars.contains(FilterStars.zero),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.zero);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Одна звезда',
                          count: 0,
                          isOn: state.filter.stars.contains(FilterStars.one),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.one);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Две звезды',
                          count: 0,
                          isOn: state.filter.stars.contains(FilterStars.two),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.two);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Три звезды',
                          count: 0,
                          isOn: state.filter.stars.contains(FilterStars.three),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.three);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Четыре звезды',
                          count: 0,
                          isOn: state.filter.stars.contains(FilterStars.four),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.four);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Пять звезд',
                          count: 0,
                          isOn: state.filter.stars.contains(FilterStars.five),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeStars(FilterStars.five);
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
                          isOn: state.filter.distance.contains(FilterDistance.one),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeDistance(FilterDistance.one);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Меньше 3 километров',
                          count: 0,
                          isOn: state.filter.distance.contains(FilterDistance.three),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeDistance(FilterDistance.three);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Меньше 5 километров',
                          count: 0,
                          isOn: state.filter.distance.contains(FilterDistance.fiveLess),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeDistance(FilterDistance.fiveLess);
                            });
                          },
                        ),
                        _FilterItem(
                          text: 'Больше 5 километров',
                          count: 0,
                          isOn: state.filter.distance.contains(FilterDistance.fiveMore),
                          onChanged: (value) {
                            setState(() {
                              state.filter.changeDistance(FilterDistance.fiveMore);
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
                          isOn: state.filter.cancelled,
                          onChanged: (value) {
                            setState(() {
                              state.filter.cancelled = !state.filter.cancelled;
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
                          isOn: state.filter.cancelled,
                          onChanged: (value) {
                            setState(() {
                              state.filter.meal = !state.filter.meal;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
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
              style: KitTextStyles.bold16,
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
                side: WidgetStateBorderSide.resolveWith(
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
              style: KitTextStyles.medium14,
            ),
          ),
          Text(
            count.toString(),
            style: KitTextStyles.semiBold14,
          ),
        ],
      ),
    );
  }
}
