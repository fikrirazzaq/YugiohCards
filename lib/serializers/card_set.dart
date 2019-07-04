class CardSets {
  String setName;
  String setCode;
  String setRarity;
  String setPrice;

  CardSets({this.setName, this.setCode, this.setRarity, this.setPrice});

  CardSets.fromJson(Map<String, dynamic> json) {
    setName = json['set_name'];
    setCode = json['set_code'];
    setRarity = json['set_rarity'];
    setPrice = json['set_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_name'] = this.setName;
    data['set_code'] = this.setCode;
    data['set_rarity'] = this.setRarity;
    data['set_price'] = this.setPrice;
    return data;
  }
}