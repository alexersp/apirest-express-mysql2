require("dotenv").config();

module.exports = {
  app: {
    host: process.env.HOST || "localhost",
    port: process.env.PORT || "3000",
  },
  mysql: {
    host: process.env.DBHOST || "localhost",
    port: process.env.DBPORT || "3306",
    user: process.env.DBUSER || "root",
    password: process.env.DBPASS || "",
    database: process.env.DBNAME || "test",
  },
};
