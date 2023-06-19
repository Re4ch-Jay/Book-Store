class Pdf {
  String? chapter2;
  String? chapter5;

  Pdf({this.chapter2, this.chapter5});

  Pdf.fromJson(Map<String, dynamic> json) {
    chapter2 = json['Chapter 2'];
    chapter5 = json['Chapter 5'];
  }
}
