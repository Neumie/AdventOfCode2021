const data = require("./data.js");
const days = 256;

const daysToBirth = 8;
const daysToGrow = 6;

const relevantDays = [0, 0, 0, 0, 0, 0, 0, 0, 0];

for (let i = 0; i < data.length; i ++) {
  const fishAge = data[i];

  relevantDays[fishAge]++; 
}

for (let i = 0; i < days; i++) {
  const fishAtDayZero = relevantDays.shift();
  relevantDays[daysToGrow] += fishAtDayZero;
  relevantDays.push(fishAtDayZero);
}

let result = 0;

for (let count of relevantDays) {
  result += count;
}

console.log(result);