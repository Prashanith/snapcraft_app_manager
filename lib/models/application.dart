class Application {
  String name = '';
  String version = '';
  String publisher = '';

  Application({required this.name, required this.version, required this.publisher});
  
  Application.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    version = json['version'] ?? '';
    publisher = json['publisher'] ?? '';
  }
}
