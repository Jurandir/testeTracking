// Atualiza dados referente ao status da entrega

const sqlExec       = require('../../connection/sqlExec')
const sendLog       = require('../../helpers/sendLog')

const fs            = require('fs')
const path          = require('path')
const sqlFileName   =  path.join(__dirname, '../../sql/rotinas/UPDATE_ENTREGA_NF.sql');

var sqlEntregas = fs.readFileSync(sqlFileName, "utf8")


async function gravaRegistroEntrega(evidencia) {    
    let dados = {}
    let sql = eval('`'+sqlEntregas+'`');

    try {
        result = await sqlExec(sql)       

        if (result.rowsAffected==-1){
            throw new Error(`DB ERRO - ${result.Erro} : SQL => [ ${sql} ]`)
        }

        return result
  
    } catch (err) {
        dados = { "erro" : err.message, "rotina" : "gravaRegistroEntrega", "sql" : sql,"registro": evidencia }
        sendLog('ERRO', JSON.stringify(dados) )
        return dados
    } 
}

module.exports = gravaRegistroEntrega

