import express from "express";
import { pool } from "./db/database.js";

const server = express();
const PORT = process.env.PORT;

server.get("/", function (req, res) {
  res.json({ message: "IT Resource Manager" });
});

server.get("/enterprises", async function (req, res) {
  try {
    const result = await pool.query("SELECT * FROM enterprise");
    res.json(result.rows);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
});
server.listen(PORT, function () {
  console.log(`Servidor rodando: http://localhost:${PORT}/`);
});
