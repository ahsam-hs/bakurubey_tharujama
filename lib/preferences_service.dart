import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveBookmark(String ayahNumber, int surahNumber) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('ayahNumber', ayahNumber);
    await preferences.setInt('surahNumber', surahNumber);

    // await preferences.setString('ayah', bookmarks.bookmarkedAyah);
    // await preferences.setString('translation', bookmarks.bookmarkedTranslation);
    // await preferences.setString('literary', bookmarks.bookmarkedLiterary);
  }

  void getAyahNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.getString('ayahNumber');
  }

  void getSurahNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.getInt('surahNumber');
  }
}
