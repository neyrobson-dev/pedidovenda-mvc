# pedidovenda-mvc

- Projeto desenvolvido em Delphi Tokyo utilizando o framework simpleorm (personalizado) para a persistência dos dados

- Utilize o arquivo Config.ini para adicionar as informações de conexão com o banco de dados

- Segue script do banco contendo as seguintes tabelas: clientes, produtos, pedidos e pedidositens

# Erros
Caso dê o erro: [Phys][MySQL] Plugin caching_sha2_password could not be loaded: Não foi possível encontrar o módulo especificado

Execute o seguinte comando SQL:
ALTER USER 'SEU NOME DE USUARIO'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SUA SENHA';
