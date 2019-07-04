class CardPrices {
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;

  CardPrices(
      {this.cardmarketPrice,
        this.tcgplayerPrice,
        this.ebayPrice,
        this.amazonPrice});

  CardPrices.fromJson(Map<String, dynamic> json) {
    cardmarketPrice = json['cardmarket_price'];
    tcgplayerPrice = json['tcgplayer_price'];
    ebayPrice = json['ebay_price'];
    amazonPrice = json['amazon_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardmarket_price'] = this.cardmarketPrice;
    data['tcgplayer_price'] = this.tcgplayerPrice;
    data['ebay_price'] = this.ebayPrice;
    data['amazon_price'] = this.amazonPrice;
    return data;
  }
}