import 'package:flutter/material.dart';
import 'package:local_notifications/services/notificationsProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotificationsProvider>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: Container(
            child: Center(
                child: Consumer<NotificationsProvider>(
          builder: (context, model, _) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () => model.instantNotifications(),
                child: Text('Instant Notification')),
            ElevatedButton(
                onPressed: () => model.imageNotification(),
                child: Text('Image Notification')),
            ElevatedButton(
                onPressed: () => model.stylishNotification(),
                child: Text('Media Notification')),
            ElevatedButton(
                onPressed: () => model.sheduledNotification(),
                child: Text('Scheduled Notification')),
            ElevatedButton(
                onPressed: () => model.cancelNotification(),
                child: Text('Cancel Notification')),
          ]),
        ))));
  }
}
