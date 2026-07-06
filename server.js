import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const app = express();
const port = process.env.PORT || 3000;

// Needed because __dirname is not available in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Set EJS as the view engine
app.set("view engine", "ejs");

// Serve static files
app.use(express.static(path.join(__dirname, "public")));

// Routes
app.get("/", (req, res) => {
  res.render("home", { title: "Home" });
});

app.get("/organizations", (req, res) => {
  res.render("organization", { title: "Organizations" });
});

app.get("/service-projects", (req, res) => {
  res.render("service-projects", { title: "Service Projects" });
});

app.get("/categories", (req, res) => {
  res.render("categories", { title: "Service Project Categories" });
});

// Start server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
  
});