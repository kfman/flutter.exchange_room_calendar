library exchange_rooms;

import 'dart:convert';

import 'package:exchange_rooms/models/connection_credentials.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'models/room.dart';
import 'models/appointment.dart';

class ExchangeRooms {
  static String getRoomsXml(String list) => '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
	<soap:Header>
		<t:RequestServerVersion Version="Exchange2010"
			xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
		</soap:Header>
		<soap:Body>
			<m:GetRooms
				xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages">
				<m:RoomList>
					<t:EmailAddress>$list</t:EmailAddress>
				</m:RoomList>
			</m:GetRooms>
		</soap:Body>
	</soap:Envelope>  
  ''';

  static String getRoomLists() => '''
  <?xml version="1.0" encoding="utf-8"?>
  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Header>
  <t:RequestServerVersion Version="Exchange2010" xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
  </soap:Header>
  <soap:Body>
  <m:GetRoomLists xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages" />
  </soap:Body>
  </soap:Envelope>
  ''';

  final ConnectionCredentials credentials;

  Map<String, String> get headers => {
        'Content-Type': 'text/xml; charset=utf-8',
        'Authorization': credentials.authorization
      };

  ExchangeRooms({this.credentials});

  Future<List<Room>> getRooms(String listAddress) async {
    var result = await http.post(this.credentials.serverUrl,
        headers: headers,
        body: getRoomsXml(listAddress),
        encoding: Encoding.getByName('utf-8'));

    var xml = XmlDocument.parse(result.body);
    var rooms = xml.findAllElements('t:Room');
    return rooms.map((e) => Room.fromXml(e)).toList();
  }

  Future<List<Appointment>> getAppointments(String room) async {

    return List<Appointment>();
  }
}
