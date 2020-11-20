import 'package:exchange_rooms/exchange_rooms.dart';
import 'package:exchange_rooms/models/appointment.dart';
import 'package:exchange_rooms/models/connection_credentials.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange rooms'),
      ),
      body: FutureBuilder(
        future: ExchangeRooms(
                credentials: ConnectionCredentials(
                    username: 'administrator',
                    password: 'MyStrongPassword',
                    domain: 'domain.local',
                    serverUrl: 'https://mail.domain.com/EWS/Exchange.asmx'))
            .getAppointmentsByRoomName('room'),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: (snapshot.data as List<Appointment>)
                  .map((e) => ListTile(
                        title: Text(e.subject!),
                        subtitle: Text(e.organizer!),
                      ))
                  .toList(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
