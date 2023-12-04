const { connection } = require("../../db/mysql");

function getAll(req, res) {
  connection.query("SELECT * FROM categories", function (error, result) {
    if (error) {
      res.status(500).json({ error: error.message });
    }
    res.status(200).json({ result: result });
  });
}

function getOne(req, res) {
  const id = req.params.id;
  connection.query(
    "SELECT * FROM categories WHERE id = ?",
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
  const { name } = req.body;
  connection.query(
    "INSERT INTO categories(name) VALUES(?)",
    [name],
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
  const { name } = req.body;
  connection.query(
    "UPDATE categories SET name = ? WHERE id = ?",
    [name, id],
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
    "DELETE FROM categories WHERE id = ?",
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
