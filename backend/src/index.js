import express from "express";

const server = express();

server.get("/", function (req, res) {
  res.json({ message: "IT Resource Manager" });
});

server.listen(5500, function () {
  console.log("Servidor rodando: http://localhost:5500/");
});
