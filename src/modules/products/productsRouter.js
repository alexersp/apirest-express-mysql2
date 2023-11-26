const express = require("express");
const productController = require("./productsController");

const router = express.Router();

router.get("/", productController.getAll);
router.get("/:id", productController.getOne);
router.post("/", productController.addOne);
router.put("/:id", productController.updateOne);
router.delete("/:id", productController.deleteOne);

module.exports = router;
