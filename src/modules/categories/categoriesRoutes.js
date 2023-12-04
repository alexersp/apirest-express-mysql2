const express = require("express");
const categoriesController = require("./categoriesController");

const router = express.Router();

router.get("/", categoriesController.getAll);
router.get("/:id", categoriesController.getOne);
router.post("/", categoriesController.addOne);
router.put("/:id", categoriesController.updateOne);
router.delete("/:id", categoriesController.deleteOne);

module.exports = router;
