import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/presenter/search_screen/bloc/search_screen_bloc.dart';
import 'package:numeroid/widgets/components/containers.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';
import 'package:numeroid/widgets/kit/dropdown.dart';
import 'package:numeroid/widgets/kit/texts.dart';

import '../../domain/bloc/search/search_bloc.dart';
import '../../domain/model/bo/sort_type.dart';
import 'widgets/hotel_card.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(builder: (context, state) {
      return Column(
        children: [
          const _ListHeader(),
          if (!state.loading)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: state.searchState.hotels.length,
                itemBuilder: (context, index) {
                  return HotelCard(
                    hotel: state.searchState.hotels[index],
                    days: state.searchState.search.days,
                    adult: state.searchState.search.adults,
                    onTap: () {
                      appNavigator.pushRoute(
                        HotelDetailRoute(
                          hotelId: state.searchState.hotels[index].info.id,
                          searchParams: state.searchState.search,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          else
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: WhiteContainer(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 168,
                            height: 116,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              color: appTheme.colors.border.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}

class _ListHeader extends StatefulWidget {
  const _ListHeader();

  static final locale = {
    SortType.priceLessToMore: 'Цена (по возрастанию)',
    SortType.priceMoreToLess: 'Цена (по убыванию)',
    SortType.categoryLessToMore: 'Категория (по возрастанию)',
    SortType.categoryMoreToLess: 'Категория (по убыванию)',
    SortType.distance: 'Расстояние от центра',
  };

  @override
  State<_ListHeader> createState() => _ListHeaderState();
}

class _ListHeaderState extends State<_ListHeader> {
  final controller = KitDropDownController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state) {
          if (!state.loading) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: appTheme.colors.border.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${state.searchState.hotels.length} вариантов',
                            style: KitTextStyles.semiBold13,
                          ),
                        ),
                        KitDropDown(
                          copyChildWidth: false,
                          childContext: context,
                          controller: controller,
                          overlay: _SortMenu(
                            onTap: (SortType value) {
                              controller.close();
                              context.read<SearchScreenBloc>().searchBloc.add(
                                    SearchChangeSort(sort: value),
                                  );
                            },
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 1,
                                color: appTheme.colors.border.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text(
                                    _ListHeader.locale[state.searchState.sort] ?? '-',
                                    style: KitTextStyles.medium14,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.expand_more_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: appTheme.colors.border.grey,
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class _SortMenu extends StatelessWidget {
  const _SortMenu({
    required this.onTap,
  });

  static final locale = {
    SortType.priceLessToMore: 'Цена (по возрастанию)',
    SortType.priceMoreToLess: 'Цена (по убыванию)',
    SortType.categoryLessToMore: 'Категория (по возрастанию)',
    SortType.categoryMoreToLess: 'Категория (по убыванию)',
    SortType.distance: 'Расстояние от центра',
  };

  final ValueSetter<SortType> onTap;

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: SortType.values
            .map(
              (e) => InkWell(
                onTap: () => onTap(e),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: KitTextMedium14(locale[e] ?? '-'),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
