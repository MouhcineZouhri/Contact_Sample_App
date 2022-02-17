class Contact {

  Contact({required this.name , required this.selected
    , required this.type , required this.score , required this.id
    , required this.profile});

  final int id ;
  final String name;
  final String profile;
  final double score;
  final String type;
  bool selected;


  @override
  String toString() {
    return "[id : ${id} , name : ${name} , profile : ${profile}]";
  }
}