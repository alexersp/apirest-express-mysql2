const express = require("express");
const usersController = require("./usersController");

const router = express.Router();

router.get("/", usersController.getAll);
router.get("/:id", usersController.getOne);
router.post("/", usersController.addOne);
router.put("/:id", usersController.updateOne);
router.delete("/:id", usersController.deleteOne);

module.exports = router;