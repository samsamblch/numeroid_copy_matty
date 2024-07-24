import 'package:flutter/material.dart';

import '../core/locator.dart';
import '../utils/formatters.dart';
import 'kit/app_typography.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    super.key,
    required this.month,
    this.startRangeDate,
    this.endRangeDate,
    required this.onTapDate,
  });

  static const List<String> dayNames = [
    'Пн',
    'Вт',
    'Ср',
    'Чт',
    'Пт',
    'Сб',
    'Вс',
  ];

  // Месяц
  final DateTime month;
  final DateTime? startRangeDate;
  final DateTime? endRangeDate;

  final ValueChanged<DateTime> onTapDate;

  // Данный метод проверяет, является ли дата частью выбранного диапазона:
  bool _isDateInRange(DateTime date) {
    if (startRangeDate == null) {
      return false;
    }
    if (endRangeDate == null) {
      return date.isAtSameMomentAs(startRangeDate!);
    }

    final bool1 = date.isAfter(startRangeDate!.subtract(const Duration(days: 1)));
    final bool2 = date.isBefore(endRangeDate!);

    return bool1 && bool2;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
    final int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final int weekDayOfFirstDay = (firstDayOfMonth.weekday + 6) % 7;
    final int daysFromPreviousMonth = weekDayOfFirstDay;
    final int daysFromNextMonth = (7 - ((daysInMonth + daysFromPreviousMonth) % 7)) % 7;
    final totalDays = daysFromPreviousMonth + daysInMonth + daysFromNextMonth;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Text(
              Formatters.fromDateCalendar3(month),
              style: KitTextStyles.semiBold15,
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: dayNames
                  .map((day) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          day,
                          style: KitTextStyles.medium14,
                        ),
                      ))
                  .toList(),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: totalDays,
            itemBuilder: (context, index) {
              final dayOffset = index - daysFromPreviousMonth + 1;
              final DateTime cellDate = index < daysFromPreviousMonth
                  ? DateTime(
                      firstDayOfMonth.year, firstDayOfMonth.month - 1, daysInMonth - daysFromPreviousMonth + 1 + index)
                  : index < (daysFromPreviousMonth + daysInMonth)
                      ? DateTime(firstDayOfMonth.year, firstDayOfMonth.month, dayOffset)
                      : DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, dayOffset - daysInMonth);
              final bool isThisMonth = cellDate.month == month.month;

              return GestureDetector(
                onTap: () {
                  onTapDate(cellDate);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (startRangeDate == cellDate || endRangeDate == cellDate)
                        ? appTheme.colors.brand.blue
                        : _isDateInRange(cellDate)
                            ? Colors.blue.withAlpha(10)
                            : null,
                    border: Border.all(color: Colors.grey[300]!, width: 0.5),
                  ),
                  child: Text(
                    '${cellDate.day}',
                    style: KitTextStyles.medium14.copyWith(
                      color: (startRangeDate == cellDate || endRangeDate == cellDate)
                          ? Colors.white
                          : isThisMonth
                              ? Colors.black
                              : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
