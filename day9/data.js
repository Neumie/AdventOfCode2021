const fs = require("fs");

const data = fs.readFileSync(`${__dirname}/data.txt`, "utf-8");

const matrix = data.split("\n").map(row => {
  return row.split("").map(item => parseInt(item));
});

module.exports = matrix;