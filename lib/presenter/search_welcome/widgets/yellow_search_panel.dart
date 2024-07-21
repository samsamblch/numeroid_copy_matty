import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/domain/bloc/search/search_bloc.dart';
import 'package:numeroid/domain/model/req/search_room_req.dart';
import 'package:numeroid/presenter/search_welcome/bloc/search_welcome_screen_bloc.dart';
import 'package:numeroid/widgets/calendar.dart';
import 'package:numeroid/widgets/location_text_field.dart';

import '../../../core/locator.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/components/buttons.dart';
import '../../../widgets/components/containers.dart';
import '../../../widgets/components/spacers.dart';
import '../../../widgets/kit/app_typography.dart';
import '../../search_screen/widgets/rooms_dialog_body.dart';

class YellowSearchPanel extends StatefulWidget {
  const YellowSearchPanel({
    super.key,
  });

  @override
  State<YellowSearchPanel> createState() => _YellowSearchPanelState();
}

class _YellowSearchPanelState extends State<YellowSearchPanel> {
  void onTapSearch() {
    final bloc = context.read<SearchWelcomeScreenBloc>();
    bloc.add(SearchWelcomeTapSearch());
  }

  void showRoomsDialog(BuildContext context, SearchWelcomeScreenState state) {
    return Dialogs.showAppDialog(
      context: context,
      title: 'Гости и номера',
      horizontalMargin: 34,
      body: RoomsDialogBody(
        rooms: state.searchState.search.rooms,
        onApply: (List<SearchRoomReq> value) {
          context.read<SearchWelcomeScreenBloc>().searchBloc.add(SearchChangeRoom(rooms: value));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchWelcomeScreenBloc, SearchWelcomeScreenState>(
      builder: (context, state) {
        return YellowContainer(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: LocationTextField(onChange: (value) {
                    context.read<SearchWelcomeScreenBloc>().searchBloc.add(SearchChangeCity(city: value));
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
                          beginPeriod: state.searchState.search.startDate,
                          endPeriod: state.searchState.search.endDate,
                          onApplyPeriod: ((DateTime, DateTime) value) {
                            context.read<SearchBloc>().add(
                                  SearchChangeDate(start: value.$1, end: value.$2),
                                );
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
                                '${Formatters.fromDateCalendar(state.searchState.search.startDate)} - ${Formatters.fromDateCalendar(state.searchState.search.endDate)}',
                                style: KitTextStyles.semiBold14.copyWith(
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
                          showRoomsDialog(context, state);
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                ((int count) {
                                  return Formatters.pluralize(
                                    count,
                                    '$count взрослый',
                                    '$count взрослых',
                                    '$count взрослых',
                                  );
                                })(state.searchState.search.adults),
                                style: KitTextStyles.semiBold14,
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
                          showRoomsDialog(context, state);
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                ((int count) {
                                  return Formatters.pluralize(
                                    count,
                                    '$count ребенок',
                                    '$count ребенка',
                                    '$count детей',
                                    zero: 'Нет детей',
                                  );
                                })(
                                  state.searchState.search.childs.length,
                                ),
                                style: KitTextStyles.semiBold14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const HorizontalSpacer8(),
                    Expanded(
                      flex: 8,
                      child: InkWell(
                        onTap: () {
                          showRoomsDialog(context, state);
                        },
                        child: SizedBox(
                          height: 40,
                          child: WhiteContainer(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              Formatters.pluralize(
                                state.searchState.search.rooms.length,
                                '${state.searchState.search.rooms.length} комната',
                                '${state.searchState.search.rooms.length} комнаты',
                                '${state.searchState.search.rooms.length} комнат',
                              ),
                              style: KitTextStyles.semiBold14,
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
