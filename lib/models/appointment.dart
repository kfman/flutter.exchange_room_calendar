import 'package:xml/xml.dart';

/// Representing [Appointment] in an Exchange calendar
class Appointment {
  String id;
  String changeKey;
  String subject;
  DateTime start;
  DateTime end;
  String organizer;

  Appointment(
      {this.subject,
      this.organizer,
      this.start,
      this.end,
      this.id,
      this.changeKey});

  /// Extracts Appointment from an __t:CalendarItem__ XML [element]
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

  /// Extracts list of Appointments from an __t:Items__ [element]
  static List<Appointment> getAppointmentList(XmlElement element) => element
      .findAllElements('t:CalendarItem')
      .map((e) => Appointment.fromXml(e))
      .toList();
}
