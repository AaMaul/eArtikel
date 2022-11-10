/// meta : {"code":200,"status":"success","message":"Logout berhasil"}
/// data : null

class LogoutModel {
  LogoutModel({
      Meta? meta, 
      dynamic data,}){
    _meta = meta;
    _data = data;
}

  LogoutModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'];
  }
  Meta? _meta;
  dynamic _data;
LogoutModel copyWith({  Meta? meta,
  dynamic data,
}) => LogoutModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['data'] = _data;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : "Logout berhasil"

class Meta {
  Meta({
      num? code, 
      String? status, 
      String? message,}){
    _code = code;
    _status = status;
    _message = message;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
  }
  num? _code;
  String? _status;
  String? _message;
Meta copyWith({  num? code,
  String? status,
  String? message,
}) => Meta(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
);
  num? get code => _code;
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}