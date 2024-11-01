import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WebSocket Demo',
      home: WebSocketDemo(),
    );
  }
}

class WebSocketDemo extends StatefulWidget {
  const WebSocketDemo({super.key});

  @override
  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  late WebSocketChannel channel;
  String serverMessage = "Nenhuma mensagem recebida ainda";

  @override
  void initState() {
    super.initState();
    // Conectar ao servidor WebSocket
    channel = IOWebSocketChannel.connect('ws://172.20.200.163:8765');
    channel.stream.listen((message) {
      setState(() {
        serverMessage = message;
      });
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Demo'),
      ),
      body: Center(
        child: Text(
          serverMessage,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
