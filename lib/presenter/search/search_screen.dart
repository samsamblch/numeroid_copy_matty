import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/presenter/search/bloc/search_bloc.dart';
import 'package:numeroid/presenter/search/search_list_page.dart';
import 'package:numeroid/presenter/search/search_map_page.dart';
import 'package:numeroid/utils/formatters.dart';
import 'package:numeroid/widgets/app_scaffold.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../../domain/model/dto/city.dart';
import '../../utils/dialogs.dart';
import 'widgets/location_text_field.dart';
import 'widgets/rooms_dialog_body.dart';

@RoutePage()
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
      child: BlocProvider.value(
        value: locator<SearchBloc>(),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 14, right: 10, bottom: 12),
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
                                  appNavigator.pop();
                                },
                              ),
                              Expanded(
                                child: _FilterLocation(
                                  city: context
                                      .read<SearchBloc>()
                                      .searchParameters
                                      .city,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: _FilterMore(),
                      ),
                      if (!_isMap)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: (state is SearchFinish)
                                ? AppButtonBlue(
                                    text: 'Найти',
                                    onTap: () {
                                      locator<SearchBloc>().add(
                                        StartSearch(
                                          searchParameters: state.search,
                                        ),
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
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isMap = !_isMap;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  (_isMap) ? 'Список' : 'Карта',
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
    return SizedBox(
      height: 36,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: (state is SearchFinish)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${Formatters.fromDateCalendar2(state.search.startDate)} - ${Formatters.fromDateCalendar2(state.search.startDate)}',
                            style: AppTypography.medium13.copyWith(
                              color: appTheme.colors.text.primary,
                            ),
                            textAlign: TextAlign.center,
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
                child: (state is SearchFinish)
                    ? GestureDetector(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Гости и номера',
                            body: RoomsDialogBody(
                              rooms: state.search.rooms,
                              onApply: (value) {
                                context.read<SearchBloc>().add(
                                      ChangeRooms(rooms: value),
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
                              '${state.search.allAdult()} гость',
                              style: AppTypography.medium13.copyWith(
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
                child: (state is SearchFinish)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            width: 1,
                            color: appTheme.colors.active.blue,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            appNavigator.pushRoute(
                              const SearchFilterRoute(),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.tune_rounded,
                                color: appTheme.colors.active.blue,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Фильтры',
                                style: AppTypography.medium13.copyWith(
                                  color: appTheme.colors.active.blue,
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
  const _FilterLocation({this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return (state is SearchFinish)
            ? LocationTextField(
                city: city, enableBorder: true, onChange: (value) {})
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
