enum BuildVariant { DEV, STG, PROD }

class Environment {
  static Map<String, dynamic> _config;

  static void setEnvironment(BuildVariant env) {
    switch (env) {
      case BuildVariant.DEV:
        _config = _Config.debugConstants;
        break;
      case BuildVariant.STG:
        _config = _Config.stgConstants;
        break;
      case BuildVariant.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get baseURL {
    return _config[_Config.BASE_URL];
  }
}

class _Config {
  static const BASE_URL = "BASE_URL";

  static Map<String, dynamic> debugConstants = {
    BASE_URL: "localhost:3000/",
  };

  static Map<String, dynamic> stgConstants = {
    BASE_URL: "https://staging1.example.com/",
  };

  static Map<String, dynamic> prodConstants = {
    BASE_URL: "https://itsallwidgets.com/",
  };
}
