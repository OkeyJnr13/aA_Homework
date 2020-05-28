// function titleize(names, printCallback) {
//     let result = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
//     printCallback(result);
// };

// titleize(["Mary", "Brian", "Leo"], printCallback);


function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function () {
    this.height += 12 ;
}

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function () {
    const randomTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
    console.log(`${this.name} is ${randomTrick}!    `);
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

for (let i = 0; i < herd.length; i++) {
    var elephant = herd[i]
    Elephant.paradeHelper = function (elephant) {
        console.log(`${elephant.name} is trotting by!`);
    }
}

function dinerBreakfast() {
    
}