import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_app_badger/flutter_app_badger.dart';

import '../../models/notification.dart';

class NotificationController {

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

  String? selectedNotificationPayload;

  int badgeNumber = 0;

  // bool isPressedNotification = false ;

  Future<void> init() async {

    FlutterAppBadger.removeBadge();

    await _configureLocalTimeZone();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails!.payload;

      // isPressedNotification = true;
    }

    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
        ) async {
          didReceiveLocalNotificationSubject.add(
            ReceivedNotification(
              id: id,
              title: title,
              body: body,
              payload: payload,
            ),
          );
        }
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          print('Notification payload: $payload');
        }
        selectedNotificationPayload = payload;
        selectNotificationSubject.add(payload);

        FlutterAppBadger.removeBadge();
      },
    );

  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  Future<void> showNotification(int notificationID, String notificationTitle, String notificationBody, String? payload) async {

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your notification channel id',
        'your notification channel name',
        channelDescription: 'your notification channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'notificationTicker',
        tag: 'notificationTag',
        visibility: NotificationVisibility.public,
        setAsGroupSummary: true,
        groupKey: 'notificationGroupKey',
        // styleInformation: DefaultStyleInformation(true, true),
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentSound: true,
        threadIdentifier: 'notificationThreadID',
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      notificationID,
      notificationTitle,
      notificationBody,
      platformChannelSpecifics,
      payload: payload,
    );

  }

  Future<void> showNotificationCustomSound(int notificationID, String notificationTitle, String notificationBody, String? payload) async {

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your notification channel id',
      'your notification channel name',
      channelDescription: 'your notification channel description',
      importance: Importance.high,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      setAsGroupSummary: true,
      groupKey: 'notificationGroupKey',
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'slow_spring_board.aiff',
        threadIdentifier: 'notificationThreadID',
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      notificationID,
      notificationTitle,
      notificationBody,
      platformChannelSpecifics,
      payload: payload,
    );

  }

  Future<void> showNotificationWithoutSound(int notificationID, String notificationTitle, String notificationBody, String? payload) async {

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your notification channel id',
      'your notification channel name',
      channelDescription: 'your notification channel description',
      importance: Importance.high,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      setAsGroupSummary: true,
      groupKey: 'notificationGroupKey',
      playSound: false,
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentSound: false,
        threadIdentifier: 'notificationThreadID',
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      notificationID,
      notificationTitle,
      notificationBody,
      platformChannelSpecifics,
      payload: payload,
    );

  }

  Future<void> scheduleNotification(int notificationID, String notificationTitle, String notificationBody, String? payload, DateTime scheduledDateTime) async {

    await flutterLocalNotificationsPlugin.zonedSchedule(

      notificationID,
      notificationTitle,
      notificationBody,

      _getScheduledDateTime(scheduledDateTime),

      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your notification channel id',
          'your notification channel name',
          channelDescription: 'your notification description',
          importance: Importance.max,
          priority: Priority.max,
          visibility: NotificationVisibility.public,
          setAsGroupSummary: true,
          groupKey: 'scheduleNotificationGroupKey',
          sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        ),
        iOS: IOSNotificationDetails(
            // presentBadge: true,
            // badgeNumber: badgeNumber,
            sound: 'slow_spring_board.aiff',
            threadIdentifier: 'scheduleNotificationThreadID',
        ),
      ),

      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      // matchDateTimeComponents: DateTimeComponents.dateAndTime,
      payload: payload,

    ).whenComplete(() {

        badgeNumber = badgeNumber + 1;
        FlutterAppBadger.updateBadgeCount(badgeNumber);

    });

    print('Set scheduled notification Successfull!');
    print('badgeNumber = $badgeNumber');

  }

  tz.TZDateTime _getScheduledDateTime(DateTime scheduledDateTime) {
    tz.TZDateTime scheduledTZDateTime = tz.TZDateTime.from(scheduledDateTime, tz.local,);
    return scheduledTZDateTime;
  }

  Future<void> scheduleNotificationOneDayBeforeAt10AM(int notificationID, String notificationTitle, String notificationBody, String? payload, DateTime scheduledDateTime) async {

    await flutterLocalNotificationsPlugin.zonedSchedule(

      notificationID,
      notificationTitle,
      notificationBody,

      _getOneDayBeforeScheduledDateTimeTenAM(scheduledDateTime),

      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your notification channel id',
          'your notification channel name',
          channelDescription: 'your notification description',
          importance: Importance.max,
          priority: Priority.max,
          visibility: NotificationVisibility.public,
          setAsGroupSummary: true,
          groupKey: 'scheduleNotificationGroupKey',
          sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        ),
        iOS: IOSNotificationDetails(
            sound: 'slow_spring_board.aiff',
            threadIdentifier: 'scheduleNotificationThreadID',
        ),
      ),

      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      // matchDateTimeComponents: DateTimeComponents.dateAndTime,
      payload: payload,

    ).whenComplete(() {

        badgeNumber = badgeNumber + 1;
        FlutterAppBadger.updateBadgeCount(badgeNumber);

    });

    print('Set scheduled notification Successfull!');
    print('badgeNumber = $badgeNumber');

  }

  tz.TZDateTime _getOneDayBeforeScheduledDateTimeTenAM(DateTime scheduledDateTime) {
    tz.TZDateTime scheduledTZDateTime = tz.TZDateTime.from(scheduledDateTime, tz.local,);
    tz.TZDateTime oneDayBeforeScheduledTZDateTime = scheduledTZDateTime.subtract(Duration(days: 1),);
    tz.TZDateTime oneDayBeforeScheduledTZDateTimeTenAM = tz.TZDateTime(tz.local, oneDayBeforeScheduledTZDateTime.year, oneDayBeforeScheduledTZDateTime.month, oneDayBeforeScheduledTZDateTime.day, 10,);
    return oneDayBeforeScheduledTZDateTimeTenAM;
  }

  Future<int> checkPendingNotificationRequests() async {

    final List<PendingNotificationRequest> pendingNotificationRequests = await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests.length;

  }

  Future<void> cancelNotification(int notificationID) async {     // cancel a specific notification by its unique ID
    await flutterLocalNotificationsPlugin.cancel(notificationID);
  }

  Future<void> cancelAllNotifications() async {     // cancel all pending notifications
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}