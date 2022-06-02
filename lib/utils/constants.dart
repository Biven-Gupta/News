class Constants {
  static const String API_KEY = '3d80d5c8b7d24b5185e2f783e2e7d283';
  static const String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    "United States": "us",
    "United Kingdom": "gb",
    "India": "in",
    "Australia": "au",
    "New Zealand": "nz",
    "Canada": "ca",
    "Singapore": "sg",
    "Malaysia": "my",
    "Philippines": "ph",
    "Saudi Arabia": "sa",
    "Switzerland": "ch",
    "Nigeria": "ng",
    "China": "cn",
    "Japan": "jp",
    "South Korea": "kr",
  };
}
