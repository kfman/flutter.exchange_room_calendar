import 'package:xml/xml.dart';

class Appointment {
  String id;
  String changeKey;
  String subject;
  DateTime start;
  DateTime end;
  String organizer;

  Appointment();

  Appointment.fromXml(XmlElement element) {
    id = element.getElement('t:ItemId').getAttribute('Id');
    changeKey = element.getElement('t:ItemId').getAttribute('ChangeKey');

    subject = element.getElement('t:Subject').text;
    start = DateTime.parse(element.getElement('t:Start').text);
    end = DateTime.parse(element.getElement('t:End').text);
    organizer = element
        .getElement('t:Organizer')
        .getElement('t:Mailbox')
        .getElement('t:Name')
        .text;
  }

  static List<Appointment> getAppointmentList(XmlElement element) => element
      .findAllElements('t:CalendarItem')
      .map((e) => Appointment.fromXml(e))
      .toList();
}
