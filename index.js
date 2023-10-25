require('dotenv').config()
const oracledb = require('oracledb');

(async () => {
    oracledb.initOracleClient({
        libDir: process.env.PWD + '/lib/instantclient_19_8',
    })

    const connection = await oracledb.getConnection({
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        connectString: process.env.CONN_STRING
    })

    const result = await connection.execute(process.env.TEST_QUERY, [], { maxRows: 1 });

    console.log(result.rows.toString())

    await connection.close();
})();
