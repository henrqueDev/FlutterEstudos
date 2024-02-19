const String preferencesTableName = "preferences";

const String preferencesColumnID = "id";

const String preferencesColumnDarkTheme = "darkTheme";

const String createTablePreferences = '''
  CREATE TABLE $preferencesTableName (
    $preferencesColumnID INTEGER PRIMARY KEY, 
    $preferencesColumnDarkTheme BOOL NOT NULL
  )
''';
