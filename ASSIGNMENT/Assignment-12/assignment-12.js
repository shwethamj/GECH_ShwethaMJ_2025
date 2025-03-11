// const h1_tag = document.querySelector("#color");
// document.body.style.backgroundColor = "lightblue";

const h1_tag = document.getElementById("color");
const body = document.body;

//syntax : varname.addEventListener("keywords", function(para){what to happen})

h1_tag.addEventListener("keydown", function (event) {
  if (event.key === "Enter") {
    body.style.backgroundColor = "lightblue";
  }
});

//works for any key pressed without if block
h1_tag.addEventListener("keydown", function () {
  body.style.backgroundColor = "orange";
});

// Click Event:
// h1_tag.addEventListener("click", function () {
//   body.style.backgroundColor = "lightblue";
// });

// Hover Event
//mouse in
// h1_tag.addEventListener("mouseover", function () {
//   body.style.backgroundColor = "lightcoral";
// });

//  Mouse Out Event
// h1_tag.addEventListener("mouseout", function () {
//   body.style.backgroundColor = "";
// });

// Key Press Event
// document.addEventListener("keydown", function (event) {
//   if (event.key === "a" || event.key === "A") {
//     body.style.backgroundColor = "blue";
//   }
// });

// Double Click Event
h1_tag.addEventListener("dblclick", function () {
  body.style.backgroundColor = "green";
});

// Right Click Event
h1_tag.addEventListener("contextmenu", function (event) {
  event.preventDefault();
  body.style.backgroundColor = "purple";
});
