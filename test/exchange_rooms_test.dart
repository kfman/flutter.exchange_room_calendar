import 'package:exchange_rooms/exchange_rooms.dart';
import 'package:flutter_test/flutter_test.dart';

import 'secrets.dart';

void main() {
  final rooms = ExchangeRooms(
    credentials: Secret.credentials,
  );

  test('Getting rooms', ()async{
    var roomList = await rooms.getRooms('Besprechungsraeume@elotec-fischer.de');
    for(var room in roomList)
      print(room.name);
    expect(roomList.length, 4);
  });
}
