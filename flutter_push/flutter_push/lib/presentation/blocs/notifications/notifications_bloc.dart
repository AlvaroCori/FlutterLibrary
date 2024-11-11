import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push/domain/entities/push_message.dart';
//import 'package:flutter_push/domain/entities/push_message.dart';
import 'package:flutter_push/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';


class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> initializeFNM() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void requestPermission() async{
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      settings.authorizationStatus;
      add(NotificationStatusChanged(settings.authorizationStatus));
      _getFCMToken();
    }
    
  NotificationsBloc() : super(const NotificationsState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);
    //Verificar estado de notificaciones
    _initialStatusChecked();
    //Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

  void _initialStatusChecked() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
    _getFCMToken();
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    //final token = await messaging.getToken();
  }

  void _notificationStatusChanged(NotificationStatusChanged event, Emitter<NotificationsState> emit){
    emit(
      state.copyWith(
        status: event.status
      )
    );
    _getFCMToken();
  }

  void _onPushMessageReceived(NotificationReceived event, Emitter<NotificationsState> emit){
    emit(
      state.copyWith(
        notifications: [ event.pushMessage, ... state.notifications]
      )
    );
    _getFCMToken();
  }

  
  void handleRemoteMessage( RemoteMessage message ){
    if ( message.notification == null ) return;
    final notification = PushMessage(
      messageId: message.messageId?.replaceAll(";", "").replaceAll("%", "") ?? "", 
      title: message.notification!.title ?? "", 
      body: message.notification!.body ?? "", 
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid? message.notification!.android?.imageUrl : message.notification!.apple?.imageUrl
    );
    add(NotificationReceived(notification));
  }
  
  void _onForegroundMessage(){
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
    //final listener =  FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
    //listener.cancel();
  }

  PushMessage? getMessageById( String pushMessageId ){
    final exist = state.notifications.any((element) => element.messageId == pushMessageId );
    if (!exist) return null;
    return state.notifications.firstWhere((element) => element.messageId == pushMessageId );
  }


}
