import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

typedef ApiHandle = FutureOr<Response> Function(Request);

class Api{
  final String _address;
  final int _port;
  ApiHandle? _handle;

  String get address => _address;
  int get port => _port;

  Api(this._address, this._port);

  void run(ApiHandle handle){
    if(_handle == null){
      _handle = handle;
      shelf_io.serve(_handle!, _address, _port);
      return;
    }
    throw "Server already running!";
  }

  static Api create(String address, int port, ApiHandle handle){
    final api = Api(address, port);
    api.run(handle);
    return api;
  }
}