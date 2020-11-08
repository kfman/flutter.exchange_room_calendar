import 'package:exchange_rooms/models/room.dart';
import 'package:xml/xml.dart';

class RoomList extends Room {
  List<Room> rooms = List<Room>();

  RoomList();

  RoomList.fromXml(XmlElement element) : super.fromXml(element);
}
