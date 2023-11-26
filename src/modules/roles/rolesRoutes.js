const express = require("express");
const rolesController = require("./rolesController");

const router = express.Router();

router.get("/", rolesController.getAll);
router.get("/:id", rolesController.getOne);
router.post("/", rolesController.addOne);
router.put("/:id", rolesController.updateOne);
router.delete("/:id", rolesController.deleteOne);

module.exports = router;
