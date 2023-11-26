const mysql = require("mysql2");
const config = require("../config");

let connection;

try {
  connection = mysql.createConnection(config.mysql);
  console.log("DB connected");
} catch (error) {
  console.log("DB error", error.message);
}

module.exports = {
  connection,
};
