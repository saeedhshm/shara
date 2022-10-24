class CalcPoints {
  int id;
  String _nameAr;
  String _nameEn;
  int earnRatio;
  int lossRatio;


  String name(bool arabic){
    return arabic ? _nameAr : _nameEn;
  }
  CalcPoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
    earnRatio = json['earn_ratio'];
    lossRatio = json['loss_ratio'];
  }

}
