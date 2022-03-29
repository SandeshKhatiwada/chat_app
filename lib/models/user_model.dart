
class User {
  late final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Sandesh Khatiwada',
  imageUrl: 'assets/user.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Barbara Thomas',
  imageUrl: 'assets/user1.jpg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Rodney Kogut',
  imageUrl: 'assets/user2.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'John Acosta',
  imageUrl: 'assets/user3.jpg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Kevin Young',
  imageUrl: 'assets/user4.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Charlotte Barrera',
  imageUrl: 'assets/user5.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Lonnie Reardon',
  imageUrl: 'assets/user6.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Gail Bolding',
  imageUrl: 'assets/user7.jpg',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'Paul Velasquez',
  imageUrl: 'assets/user8.jpg',
  isOnline: false,
);