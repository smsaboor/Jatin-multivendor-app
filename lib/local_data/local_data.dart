import 'dart:convert';
import 'package:multivendor_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences instance;
  static const String _keyUserSession = 'user_session';
  static const String _keyUserDetails = 'user_details';
  static const _keyUserLanguage = 'userLanguage';
  static const _keyLogin = 'login';
  static const _keyFreelancerLogin = 'freelancerLogin';
  static const _keyUserType = 'userType';
  static const _keyFreelancerUserType = 'userType';
  static const _keyRecentSearches = 'recentSearches';
  static const _keySkillsSearches = 'skillsSearches';
  static const _keyMatchList = 'matchList';

  static Future init() async =>
      instance = await SharedPreferences.getInstance();

  SharedPreferences getLocalDataInstance() {
    return instance;
  }

  AppUser myUser = const AppUser(
      fullName: 'XXX',
      email: 'xxx@gmail.com',
      phone: 'xxxxxxxxxx',
      wallet: 'xxx',
      userType: 'xxx',
      userId: 'xxx');

  String? _mobile;

  String get userMobile {
    if (_mobile!.isEmpty) {
      loadUserSession();
      return _mobile!;
    } else {
      return _mobile!;
    }
  }

  Future<void> addUserDetails(AppUser user) async {
    final json = jsonEncode(user.toJson());
    await instance.setString(_keyUserDetails, json);
  }

  Future<AppUser> fetchUserDetails() async {
    final json = instance.getString(_keyUserDetails);
    _mobile = jsonDecode(json!)['mobile'];
    print('fetchUserDetails---------${json}');
    return json == null ? myUser : AppUser.fromJson(jsonDecode(json));
  }

  Future<String> getString(String key, {required String defaultValue}) async {
    return instance.getString(key) ?? defaultValue;
  }

  putString(String key, String value) async {
    await instance.setString(key, value);
  }

  Future<bool> getBool(String key, {required bool defaultValue}) async {
    return instance.getBool(key) ?? defaultValue;
  }

  /// Puts bool [value] and returns true if the operation is success.
  Future<bool> putBool(String key, bool value) async {
    await instance.setBool(key, value);
    return true;
  }

  static Future<void> wipeAllData() async {
    await instance.clear();
  }

  //----------------------User Details
  Future<void> saveUserSession(AppUser user) async {
    await instance.setString(_keyUserSession, jsonEncode(user.toJson()));
  }

  Future<AppUser> loadUserSession() async {
    final json = instance.getString(_keyUserSession);
    _mobile = jsonDecode(json!)['mobile'];
    print('fetchUserDetails---------${json}');
    return json == null ? myUser : AppUser.fromJson(jsonDecode(json));
  }

  static Future<void> deleteUserSession() async {
    await instance.remove(_keyUserSession);
  }

