import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/domain/model/bo/search_params.dart';
import 'package:numeroid/presenter/search/widgets/location_text_field.dart';
import 'package:numeroid/widgets/calendar.dart';

import '../../../core/app_typography.dart';
import '../../../core/locator.dart';
import '../../../domain/model/dto/city.dart';
import '../../../domain/model/req/search_req.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/components/buttons.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/components/spacers.dart';
import '../bloc/search_bloc.dart';
import 'rooms_dialog_body.dart';

class YellowSearchPanel extends StatefulWidget {
  const YellowSearchPanel({
    super.key,
    required this.onTapSearch,
  });

  final ValueSetter<SearchParams> onTapSearch;

  @override
  State<YellowSearchPanel> createState() => _OrangeSearchPanelState();
}

class _OrangeSearchPanelState extends State<YellowSearchPanel> {
  City? city;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(
    const Duration(days: 7),
  );
  List<SearchRoom> rooms = [
    SearchRoom.create(),
  ];

  void onTapSearch() {
    final filter = SearchParams(
      city: city,
      startDate: startDate,
      endDate: endDate,
      rooms: rooms,
    );
    widget.onTapSearch(filter);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final adults = rooms
            .map((e) => e.adults)
            .reduce((value, element) => value + element);
        final childs = rooms
            .map((e) => e.childs)
            .reduce((value, element) => value + element);

        return YellowContainer(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: LocationTextField(onChange: (value) {
                    setState(() {
                      city = value;
                    });
                  }),
                ),
                const VerticalSpacer8(),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Dialogs.showAppDialog(
                        context: context,
                        title: 'Выбор дат',
                        autoScroll: false,
                        body: AppCalendar(
                          beginPeriod: startDate,
                          endPeriod: endDate,
                          onApplyPeriod: ((DateTime, DateTime) value) {
                            setState(() {
                              startDate = value.$1;
                              endDate = value.$2;
                            });

                            appNavigator.pop();
                          },
                        ),
                      );
                    },
                    child: WhiteContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/icon_calendar.png'),
                            const HorizontalSpacer8(),
                            Expanded(
                              child: Text(
                                '${Formatters.fromDateCalendar(startDate)} - ${Formatters.fromDateCalendar(endDate)}',
                                style: AppTypography.semiBold14.copyWith(
                                  color: appTheme.colors.text.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalSpacer8(),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: InkWell(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Гости и номера',
                            body: RoomsDialogBody(
                              rooms: rooms,
                              onApply: (List<SearchRoom> value) {
                                setState(() {
                                  rooms = value;
                                });
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                Formatters.pluralize(
                                  adults,
                                  '$adults взрослый',
                                  '$adults взрослых',
                                  '$adults взрослых',
                                ),
                                style: AppTypography.semiBold14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const HorizontalSpacer8(),
                    Expanded(
                      flex: 9,
                      child: InkWell(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Гости и номера',
                            body: RoomsDialogBody(
                              rooms: rooms,
                              onApply: (List<SearchRoom> value) {
                                setState(() {
                                  rooms = value;
                                });
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    Formatters.pluralize(
                                        childs.length,
                                        '${childs.length} ребенок',
                                        '${childs.length} ребенка',
                                        '${childs.length} детей',
                                        zero: 'Нет детей'),
                                    style: AppTypography.semiBold14,
                                  ))),
                        ),
                      ),
                    ),
                    const HorizontalSpacer8(),
                    Expanded(
                      flex: 8,
                      child: InkWell(
                        onTap: () {
                          Dialogs.showAppDialog(
                            context: context,
                            title: 'Гости и номера',
                            body: RoomsDialogBody(
                              rooms: rooms,
                              onApply: (value) {
                                setState(() {
                                  rooms = value;
                                });
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              Formatters.pluralize(
                                rooms.length,
                                '${rooms.length} комната',
                                '${rooms.length} комнаты',
                                '${rooms.length} комнат',
                              ),
                              style: AppTypography.semiBold14,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpacer8(),
                SizedBox(
                  width: double.infinity,
                  child: AppButtonBlue(
                    text: 'Найти',
                    onTap: onTapSearch,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
