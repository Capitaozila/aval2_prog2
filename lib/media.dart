abstract class Media {
  final MediaType type;
  final String title;
  final String name;
  final int duration;

  Media(this.type, this.title, this.name, this.duration);
}

class AudioBook extends Media {
  AudioBook(String title, String name, int duration)
      : super(MediaType.book, title, name, duration);
}

class Movie extends Media {
  Movie(String title, String name, int duration)
      : super(MediaType.movie, title, name, duration);
}

class Music extends Media {
  Music(String title, String name, int duration)
      : super(MediaType.music, title, name, duration);
}

enum MediaType { book, movie, music }
