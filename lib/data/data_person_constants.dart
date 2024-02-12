const String databaseName = "lanchonete.db";

const int databaseVersion = 1;

const String pessoasTableName = "persons";

const String pessoasColumnID = "id";

const String pessoasColumnNome = "name";

const String pessoasColumnIdade = "age";

const String createPessoasTable = '''
  CREATE TABLE $pessoasTableName($pessoasColumnID INTEGER PRIMARY KEY, $pessoasColumnNome TEXT, $pessoasColumnIdade INTEGER)
''';
