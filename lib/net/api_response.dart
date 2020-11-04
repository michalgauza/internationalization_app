class ApiResponse {
  String _quote;
  String _author;


  String get quote => _quote;
  String get author => _author;

  ApiResponse({
      String en, 
      String author,}){
    _quote = en;
    _author = author;
}

  ApiResponse.fromJson(dynamic json) {
    _quote = json["en"];
    _author = json["author"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["en"] = _quote;
    map["author"] = _author;
    return map;
  }

}