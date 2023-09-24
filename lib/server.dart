import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

typedef Uint8ListCallback = Function(Uint8List data);
typedef DynamicCallback = Function(dynamic data);

class Server {
  Uint8ListCallback? onData;
  DynamicCallback? onError;
  Server(this.onData, this.onError);
  ServerSocket? server;
  bool running = false;
  List<Socket> sockets = [];
  bool cilentConnected = false;

  Future<void> start(String ip) async {
    runZoned(() async {
      try {
        // CHECK FOR IP ADDRESS IN THE DEVICE YOU ARE USING IT IN
        server = await ServerSocket.bind("$ip", 6677);
        running = true;
        server!.listen(onRequest, onError: onError);
        final message = "server is listening on port 6677 and ip $ip";
        onData!(Uint8List.fromList(message.codeUnits));
      } catch (e) {
        print(e);
      }
    }, onError: onError);
  }

  Future<void> close() async {
    await server!.close();
    server = null;
    running = false;
  }

  void onRequest(Socket socket) {
    if (!sockets.contains(socket)) {
      sockets.clear();
      sockets.add(socket);
      cilentConnected = true;
    }
    socket.listen((event) {
      onData!(event);
    });
  }

  void broadcast(String data) {
    // onData!(Uint8List.fromList("Broadcast data : $data".codeUnits));
    for (var socket in sockets) {
      socket.write(data);
    }
  }
}
