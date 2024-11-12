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
