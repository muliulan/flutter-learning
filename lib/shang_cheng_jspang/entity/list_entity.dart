/// message : ["afghan","basset","blood","english","ibizan","plott","walker"]
/// status : "success"

class ListEntity {
  List<String> _message;
  String _status;

  List<String> get message => _message;
  String get status => _status;


  ListEntity.fromJson(dynamic json) {
    _message = json["message"] != null ? json["message"].cast<String>() : [];
    _status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    map["status"] = _status;
    return map;
  }

}