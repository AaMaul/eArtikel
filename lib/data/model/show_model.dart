/// meta : {"code":200,"status":"success","message":"Post berhasil ditemukan"}
/// data : {"title":"Kamu Mau ga jadi pacar aku, mitsuha?!","content":"KYAAAAA Kyomasa Pasukaru kun >,<","image":"http://jcc.brandingyou.id/assets/images/1667907384.jpg","author":"Muhammad Pascal Rahmadi","created_at":"08-11-2022"}

class ShowModel {
  ShowModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  ShowModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
ShowModel copyWith({  Meta? meta,
  Data? data,
}) => ShowModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// title : "Kamu Mau ga jadi pacar aku, mitsuha?!"
/// content : "KYAAAAA Kyomasa Pasukaru kun >,<"
/// image : "http://jcc.brandingyou.id/assets/images/1667907384.jpg"
/// author : "Muhammad Pascal Rahmadi"
/// created_at : "08-11-2022"

class Data {
  Data({
      String? title, 
      String? content, 
      String? image, 
      String? author, 
      String? createdAt,}){
    _title = title;
    _content = content;
    _image = image;
    _author = author;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _content = json['content'];
    _image = json['image'];
    _author = json['author'];
    _createdAt = json['created_at'];
  }
  String? _title;
  String? _content;
  String? _image;
  String? _author;
  String? _createdAt;
Data copyWith({  String? title,
  String? content,
  String? image,
  String? author,
  String? createdAt,
}) => Data(  title: title ?? _title,
  content: content ?? _content,
  image: image ?? _image,
  author: author ?? _author,
  createdAt: createdAt ?? _createdAt,
);
  String? get title => _title;
  String? get content => _content;
  String? get image => _image;
  String? get author => _author;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['content'] = _content;
    map['image'] = _image;
    map['author'] = _author;
    map['created_at'] = _createdAt;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : "Post berhasil ditemukan"

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