class Class3Students {
  final String eleve1;
  final String eleve2;
  final String eleve3;

  Class3Students(
      {required this.eleve1, required this.eleve2, required this.eleve3});

  factory Class3Students.fromJson(Map<String, dynamic> json) {
    return Class3Students(
        eleve1: json["eleve1"], eleve2: json["eleve2"], eleve3: json["eleve3"]);
  }
}
