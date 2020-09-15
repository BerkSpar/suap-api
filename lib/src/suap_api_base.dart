import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:suap_api/src/suap_api_model.dart';

class SUAP {
  SUAPClient client;

  SUAP(SUAPAuth auth) {
    var config = DefaultAppConfiguration();
    client = SUAPClient(auth, config: config);
  }

  Future<List<Boletim>> getBoletins({@required int ano, @required int semestre}) async => (await client.getJson(endpoint: 'minhas-informacoes', args: ['boletim', ano, semestre]) as List).map((json) => Boletim.fromJson(json)).toList();
  Future<Usuario> getUsuario() async => Usuario.fromJson(await client.getJson(endpoint: 'minhas-informacoes', args: ['meus-dados']));
}

class SUAPClient {
  final AppConfiguration config;
  Dio _dio;
  Options _options;
  SUAPAuth auth;


  SUAPClient(this.auth, {this.config}) {
    _dio = Dio();
    _options = Options();

    _options.headers.addAll({
      'Authorization' : auth.getAuth(),
      'Content-Type' : 'application/json; charset=utf-8',
      'user-agent' : config.api.userAgent,
    });
  }

  
  String getApiUrl({@required String endpoint, List<Object> args}) {
    var baseUrl = config.api.baseUrl + '/' + config.api.version + '/';
    if (endpoint != null && endpoint.isNotEmpty) {
      baseUrl += endpoint + '/';
    }
    for (var arg in args) {
      baseUrl += (arg?.toString() ?? '') + '/';
    }
    return baseUrl;
  }

  dynamic getJson({@required String endpoint, List<Object> args}) async {
    final uri = getApiUrl(endpoint: endpoint, args: args);
    final response = await _dio.get(uri, options: _options);
    return response.data;
  }
}

class DefaultAppConfiguration extends AppConfiguration {
  DefaultAppConfiguration() : super (
  api: ApiConfiguration(
    baseUrl: 'https://suap.ifba.edu.br/api',
    version: 'v2',
    userAgent: 'SUAP Api/0.0.1',
  ));
}

class AppConfiguration {
  ApiConfiguration api;

  AppConfiguration({
    @required this.api,
  });

  AppConfiguration.fromJson(Map<String, dynamic> json) {
    api = ApiConfiguration.fromJson(json['api']);
  }
}

class SUAPAuth {
  String user;
  String password;

  SUAPAuth({
    @required this.user,
    @required this.password,
  });

  String getAuth() {
    return 'Basic ' + base64Encode(utf8.encode('$user:$password'));
  }

  SUAPAuth.fromJson(Map<String, dynamic> json) {
    user = json['user'] as String;
    password = json['password'] as String;
  }
}

class ApiConfiguration {
  String baseUrl;
  String version;
  String userAgent;

  ApiConfiguration({
    @required this.baseUrl,
    @required this.version,
    this.userAgent,
  });

  ApiConfiguration.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'] as String;
    version = json['version'] as String;
    userAgent = json['userAgent'] as String;
  }
}
