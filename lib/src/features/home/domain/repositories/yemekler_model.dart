class ProductDetailModel {
  List<Yemekler>? yemekler;
  int? success;

  ProductDetailModel({this.yemekler, this.success});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['yemekler'] != null) {
      yemekler = <Yemekler>[];
      json['yemekler'].forEach((v) {
        yemekler!.add(new Yemekler.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yemekler != null) {
      data['yemekler'] = this.yemekler!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Yemekler {
  String? yemekId;
  String? yemekAdi;
  String? yemekResimAdi;
  String? yemekFiyat;

  Yemekler({this.yemekId, this.yemekAdi, this.yemekResimAdi, this.yemekFiyat});

  Yemekler.fromJson(Map<String, dynamic> json) {
    yemekId = json['yemek_id'];
    yemekAdi = json['yemek_adi'];
    yemekResimAdi = json['yemek_resim_adi'];
    yemekFiyat = json['yemek_fiyat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yemek_id'] = this.yemekId;
    data['yemek_adi'] = this.yemekAdi;
    data['yemek_resim_adi'] = this.yemekResimAdi;
    data['yemek_fiyat'] = this.yemekFiyat;
    return data;
  }
}
