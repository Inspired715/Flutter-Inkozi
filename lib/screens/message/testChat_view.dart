import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestChat extends StatefulWidget {
  const TestChat({super.key});

  static const String routeName = '/testChat';

  static Route route(Object? args) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => TestChat(),
    );
  }

  @override
  State<TestChat> createState() => _TestChatState();
}

class _TestChatState extends State<TestChat> {
  IO.Socket? socket;
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(44.182205, -84.506836),
    zoom: 1.4746,
  );

  final Set<Marker> markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    connectToServer();
  }

  void connectToServer() {
    socket = IO.io('https://www.inkozi.com:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // Handle connection successful
    socket?.onConnect((_) {
      print('Connected');
    });

    // Handle connection error
    socket?.onConnectError((error) {
      print('Connection error: $error');
    });

    // Handle connection timeout
    socket?.onConnectTimeout((_) {
      print('Connection timeout');
    });

    // Handle disconnection
    socket?.onDisconnect((_) {
      print('Disconnected');
    });

    // Handle error
    socket?.onError((error) {
      print('Error: $error');
    });

    // Connect to the server
    socket?.connect();

    // Listen for messages
    socket?.on('live_notify', (data) {
      setState(() {
        messages.add(data['message']);
        print(messages);
      });
    });
  }

  void sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      socket?.emit('live_notify', {
        'message': message,
        'advisor_id': 'bert000',
        'user_id': 2,
        'question_id': 10,
        'sender_id': "kevin0715",
        'time_chat': ''
      });
      messageController.clear();
    }
  }

  @override
  void dispose() {
    // Dispose the controller
    messageController.dispose();
    // Disconnect the socket
    socket?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String role = args?['role'];

    return Scaffold(
        appBar: AppBar(
          title: role == 'user' ? Text('Chat to laywer') : Text('Chat to User'),
        ),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height.h,
            width: double.infinity,
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              markers: markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ]));
  }
}
