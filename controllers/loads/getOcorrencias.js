const sqlQuery      = require('../../connection/sqlQuery')
const sendLog       = require('../../helpers/sendLog')
const fs            = require('fs')
const path          = require('path')
const sqlFileName   =  path.join(__dirname, '../../sql/consultas/COMPROVANTES_PENDENTES.SQL');

var sqlOcorrencias = fs.readFileSync(sqlFileName, "utf8");

async function getOcorrencias() {    
    let dados = {}
    try {
        data = await sqlQuery(sqlOcorrencias)
        let { Erro } = data
        if (Erro) { 
            throw new Error(`DB ERRO - ${Erro} : SQL => [ ${sqlOcorrencias} ]`)
        }  
        dados = data
        return dados
    } catch (err) {
        dados = { "erro" : err.message, "rotina" : "getOcorrencias", "sql" : sqlOcorrencias }
        sendLog('ERRO', JSON.stringify(dados) )
        return dados
    } 
}

module.exports = getOcorrencias