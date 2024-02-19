const String databaseName = "lanchonete.db";

const int databaseVersion = 1;

const String clientesTableName = "clientes";

const String clientesColumnID = "id";

const String clientesColumnNome = "nome";

const String clientesColumnIdade = "idade";

const String clientesColumnSaldo = "saldo";

const String createclientesTable = '''
  CREATE TABLE $clientesTableName($clientesColumnID INTEGER PRIMARY KEY, $clientesColumnNome TEXT, $clientesColumnIdade INTEGER, $clientesColumnSaldo FLOAT)
''';
