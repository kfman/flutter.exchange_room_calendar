library exchange_rooms;

import 'dart:convert';

import 'package:exchange_rooms/models/connection_credentials.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'models/appointment.dart';
import 'models/room.dart';

class ExchangeRooms {
  static String _getRoomsXml(String list) => '''
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

  static String _getRoomIdRequestXml(String roomMail) => '''
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
    <GetFolder xmlns="http://schemas.microsoft.com/exchange/services/2006/messages"
               xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
      <FolderShape>
        <t:BaseShape>Default</t:BaseShape>
      </FolderShape>
      <FolderIds>
        <t:DistinguishedFolderId Id="calendar">
				<t:Mailbox>
					<t:EmailAddress>$roomMail</t:EmailAddress>
						</t:Mailbox>
				</t:DistinguishedFolderId>
      </FolderIds>
    </GetFolder>
  </soap:Body>
</soap:Envelope>
  ''';

  static String _getAppointmentsRequestXml(String id,
      {int count, DateTime from, DateTime to}) {
    var fromString = from?.toIso8601String() ??
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toIso8601String();

    var toString = to?.toIso8601String() ??
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: 14))
            .toIso8601String();

    return '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"			
  xmlns:m="http://schemas.microsoft.com/exchange/services/2006/messages"
  xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types">
  <soap:Header>
		<t:RequestServerVersion Version="Exchange2010"
			xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types" />
  </soap:Header>
  <soap:Body>
    <m:FindItem Traversal="Shallow">
      <m:ItemShape>
        <t:BaseShape>IdOnly</t:BaseShape>
        <t:AdditionalProperties>
          <t:FieldURI FieldURI="item:Subject" />
          <t:FieldURI FieldURI="calendar:Organizer" />
          <t:FieldURI FieldURI="calendar:Start" />
          <t:FieldURI FieldURI="calendar:End" />
        </t:AdditionalProperties>
      </m:ItemShape>
      <m:CalendarView MaxEntriesReturned="${count ?? 5}" StartDate="$fromString" EndDate="$toString" />
      <m:ParentFolderIds>
        <t:FolderId Id="$id" />
      </m:ParentFolderIds>
    </m:FindItem>
  </soap:Body></soap:Envelope>  ''';
  }

  final ConnectionCredentials credentials;

  Map<String, String> get _headers => {
        'Content-Type': 'text/xml; charset=utf-8',
        'Authorization': credentials.authorization
      };

  ExchangeRooms({this.credentials});

  Future<XmlDocument> _postCommand(String command) async {
    var result = await http.post(this.credentials.serverUrl,
        headers: _headers,
        body: command,
        encoding: Encoding.getByName('utf-8'));

    if (result.statusCode >= 200 && result.statusCode < 300)
      return XmlDocument.parse(result.body);

    throw 'Communication error ${result.statusCode}';
  }

  /// Returns a List<Room> grouped by [listAddress]
  Future<List<Room>> getRooms(String listAddress) async {
    var xml = await _postCommand(_getRoomsXml(listAddress));

    var rooms = xml.findAllElements('t:Room');
    return rooms.map((e) => Room.fromXml(e)).toList();
  }

  /// Returns the folder id for the calendar of [roomName]
  ///
  /// The __domain__ is automatically added
  Future<String> getFolderId(String roomName) async {
    var xml = await _postCommand(
        _getRoomIdRequestXml('$roomName@${credentials.domain}'));

    var folderId = xml.findAllElements('t:FolderId').first.getAttribute('Id');
    return folderId;
  }

  /// [roomId] is the FolderID
  ///
  /// Returns max [count] appointments between [from] and [to]
  Future<List<Appointment>> getAppointments(String roomId,
      {int count, DateTime from, DateTime to}) async {
    var request =
        _getAppointmentsRequestXml(roomId, count: count, from: from, to: to);
    var xml = await _postCommand(request);
    return Appointment.getAppointmentList(xml.findAllElements('t:Items').first);
  }

  /// Returns max [count] appointments from the [roomName] between [from] and [to].
  ///
  /// The __domain__ is automatically added
  Future<List<Appointment>> getAppointmentsByRoomName(String roomName,
      {int count, DateTime from, DateTime to}) async {
    var id = await getFolderId(roomName);
    return await getAppointments(id, count: count, from: from, to: to);
  }
}
