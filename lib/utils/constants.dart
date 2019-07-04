class Constants {
  static String cardList(int newsId) {
    return 'https://db.ygoprodeck.com/api/v5/cardinfo.php?num=$newsId';
  }
}