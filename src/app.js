const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const config = require("./config.js");

const products = require("./modules/products/productsRouter.js");
const roles = require("./modules/roles/rolesRoutes.js");

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.set("x-powered-by", false);
app.set("port", config.app.port);
app.set("host", config.app.host);

app.get("/api/v1", (req, res) => {
  res.json({
    message: "Server running",
  });
});

app.use("/api/v1/products", products);
app.use("/api/v1/roles", roles);

module.exports = app;
