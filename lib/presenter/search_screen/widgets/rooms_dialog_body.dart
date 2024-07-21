import 'package:flutter/material.dart';
import 'package:numeroid/widgets/components/buttons.dart';

import '../../../core/locator.dart';
import '../../../domain/model/bo/search_parameters.dart';
import '../../../domain/model/req/search_room_req.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/kit/app_typography.dart';

class RoomsDialogBody extends StatefulWidget {
  const RoomsDialogBody({
    super.key,
    required this.rooms,
    required this.onApply,
  });

  final List<SearchRoomReq> rooms;
  final ValueSetter<List<SearchRoomReq>> onApply;

  @override
  State<RoomsDialogBody> createState() => _RoomsDialogBodyState();
}

class _RoomsDialogBodyState extends State<RoomsDialogBody> {
  List<SearchRoomReq> rooms = [];

  @override
  void initState() {
    super.initState();

    rooms = List.from(widget.rooms);
  }

  void addRoom() {
    if (rooms.length > 4) return;
    setState(() {
      rooms.add(SearchRoomReq(adults: 1, childs: []));
    });
  }

  void removeRoom(int index) {
    setState(() {
      rooms.removeAt(index);
    });
  }

  void addAdult(int roomIndex) {
    final room = rooms[roomIndex];
    rooms.removeAt(roomIndex);
    setState(() {
      rooms.insert(
        roomIndex,
        SearchRoomReq(
          adults: room.adults + 1,
          childs: room.childs,
        ),
      );
    });
  }

  void removeAdult(int roomIndex) {
    if (rooms[roomIndex].adults == 1) {
      return;
    }

    final room = rooms[roomIndex];
    rooms.removeAt(roomIndex);
    setState(() {
      rooms.insert(
        roomIndex,
        SearchRoomReq(
          adults: room.adults - 1,
          childs: room.childs,
        ),
      );
    });
  }

  void addChild(int roomIndex) {
    final room = rooms[roomIndex];
    rooms.removeAt(roomIndex);
    setState(() {
      rooms.insert(
        roomIndex,
        SearchRoomReq(
          adults: room.adults,
          childs: room.childs..add(0),
        ),
      );
    });
  }

  void removeChild(int roomIndex) {
    if (rooms[roomIndex].childs.isEmpty) {
      return;
    }

    final room = rooms[roomIndex];
    rooms.removeAt(roomIndex);
    setState(() {
      rooms.insert(
        roomIndex,
        SearchRoomReq(
          adults: room.adults,
          childs: room.childs..removeLast(),
        ),
      );
    });
  }

  void changeChildAge(int roomIndex, int childIndex, int value) {
    if (rooms[roomIndex].childs.isEmpty) {
      return;
    }

    final room = rooms[roomIndex];
    setState(() {
      room.childs.removeAt(childIndex);
      room.childs.insert(childIndex, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: rooms.indexed
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Номер ${e.$1 + 1}',
                                    style: KitTextStyles.semiBold15,
                                  ),
                                ),
                                if (e.$1 > 0)
                                  SizedBox(
                                    height: 20,
                                    width: 16,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.close,
                                        color: appTheme.colors.text.primary,
                                        size: 16,
                                      ),
                                      onPressed: () {
                                        removeRoom(e.$1);
                                      },
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Взрослые ',
                                      style: KitTextStyles.medium14.copyWith(
                                        color: appTheme.colors.text.primary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(width: 1, color: appTheme.colors.border.grey),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_rounded,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            removeAdult(e.$1);
                                          },
                                        ),
                                        SizedBox(
                                          width: 24,
                                          child: Text(
                                            '${e.$2.adults}',
                                            style: KitTextStyles.medium14,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_rounded,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            addAdult(e.$1);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Дети 0 - 17 лет ',
                                      style: KitTextStyles.medium14.copyWith(
                                        color: appTheme.colors.text.primary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(width: 1, color: appTheme.colors.border.grey),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_rounded,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            removeChild(e.$1);
                                          },
                                        ),
                                        SizedBox(
                                          width: 24,
                                          child: Text(
                                            '${e.$2.childs.length}',
                                            style: KitTextStyles.medium14,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_rounded,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            addChild(e.$1);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // GridView.
                            Column(
                              children: e.$2.childs.indexed
                                  .map(
                                    (child) => DropdownButton<int>(
                                      hint: Text(
                                        (child.$2 == 0)
                                            ? 'Возраст'
                                            : Formatters.pluralize(
                                                child.$2,
                                                '${child.$2} год',
                                                '${child.$2} года',
                                                '${child.$2} лет',
                                              ),
                                        style: KitTextStyles.medium14,
                                      ),
                                      iconSize: 16,
                                      items: SearchParameters.childAges
                                          .map(
                                            (age) => DropdownMenuItem<int>(
                                              value: age,
                                              child: Text(
                                                Formatters.pluralize(
                                                  age,
                                                  '$age год',
                                                  '$age года',
                                                  '$age лет',
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value != null) changeChildAge(e.$1, child.$1, value);
                                      },
                                    ),
                                  )
                                  .toList(),
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
                ),
              )
              .toList(),
        ),
        if (rooms.length < 4)
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 12,
            ),
            child: SizedBox(
              width: double.infinity,
              child: AppButtonOutlineBlue(
                text: 'Добавить номер',
                onTap: addRoom,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: SizedBox(
            width: double.infinity,
            child: AppButtonBlue(
              text: 'Применить',
              onTap: () {
                widget.onApply(rooms);
                appNavigator.pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
