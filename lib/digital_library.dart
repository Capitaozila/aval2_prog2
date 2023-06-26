import 'dart:convert';
import 'dart:io';

import './media.dart';

class DigitalLibrary {
  List<Media> mediaList = [];

  void addMedia(Media media) {
    mediaList.add(media);
  }

  void loadMedia(String fileName) {
    final file = File(fileName);
    final jsonString = file.readAsStringSync();
    final mediaData = jsonDecode(jsonString) as List<dynamic>;

    mediaList.clear();

    for (var data in mediaData) {
      final type = data['type'] as String;
      final title = data['title'] as String;
      final name = data['name'] as String;
      final duration = data['duration'] as int;

      switch (type) {
        case 'book':
          addMedia(AudioBook(title, name, duration));
          break;
        case 'movie':
          addMedia(Movie(title, name, duration));
          break;
        case 'music':
          addMedia(Music(title, name, duration));
          break;
      }
    }
  }

  void listMedia([MediaType? mediaType]) {
  print('TIPO\tTÍTULO\t\t\tNOME\t\t\tDURAÇÃO(MIN)');
  for (var media in mediaList) {
    if (mediaType == null || media.type == mediaType) {
      final mediaTypeString = translateMediaType(media.type);
      print('${mediaTypeString.padLeft(6)}\t${media.title.padRight(24)}'
          '${media.name.padRight(16)}${media.duration}');
    }
  }
}


String translateMediaType(MediaType type) {
  switch (type) {
    case MediaType.book:
      return 'livro';
    case MediaType.movie:
      return 'filme';
    case MediaType.music:
      return 'música';
    default:
      return 'desconhecido';
  }
}


  int totalMediaDuration([MediaType? mediaType]) {
    int totalDuration = 0;

    for (var media in mediaList) {
      if (mediaType == null || media.type == mediaType) {
        totalDuration += media.duration;
      }
    }

    return totalDuration;
  }
}
