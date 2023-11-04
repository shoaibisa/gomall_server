const express = require("express");
const pCon = require("../controller.js/product");

const router = express.Router();

router.get("/getproduct/:pid", pCon.getProductById);
router.post("/createbill", pCon.createBill);
router.post("/getbill", pCon.getBill);

router.get("/nai", pCon.hello);

module.exports = router;
