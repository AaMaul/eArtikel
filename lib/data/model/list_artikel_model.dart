/// meta : {"code":200,"status":"success","message":"Data Posts"}
/// data : [{"id":6,"title":"Kamu Mau ga jadi pacar aku, mitsuha?!","content":"KYAAAAA Kyomasa Pasukaru kun >,<","image":"http://jcc.brandingyou.id/assets/images/1667907384.jpg","author":"Muhammad Pascal Rahmadi","created_at":"08-11-2022"},{"id":5,"title":"Kata Fadli Saya Pascal ganteng Mencintai orang lain yahahaha","content":"Kepo lu mau apa ya terserah Gua","image":"http://jcc.brandingyou.id/assets/images/1667907355.jpg","author":"Muhammad Pascal Rahmadi","created_at":"08-11-2022"},{"id":4,"title":"Saya Pascal ganteng Mencintai orang lain yahahaha","content":"Kepo lu mau apa ya terserah Gua","image":"http://jcc.brandingyou.id/assets/images/1667907346.jpg","author":"Muhammad Pascal Rahmadi","created_at":"08-11-2022"},{"id":3,"title":"mitsuha wangy","content":"waifu aing\r\n\r\n-lord Rangga","image":"http://jcc.brandingyou.id/assets/images/1667904995.JPG","author":"Rangga Adi Pratama","created_at":"08-11-2022"}]

class ListArtikelModel {
  ListArtikelModel({
      Meta? meta, 
      List<Data>? data,}){
    _meta = meta;
    _data = data;
}

  ListArtikelModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Meta? _meta;
  List<Data>? _data;
ListArtikelModel copyWith({  Meta? meta,
  List<Data>? data,
}) => ListArtikelModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 6
/// title : "Kamu Mau ga jadi pacar aku, mitsuha?!"
/// content : "KYAAAAA Kyomasa Pasukaru kun >,<"
/// image : "http://jcc.brandingyou.id/assets/images/1667907384.jpg"
/// author : "Muhammad Pascal Rahmadi"
/// created_at : "08-11-2022"

class Data {
  Data({
      num? id, 
      String? title, 
      String? content, 
      String? image, 
      String? author, 
      String? createdAt,}){
    _id = id;
    _title = title;
    _content = content;
    _image = image;
    _author = author;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _image = json['image'];
    _author = json['author'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  String? _content;
  String? _image;
  String? _author;
  String? _createdAt;
Data copyWith({  num? id,
  String? title,
  String? content,
  String? image,
  String? author,
  String? createdAt,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  content: content ?? _content,
  image: image ?? _image,
  author: author ?? _author,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get content => _content;
  String? get image => _image;
  String? get author => _author;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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
/// message : "Data Posts"

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