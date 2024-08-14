import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroid/core/app_route.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/domain/bloc/search/search_bloc.dart';
import 'package:numeroid/utils/formatters.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';
import 'package:numeroid/widgets/kit/texts.dart';

import '../../utils/dialogs.dart';
import '../../widgets/calendar.dart';
import '../../widgets/location_text_field.dart';
import 'bloc/search_screen_bloc.dart';
import 'search_list_page.dart';
import 'search_map_page.dart';
import 'widgets/rooms_dialog_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isMap = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => SearchScreenBloc(
          searchBloc: locator<SearchBloc>(),
        ),
        child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, right: 10, bottom: 12),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 24,
                                  color: Colors.grey.shade500,
                                ),
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                              const Expanded(
                                child: _FilterLocation(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: _FilterMore(),
                      ),
                      if (!_isMap)
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: (!state.loading)
                                ? AppButtonBlue(
                                    text: 'Найти',
                                    onTap: () {
                                      locator<SearchBloc>().add(
                                        SearchStart(),
                                      );
                                    },
                                  )
                                : Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      (_isMap) ? const SearchMapPage() : const SearchListPage(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1, color: appTheme.colors.border.grey),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isMap = !_isMap;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/icons/${_isMap ? 'list' : 'map'}_indicator.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    KitTextMedium14(
                                      (_isMap) ? 'Список' : 'Карта',
                                      color: appTheme.colors.text.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FilterMore extends StatelessWidget {
  const _FilterMore();

  @override
  Widget build(BuildContext context) {
    final globalState = locator<SearchBloc>().state;
    return SizedBox(
      height: 36,
      child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: (!state.loading)
                    ? InkWell(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Выбор дат',
                            autoScroll: false,
                            body: AppCalendar(
                              beginPeriod: globalState.search.startDate,
                              endPeriod: globalState.search.endDate,
                              onApplyPeriod: ((DateTime, DateTime) value) {
                                context.read<SearchBloc>().add(
                                      SearchChangeDate(start: value.$1, end: value.$2),
                                    );
                                context.pop();
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${Formatters.fromDateCalendar2(globalState.search.startDate)} - ${Formatters.fromDateCalendar2(globalState.search.endDate)}',
                              style: KitTextStyles.medium13.copyWith(
                                color: appTheme.colors.text.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
              ),
              const SizedBox(width: 6),
              Expanded(
                flex: 2,
                child: (!state.loading)
                    ? GestureDetector(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Гости и номера',
                            body: RoomsDialogBody(
                              rooms: globalState.search.rooms,
                              onApply: (value) {
                                context.read<SearchBloc>().add(
                                      SearchChangeRoom(rooms: value),
                                    );
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${globalState.search.adults} гость',
                              style: KitTextStyles.medium13.copyWith(
                                color: appTheme.colors.text.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
              ),
              const SizedBox(width: 6),
              Expanded(
                flex: 3,
                child: (!state.loading)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            width: 1,
                            color: appTheme.colors.elements.blue,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.push(AppRoutes.searchFilter);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.tune_rounded,
                                color: appTheme.colors.elements.blue,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Фильтры',
                                style: KitTextStyles.medium13.copyWith(
                                  color: appTheme.colors.elements.blue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FilterLocation extends StatelessWidget {
  const _FilterLocation();

  // final City? city;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        return (!state.loading)
            ? LocationTextField(
                city: state.searchState.search.city,
                enableBorder: true,
                onChange: (value) {
                  context.read<SearchScreenBloc>().searchBloc.add(SearchChangeCity(city: value));
                })
            : Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
      },
    );
  }
}
