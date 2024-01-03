class BoardingModel {
  String image;
  String title;
  String subTitle;
  BoardingModel({required this.image, required this.title, required this.subTitle,});
}
final List<BoardingModel> item=[
  BoardingModel(
      image: 'assets/images/undraw_Chef_cu0r.png',
      title: 'We have the best chefs',
      subTitle: 'Italian food',
  ),
  BoardingModel(
    image: 'assets/images/undraw_Hamburger_re_7sfy.png',
    title: 'Enjoy the best burgers',
    subTitle: 'Italian food',
  ),
  BoardingModel(
    image: 'assets/images/event_4aj8.png',
    title: 'Enjoy the best food',
    subTitle: 'Italian food',
  ),
];