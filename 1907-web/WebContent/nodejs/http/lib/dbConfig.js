/**
 * dbConfig.js
 * date : 2020.02.27
 * 오라클 DB를 연결하기 위한 설정 파일
 */

module.exports = {
	user : process.env.NODEORACLEDB_USER || 'park',
	password : process.env.NODEORACLEDB_PASSWORD || '1234',
	connectString : 
		process.env.NODEORACLEDB_CONNECTIONSTRING || 'localhost/xe'
}

