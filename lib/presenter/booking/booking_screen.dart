import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/domain/repository/booking_repository.dart';
import 'package:numeroid/utils/formatters.dart';
import 'package:numeroid/widgets/kit/app_typography.dart';

import '../../core/locator.dart';
import '../../domain/bloc/app/app_bloc.dart';
import '../../domain/model/dto/booking_order.dart';
import '../../widgets/unauth_placeholder.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return state.isLogged ? const BookingContentBody() : const UnauthPlaceholder();
        },
      ),
    );
  }
}

class BookingContentBody extends StatefulWidget {
  const BookingContentBody({super.key});

  @override
  State<BookingContentBody> createState() => _BookingContentBodyState();
}

class _BookingContentBodyState extends State<BookingContentBody> {
  List<BookingOrder> orders = [];

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    final result = await BookingRepository().loadOrders();

    setState(() {
      orders = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Мои бронирования',
                style: KitTextStyles.bold18,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_info.png',
                    width: 44,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Упс, похоже у вас нет ещe\nни одного бронирования',
                    style: KitTextStyles.semiBold16,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Найдите ваше бронирование',
                textAlign: TextAlign.center,
                style: KitTextStyles.semiBold13.copyWith(
                  color: appTheme.colors.brand.blue,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Мои бронирования',
                    style: KitTextStyles.bold18,
                  ),
                ),
                Column(
                  children: orders
                      .map(
                        (e) => _BookingOrderCard(order: e),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BookingOrderCard extends StatelessWidget {
  const _BookingOrderCard({
    required this.order,
  });

  final BookingOrder order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      order.hotel.photo?.url ?? '',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    order.hotel.name,
                    style: KitTextStyles.bold16,
                  ),
                  Text(
                    order.hotel.city?.name ?? '',
                    style: KitTextStyles.semiBold13.copyWith(
                      color: appTheme.colors.text.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${Formatters.fromStringDateCalendar2(order.order.arrivalDate)} - ${Formatters.fromStringDateCalendar2(order.order.departureDate)}',
                    style: KitTextStyles.semiBold13.copyWith(
                      color: appTheme.colors.text.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Номер заказа: ',
                        style: KitTextStyles.medium14.copyWith(
                          color: appTheme.colors.text.secondary,
                        ),
                      ),
                      Text(
                        order.order.code,
                        style: KitTextStyles.semiBold14.copyWith(
                          color: appTheme.colors.text.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: appTheme.colors.border.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      Formatters.formatMoneyFromPrice(price: order.order.price),
                      style: KitTextStyles.bold16.copyWith(
                        color: appTheme.colors.text.primary,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          order.order.displayStatus(),
                          style: KitTextStyles.medium13.copyWith(
                            color: appTheme.colors.text.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
