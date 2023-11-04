const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  name: String,
  price: Number,
  expiry: Date,
  pid: Number,
});

mongoose.model("Product", productSchema);
