import 'filter_budget.dart';
import 'filter_distance.dart';
import 'filter_stars.dart';
import 'hotel_short.dart';

class FilterParameters {
  final List<FilterBudget> budget = [];
  final List<FilterStars> stars = [];
  final List<FilterDistance> distance = [];
  bool cancelled = false;
  bool meal = false;

  void changeBudget(FilterBudget element) {
    if (budget.contains(element)) {
      budget.remove(element);
    } else {
      budget.add(element);
    }
  }

  void changeStars(FilterStars element) {
    if (stars.contains(element)) {
      stars.remove(element);
    } else {
      stars.add(element);
    }
  }

  void changeDistance(FilterDistance element) {
    if (distance.contains(element)) {
      distance.remove(element);
    } else {
      distance.add(element);
    }
  }

  bool approve(HotelShort hotel) {
    bool approved = true;

    if (budget.isNotEmpty) {
      final result = budget.where((element) {
        switch (element) {
          case FilterBudget.zeroFive:
            bool result = false;
            for (var element in hotel.offers) {
              if (element.price.value >= 0 && element.price.value <= 5000) {
                result = true;
              }
            }
            return result;
          case FilterBudget.fiveTen:
            bool result = false;
            for (var element in hotel.offers) {
              if (element.price.value >= 5000 && element.price.value <= 10000) {
                result = true;
              }
            }
            return result;
          case FilterBudget.tenFifteen:
            bool result = false;
            for (var element in hotel.offers) {
              if (element.price.value >= 10000 && element.price.value <= 15000) {
                result = true;
              }
            }
            return result;
          case FilterBudget.fifteenTwenty:
            bool result = false;
            for (var element in hotel.offers) {
              if (element.price.value >= 15000 && element.price.value <= 20000) {
                result = true;
              }
            }
            return result;
          case FilterBudget.twentyMore:
            bool result = false;
            for (var element in hotel.offers) {
              if (element.price.value >= 20000) {
                result = true;
              }
            }
            return result;
        }
      });
      if (result.isEmpty) {
        approved = false;
      }
    }

    if (stars.isNotEmpty) {
      final result = stars.where((element) {
        switch (element) {
          case FilterStars.zero:
            return hotel.info.rate == 0;
          case FilterStars.one:
            return hotel.info.rate == 1;
          case FilterStars.two:
            return hotel.info.rate == 2;
          case FilterStars.three:
            return hotel.info.rate == 3;
          case FilterStars.four:
            return hotel.info.rate == 4;
          case FilterStars.five:
            return hotel.info.rate == 5;
        }
      });

      if (result.isEmpty) {
        approved = false;
      }
    }

    return approved;
  }
}
