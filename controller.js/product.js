const Product = require("../models/product");
const Bill = require("../models/bill");

exports.getProductById = async (req, res) => {
  const pid = req.params.pid;
  const product = await Product.findOne({ pid: pid });
  return res.status(200).send({
    iserror: false,
    message: "Success",
    product: product,
  });
};

exports.createBill = async (req, res) => {
  const produts = req.body.products;
  const bill = new Bill({
    products: products,
    totalPrice: req.body.totalPrice,
  });
  await bill.save();

  return res.status(200).send({
    iserror: false,
    message: "Success",
    product: product,
  });
};

exports.getBill = async (req, res) => {
  const id = req.params.id;
  const bill = await Bill.findById(req.body.id).populate("products");
  return res.status(200).send({
    iserror: false,
    message: "Success",
    bill: bill,
  });
};

exports.hello = async (req, res) => {
  return res.status(200).send({
    iserror: false,
    message: "Success",
  });
};
