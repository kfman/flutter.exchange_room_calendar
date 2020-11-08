import 'package:exchange_rooms/models/room.dart';
import 'package:xml/xml.dart';

/// Could contain a list of Rooms, but is not implemented yet
class RoomList extends Room {
  List<Room> rooms = List<Room>();

  RoomList();

  RoomList.fromXml(XmlElement element) : super.fromXml(element);
}
