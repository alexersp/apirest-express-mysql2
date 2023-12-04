const { connection } = require("../../db/mysql");

function getAll(req, res) {
  connection.query("SELECT * FROM users", function (error, result) {
    if (error) {
      res.status(500).json({ error: error.message });
    }
    res.status(200).json({ result: result });
  });
}

function getOne(req, res) {
  const id = req.params.id;
  connection.query(
    "SELECT * FROM users WHERE id = ?",
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
  const { name, email, password, registration_date, active, role } = req.body;
  connection.query(
    "INSERT INTO (name, email, password, registration_date, active, role) VALUES(?, ?, ?, ?, ?, ?)",
    [ name, email, password, registration_date, active, role ],
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
  const { name, email, password, registration_date, active, role } = req.body;
  connection.query(
    "UPDATE users SET name = ?, email = ?, password = ?, registration_date = ?, active = ?, role = ? WHERE id = ?",
    [name, email, password, registration_date, active, role, id],
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
    "DELETE FROM users WHERE id = ?",
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