//----------------------MatchList
  Future<void> addMatchList(List<String> matchList) async {
    if (matchList.isEmpty) return; //Should not be null
    //Use `Set` to avoid duplication of recentSearches
    Set<String> setMatchList = matchList.toSet();
    instance.setStringList(_keyMatchList, setMatchList.toList());
  }

  Future<List<String>> fetchMatchList() async {
    final allMatches = instance.getStringList(_keyMatchList);
    return allMatches!.toList();
  }

  Future<void> deleteMatchList() async {
    Set<String> allMatches =
        instance.getStringList(_keyRecentSearches)?.toSet() ?? {};
    //Place it at first in the set
    allMatches = {};
    instance.setStringList(_keyRecentSearches, allMatches.toList());
  }

  //----------------------RecentSearches
  Future<void> addRecentSearchesText(String searchText) async {
    if (searchText == null) return; //Should not be null
    //Use `Set` to avoid duplication of recentSearches
    Set<String> allSearches =
        instance.getStringList(_keyRecentSearches)?.toSet() ?? {};
    //Place it at first in the set
    allSearches = {searchText, ...allSearches};
    instance.setStringList(_keyRecentSearches, allSearches.toList());
  }

  Future<List<String>> fetchRecentSearchesWithQuery(String query) async {
    final allSearches = instance.getStringList(_keyRecentSearches);
    return allSearches!.where((search) => search.startsWith(query)).toList();
  }

  Future<List<String>> fetchRecentSearches() async {
    final allSearches = instance.getStringList(_keyRecentSearches);
    return allSearches!.toList();
  }

  Future<void> deleteRecentSearches() async {
    Set<String> allSearches =
        instance.getStringList(_keyRecentSearches)?.toSet() ?? {};
    //Place it at first in the set
    allSearches = {};
    instance.setStringList(_keyRecentSearches, allSearches.toList());
  }

  //----------------------Skills Required
  Future<void> addSkillsSearchesText(String searchText) async {
    if (searchText == null) return; //Should not be null
    //Use `Set` to avoid duplication of recentSearches
    Set<String> allSearches =
        instance.getStringList(_keySkillsSearches)?.toSet() ?? {};
    //Place it at first in the set
    allSearches = {searchText, ...allSearches};
    instance.setStringList(_keySkillsSearches, allSearches.toList());
  }

  Future<List<String>> fetchSkillsSearchesWithQuery(String query) async {
    final allSearches = instance.getStringList(_keySkillsSearches);
    return allSearches!.where((search) => search.startsWith(query)).toList();
  }

  Future<List<String>> fetchSkillsSearches() async {
    final allSearches = instance.getStringList(_keySkillsSearches);
    return allSearches!.toList();
  }

  Future<void> deleteSkillsSearches() async {
    Set<String> allSearches =
        instance.getStringList(_keySkillsSearches)?.toSet() ?? {};
    //Place it at first in the set
    allSearches = {};
    instance.setStringList(_keySkillsSearches, allSearches.toList());
  }

  Future<void> deleteSkillsSearchesValue(String value) async {
    Set<String> allSearches =
        instance.getStringList(_keySkillsSearches)?.toSet() ?? {};
    allSearches.remove(value);
    instance.setStringList(_keySkillsSearches, allSearches.toList());
  }

  //----------------------User Language
  Future<void> addUserLanguage(String lang) async {
    instance.setString(_keyUserLanguage, lang);
  }

  Future<String> fetchUserLanguage() async {
    try {
      var language = instance.getString(_keyUserLanguage);
      return language!;
    } catch (e) {
      return '';
    }
  }

  //----------------------LoginStatus
  Future<void> addLoginStatus(bool login) async {
    instance.setBool(_keyLogin, login);
  }

  Future<bool> fetchLoginStatus() async {
    try {
      var status = instance.getBool(_keyLogin) ?? false;
      return status;
    } catch (e) {
      return false;
    }
  }

  //----------------------UserType
  Future<void> addUserType(int type) async {
    instance.setInt(_keyUserType, type);
  }

  Future<int> fetchUserType() async {
    try {
      // await getSharedPreferences();
      var status = instance.getInt(_keyUserType);
      return status!;
    } catch (e) {
      return 1;
    }
  }
// static Future<void> deleteCartItems() async {
//   await instance.remove(_cartItems);
// }
//
// static Future<void> deleteUserStoreData() async {
//   await instance.remove(_userStoreData);
// }
//
// static Future<void> deleteSelectedAddress() async {
//   await instance.remove(_selectedAddress);
// }
//
// static Future<void> saveCartItems(CartModel cart) async {
//   await instance.setString(_cartItems, jsonEncode(cart.toMap()));
// }
//
// static CartModel getCartItems() {
//   String encodedString = instance.getString(_cartItems);
//   return encodedString != null ? CartModel.fromMap(jsonDecode(encodedString) as Map) : CartModel();
// }
//
// static Future<void> saveGuestAddress(Address address) async {
//   await instance.setString(_selectedAddress, jsonEncode(address.toMap()));
// }
//
// static Address getGuestAddress() {
//   String encodedString = instance.getString(_selectedAddress);
//   return encodedString != null ? Address.fromMap(jsonDecode(encodedString) as Map<String, dynamic>) : null;
// }
}
