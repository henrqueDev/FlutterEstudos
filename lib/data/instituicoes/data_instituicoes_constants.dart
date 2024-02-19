const String instituicoesTableName = "instituicoes";

const String instituicoesColumnID = "id";

const String instituicoesColumnNome = "nome";

const String createInstituicoesTable = '''
  CREATE TABLE $instituicoesTableName (
    $instituicoesColumnID INTEGER PRIMARY KEY, 
    $instituicoesColumnNome VARCHAR NOT NULL
  )
''';
