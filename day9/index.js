const data = require("./data.js");

let sumOfLowestNumbers = 0;

for (let y = 0; y < data.length; y++) {
  for (let x = 0; x < data[y].length; x++) {
    const number = data[y][x];

    if (data[y + 1] && number >= data[y + 1][x]) {
      continue;
    }

    if (data[y - 1] && number >= data[y - 1][x]) {
      continue;
    }

    if (number >= data[y][x + 1]) {
      continue;
    }

    if (number >= data[y][x - 1]) {
      continue;
    }

    sumOfLowestNumbers += number + 1;
  }
}

console.log(sumOfLowestNumbers);