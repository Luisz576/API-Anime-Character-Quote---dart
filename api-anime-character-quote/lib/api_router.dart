import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:http/http.dart' as http;

class ApiRouter{
  static const apiUrl = 'animechan.vercel.app',
              apiPath = '/api/random';

  final Router _router = Router();

  ApiRouter(){
    _buildRouter();
  }

  _buildRouter(){
    _router.get('/', (request) async{
      try{
        http.Response response = await http.get(Uri.https(apiUrl, apiPath));
        return Response(200, body: response.body);
      }catch(e){
        print(e);
      }
      return Response(401);
    });
  }

  Future<Response> Function(Request) call(){
    return _router.call;
  }
}