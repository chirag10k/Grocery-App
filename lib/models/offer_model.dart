class Offers {
  String description;
  String promoCode;
  String validity;

  Offers({this.description, this.promoCode, this.validity});
}

List<Offers> offerList = [
  Offers(
    description: "50 % Off on All Fruits",
    promoCode: 'FRUIT50',
    validity: '07/20',
  ),
  Offers(
    description: "Rs.100 Off on purchase of hygiene supplies above Rs.1500",
    promoCode: 'HYGIENE100',
    validity: '07/20',
  ),Offers(
    description: "20 % Off on all products by Aashirwad Atta",
    promoCode: 'AASHHIRWAD',
    validity: '09/20',
  ),
];