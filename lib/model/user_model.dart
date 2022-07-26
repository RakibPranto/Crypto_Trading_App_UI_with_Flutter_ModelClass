class UserModel {
  String? name, img, sub;
  bool? isPump;
  int? id;
  double? price, change;
  UserModel(
      {this.price,
      this.sub,
      this.isPump,
      this.img,
      this.change,
      this.name,
      this.id});
}

List<UserModel> crypto_info = [
  UserModel(
      name: 'Bitcoin',
      img: 'images/btc.jpg',
      sub: 'BTC/USD',
      price: 21973.39,
      change: 4.43,
      isPump: true,
      id: 1),
  UserModel(
      name: 'Ethereum',
      img: 'images/eth.jpg',
      sub: 'ETH/USD',
      price: 1477.88,
      change: 9.20,
      isPump: true,
      id: 2),
  UserModel(
      name: 'TetherUS',
      img: 'images/usdt.jpg',
      sub: 'USDT/USD',
      price: 0.99933,
      change: 0.04,
      isPump: true,
      id: 3),
  UserModel(
      name: 'BNB',
      img: 'images/bnb.jpg',
      sub: 'BNB/USD',
      price: 258.20,
      change: 3.57,
      isPump: true,
      id: 4),
  UserModel(
      name: 'Ripple',
      img: 'images/xrp.jpg',
      sub: 'XRP/USD',
      price: 0.35850,
      change: 3.61,
      isPump: false,
      id: 5),
  UserModel(
      name: 'Solana',
      img: 'images/sol.jpg',
      sub: 'SOL/USD',
      price: 40.58,
      change: 4.99,
      isPump: true,
      id: 6),
  UserModel(
      name: 'Dogecoin',
      img: 'images/doge.jpg',
      sub: 'DOGE/USD',
      price: 0.06658,
      change: 4.38,
      isPump: true,
      id: 7),
  UserModel(
      name: 'SHIBA INU',
      img: 'images/shib.jpg',
      sub: 'SHIB/USD',
      price: 0.00001,
      change: 8.85,
      isPump: false,
      id: 8),
];
