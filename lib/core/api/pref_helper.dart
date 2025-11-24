import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  // Private constructor
  PrefHelper._();

  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';

  // Singleton instance
  static SharedPreferences? _prefs;

  // In-memory cache for frequently accessed values (HUGE PERFORMANCE BOOST)
  static String? _cachedToken;
  static String? _cachedUserId;

  /// Initialize SharedPreferences (call this once at app startup)
  /// This is CRITICAL for performance - prevents repeated getInstance() calls
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();

    // Load cached values into memory
    _cachedToken = _prefs?.getString(_tokenKey);
    _cachedUserId = _prefs?.getString(_userIdKey);
  }

  /// Get SharedPreferences instance (fallback if init() wasn't called)
  static Future<SharedPreferences> _getPrefs() async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  /// Save token. Call after login.
  /// OPTIMIZED: Updates both disk and memory cache
  static Future<void> saveToken(String token) async {
    try {
      _cachedToken = token; // Update cache immediately
      final prefs = await _getPrefs();
      await prefs.setString(_tokenKey, token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  /// Get token. Returns null if not set.
  /// OPTIMIZED: Returns from memory cache instantly (no disk read)
  static Future<String?> getToken() async {
    try {
      // Return cached value if available (INSTANT!)
      if (_cachedToken != null) return _cachedToken;

      // Fallback to disk read if cache miss
      final prefs = await _getPrefs();
      _cachedToken = prefs.getString(_tokenKey);
      return _cachedToken;
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  /// Synchronous token getter (use this in interceptors for best performance)
  /// Returns cached value immediately without async/await overhead
  static String? getTokenSync() {
    return _cachedToken;
  }

  /// Clear token. Call on logout.
  /// OPTIMIZED: Clears both disk and memory cache
  static Future<void> clearToken() async {
    try {
      _cachedToken = null; // Clear cache immediately
      final prefs = await _getPrefs();
      await prefs.remove(_tokenKey);
    } catch (e) {
      print('Error clearing token: $e');
    }
  }

  /// Save user ID
  /// OPTIMIZED: With memory caching
  static Future<void> saveUserId(String id) async {
    try {
      _cachedUserId = id;
      final prefs = await _getPrefs();
      await prefs.setString(_userIdKey, id);
    } catch (e) {
      print('Error saving user ID: $e');
    }
  }

  /// Get user ID
  /// OPTIMIZED: Returns from memory cache
  static Future<String?> getUserId() async {
    try {
      if (_cachedUserId != null) return _cachedUserId;

      final prefs = await _getPrefs();
      _cachedUserId = prefs.getString(_userIdKey);
      return _cachedUserId;
    } catch (e) {
      print('Error getting user ID: $e');
      return null;
    }
  }

  /// Synchronous user ID getter
  static String? getUserIdSync() {
    return _cachedUserId;
  }

  /// Clear all preferences
  static Future<void> clearAll() async {
    try {
      // Clear memory cache
      _cachedToken = null;
      _cachedUserId = null;

      // Clear disk storage
      final prefs = await _getPrefs();
      await prefs.clear();
    } catch (e) {
      print('Error clearing preferences: $e');
    }
  }

  /// Save any string value with caching
  static Future<void> saveString(String key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, value);
  }

  /// Get any string value
  static Future<String?> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key);
  }

  /// Save boolean
  static Future<void> saveBool(String key, bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(key, value);
  }

  /// Get boolean
  static Future<bool?> getBool(String key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key);
  }
}
