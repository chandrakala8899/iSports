class UnbordingContent {
  String image;
  String title;
  String description;
  
  UnbordingContent({required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Build and Manage teams',
    image: 'assets/images/cricket.png',
    description: "Easily create teams, add players, and coordinate with your squad for upcoming events. "
  ),
  UnbordingContent(
    title: 'Create and Host Events',
    image: 'assets/images/cricketballvsimage.png',
    description: "Organize sporting events with just a few clicks. Set up tournaments, matches, and more! "
  ),
  UnbordingContent(
    title: 'Search and Hire Players',
    image: 'assets/images/cricketbatting.png',
    description: "Looking for skilled players? Browse profiles and hire players for your team or event. "
  ),
];