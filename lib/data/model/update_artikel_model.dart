/// meta : {"code":201,"status":"success","message":"Post berhasil ditambahkan"}
/// data : {"id":117,"title":"Seorang pria menikahi","content":"loreddd","image":"http://jcc.brandingyou.id/assets/images/1667998074.jpg","author":"Ari Maulana","created_at":"09-11-2022"}

class UpdateArtikelModel {
  UpdateArtikelModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  UpdateArtikelModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
UpdateArtikelModel copyWith({  Meta? meta,
  Data? data,
}) => UpdateArtikelModel(  meta: meta ?? _meta,
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

/// id : 117
/// title : "Seorang pria menikahi"
/// content : "loreddd"
/// image : "http://jcc.brandingyou.id/assets/images/1667998074.jpg"
/// author : "Ari Maulana"
/// created_at : "09-11-2022"

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

/// code : 201
/// status : "success"
/// message : "Post berhasil ditambahkan"

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