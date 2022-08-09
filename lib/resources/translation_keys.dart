import 'package:get/get.dart';

class TranslationKeys extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'movies': 'Movies',
      'settings' : 'Settings',
      'releaseDate' : 'Release Date',
      'english' : 'English',
      'spanish' : 'Spanish',
      'language' : 'Language',
      'location' : 'Your Location',
    },
    'es_ES': {
      'movies': 'Películas',
      'settings' : 'Ajustes',
      'releaseDate' : 'Fecha de Lanzamiento',
      'english' : 'Inglesa',
      'spanish' : 'Español',
      'language' : 'Idioma',
      'location' : 'Tu Ubicación',
    }
  };

}