import 'package:exchange_rooms/exchange_rooms.dart';
import 'package:flutter_test/flutter_test.dart';

import 'secrets.dart';

void main() {
  final rooms = ExchangeRooms(
    credentials: Secret.credentials,
  );

  test('Getting rooms', () async {
    var roomList = await rooms.getRooms('Besprechungsraeume@elotec-fischer.de');
    for (var room in roomList) print(room.name);
    expect(roomList.length, 4);
  });

  test('Getting folder id', () async {
    var id = await rooms.getFolderId('aquarium');
    print('Room id = $id');
    expect(id, isNot(null));
    expect(id, isNot(''));
  });

  test('Getting appointments', () async {
    var appointments = await rooms.getAppointmentsByRoomName('aquarium');
    appointments.map((e) => print(e.subject));
    expect(appointments.length, isNot(0));
  });

  test('Getting appointments', () async {
    var appointments = await rooms.getAppointmentsByRoomName('aquarium',
        count: 2, from: DateTime(2020, 11, 06), to: DateTime(2020, 11, 14));
    appointments.map((e) => print(e.subject));
    expect(appointments.length, 2);
  });
}
