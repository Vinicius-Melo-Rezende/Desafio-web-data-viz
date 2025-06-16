var database = require("../database/config")

function autenticar(nickname, senha) {
    var instrucaoSql = `
        SELECT idUsuario, nome, email, fk_CodigoAtivacao as CodigoAtivacao FROM usuario WHERE nickname = '${nickname}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, empresa, nickname) {
    var instrucaoSql = `
       INSERT INTO usuario (nome, email, nickname, senha, fk_CodigoAtivacao)
VALUES ('${nome}', '${email}', '${nickname}', '${senha}', '${empresa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
};