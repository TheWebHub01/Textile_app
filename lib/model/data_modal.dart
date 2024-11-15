class datamodel {
  String? images;
  String title;

  datamodel({
    this.images,
    required this.title,
  });
}

class Balance {
  String title;
  String balance;
  String images;

  Balance({required this.title, required this.balance, required this.images});
}

class Company {
  String title;
  String balance;
  String address;

  Company({required this.title, required this.balance, required this.address});
}

class Stockmodel {
  String title;
  int opening;
  double openingAmount;
  int inward;
  double inwardAmount;
  int outward;
  double outwardAmount;
  int closing;
  double closingAmount;
  Stockmodel(
      {required this.closing,
      required this.closingAmount,
      required this.inward,
      required this.inwardAmount,
      required this.opening,
      required this.openingAmount,
      required this.outward,
      required this.outwardAmount,
      required this.title});
}
