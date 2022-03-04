class Quotes {
  final String personImage;
  final String quote;
  final String personName;
  const Quotes({
    required this.personImage,
    required this.quote,
    required this.personName,
  });
}

const List<Quotes> quotesList = [
  Quotes(
    personImage: "assets/images/favorite_management/person1.jpg",
    quote: 'Early bird catches worm',
    personName: 'Charles David',
  ),
  Quotes(
    personImage: "assets/images/favorite_management/person2.jfif",
    quote: 'Wait till the sun shines',
    personName: 'Robert Martin',
  ),
  Quotes(
    personImage: "assets/images/favorite_management/person1.jpg",
    quote: 'Succes is not a destination its a journey',
    personName: 'Robert Downey',
  ),
];