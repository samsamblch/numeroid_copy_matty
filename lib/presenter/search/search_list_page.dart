import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeroid/core/app_router.gr.dart';
import 'package:numeroid/core/app_typography.dart';
import 'package:numeroid/core/locator.dart';
import 'package:numeroid/widgets/components/containers.dart';
import 'bloc/search_bloc.dart';
import 'widgets/hotel_card.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Column(
        children: [
          const _ListHeader(),
          if (state is SearchFinish)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: state.hotels.length,
                itemBuilder: (context, index) {
                  return HotelCard(
                    hotel: state.hotels[index],
                    days: state.search.daysCount(),
                    adult: state.search.allAdult(),
                    onTap: () {
                      appNavigator.pushRoute(HotelDetailRoute(hotel: state.hotels[index]));
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

class _ListHeader extends StatelessWidget {
  const _ListHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchFinish) {
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
                            '${state.hotels.length} вариантов',
                            style: AppTypography.semiBold13,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              width: 1,
                              color: appTheme.colors.border.grey,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Сначала самые дешевые',
                              style: AppTypography.medium14,
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
