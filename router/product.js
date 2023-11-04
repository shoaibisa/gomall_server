const express = require("express");
const pCon = require("../controller.js/product");

const router = express.Router();

router.post("/getproduct", pCon.getProductById);
router.post("/createbill", pCon.createBill);
router.post("/getbill", pCon.getBill);

module.exports = router;
