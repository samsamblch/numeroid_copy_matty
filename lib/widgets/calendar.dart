import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/utils/formatters.dart';
import 'package:numeroid/widgets/kit/buttons.dart';

import 'kit/app_typography.dart';
import 'month_calendar.dart';

class AppCalendar extends StatefulWidget {
  const AppCalendar({
    super.key,
    required this.beginPeriod,
    required this.endPeriod,
    required this.onApplyPeriod,
  });

  final DateTime beginPeriod;
  final DateTime endPeriod;
  final ValueSetter<(DateTime begin, DateTime end)> onApplyPeriod;

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  List<DateTime> months = [];

  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  DateTime? selectedBeginPeriod;
  DateTime? selectedEndPeriod;

  @override
  void initState() {
    super.initState();

    selectedBeginPeriod = widget.beginPeriod;
    selectedEndPeriod = widget.endPeriod;

    setState(() => fillMonths(selectedDate));
  }

  void fillMonths(DateTime date) {
    months.clear();
    for (var i = date.month; i < 13; i++) {
      months.add(DateTime(date.year, i, date.day));
    }
  }

  void backYear() {
    if (selectedDate.year <= currentDate.year) {
      return;
    }

    if (selectedDate.year - 1 == currentDate.year) {
      selectedDate = currentDate;
    } else {
      selectedDate = DateTime(selectedDate.year - 1, 1, 1);
    }
    setState(() => fillMonths(selectedDate));
  }

  void nextYear() {
    setState(() {
      selectedDate = DateTime(selectedDate.year + 1, 1, 1);
      fillMonths(selectedDate);
    });
  }

  void _selectDate(DateTime selectedDate) {
    final now = DateTime.now();
    if (selectedDate.day < now.day && selectedDate.month <= now.month) {
      return;
    }
    setState(() {
      if (selectedBeginPeriod == null || selectedEndPeriod != null) {
        selectedBeginPeriod = selectedDate;
        selectedEndPeriod = null;
      } else if (selectedDate.isBefore(selectedBeginPeriod!)) {
        selectedBeginPeriod = selectedDate;
      } else if (selectedDate.isAfter(selectedBeginPeriod!)) {
        selectedEndPeriod = selectedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: backYear,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: (selectedDate.year > currentDate.year)
                      ? appTheme.colors.text.primary
                      : appTheme.colors.text.secondary,
                ),
              ),
              Text(
                Formatters.fromDateCalendar4(selectedDate),
                style: KitTextStyles.semiBold15,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: nextYear,
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: appTheme.colors.text.primary,
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 400, //MediaQuery.of(context).size.height - 40 - 160 - 100,
          ),
          child: SingleChildScrollView(
            child: Column(
                children: months
                    .map((e) => MonthCalendar(
                          month: e,
                          startRangeDate: selectedBeginPeriod,
                          endRangeDate: selectedEndPeriod,
                          onTapDate: _selectDate,
                        ))
                    .toList()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: KitButtonBlue(
            text: 'Подтвердить',
            onTap: () {
              if (selectedBeginPeriod != null && selectedEndPeriod != null) {
                widget.onApplyPeriod((selectedBeginPeriod!, selectedEndPeriod!));
              }
            },
          ),
        ),
      ],
    );
  }
}
