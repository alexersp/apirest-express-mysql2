const { connection } = require("../../db/mysql");

function getAll(req, res) {
  connection.query("SELECT * FROM products", function (error, result) {
    if (error) {
      res.status(500).json({ error: error.message });
    }
    res.status(200).json({ result: result });
  });
}

function getOne(req, res) {
  const id = req.params.id;
  connection.query(
    "SELECT * FROM products WHERE id = ?",
    [id],
    function (error, result) {
      if (error) {
        res.status(500).json({ error: error.message });
      }
      res.status(200).json({ result: result });
    }
  );
}

function addOne(req, res) {
  const {
    name,
    description,
    quantity_available,
    price,
    discount_rate,
    active,
    purchase_limit_per_user,
  } = req.body;
  connection.query(
    "INSERT INTO products(name, description, quantity_available, price, discount_rate, active, purchase_limit_per_user) VALUES(?,?,?,?,?,?,?)",
    [
      name,
      description,
      quantity_available,
      price,
      discount_rate,
      active,
      purchase_limit_per_user,
    ],
    function (error, result) {
      if (error) {
        res.status(500).json({ error: error.message });
      }
      res.status(200).json({ result: result });
    }
  );
}

function updateOne(req, res) {
  const id = req.params.id;
  const {
    name,
    description,
    quantity_available,
    price,
    discount_rate,
    active,
    purchase_limit_per_user,
  } = req.body;
  connection.query(
    "UPDATE products SET name = ?, description = ?, quantity_available = ?, price = ?, discount_rate = ?, active = ?, purchase_limit_per_user = ? WHERE id = ?",
    [
      name,
      description,
      quantity_available,
      price,
      discount_rate,
      active,
      purchase_limit_per_user,
      id,
    ],
    function (error, result) {
      if (error) {
        res.status(500).json({ error: error.message });
      }
      res.status(200).json({ result: result });
    }
  );
}

function deleteOne(req, res) {
  const id = req.params.id;
  connection.query(
    "DELETE FROM products WHERE id = ?",
    [id],
    function (error, result) {
      if (error) {
        res.status(500).json({ error: error.message });
      }
      res.status(200).json({ result: result });
    }
  );
}

module.exports = {
  getAll,
  getOne,
  addOne,
  updateOne,
  deleteOne,
};
