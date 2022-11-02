const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("This is my docker app");
});

app.get("/me", (req, res) => {
  res.send("Hi I am Anu");
});

app.listen(5000, () => {
  console.log("listening");
});