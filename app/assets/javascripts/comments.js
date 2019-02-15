class Comment { 
  constructor({name, user_id, candy_id}) {
    this.name = name    
    this.user_id = user_id
    this.candy_id = candy_id
  };

getFormatted () {
  return this.name + this.user_id
  }
}

  //comments index
function postComments() {
  $.getJSON("/candies/", function(candies) {
    candies.forEach(candy => {   
      let candyHTML = "<h3><a href='/candies/" + candy.id + "'>" + candy.name + "</a></h3><br>";
    // let comHTML = `<h4>${candy.name}</h4><br>`;
      // $.getJSON("/comments/", function(comments) {
        candy.comment_contents.forEach(c => {
          // if(c.candy_id == candy.id) {
      //       comHTML += `<li><a href='/comments/ ${c.id}'> ${c.name}</a></li>`
      // candyHTML += `<li> ${c.name} </li>`
      // comHTML +=  `<li> ${c} </li>`
      candyHTML += `<li> ${c} </li>`
          // }
        })
        $("#" + candy.taste + "Candies").append(candyHTML)
      // $(".Comment").append(comHTML)
      // });
    });
  });
}

function clickListener() {
  $("#sort").on("click", function(e) {
    e.preventDefault()
    $("#sourCandies").html(" <h2>Sour Candies</h2>")
    $("#sweetCandies").html(" <h2>Sweet Candies</h2>")
    $.getJSON("/candies/", function(candies) {
      candies.sort(function(a, b) {
        var nameA = a.name.toUpperCase(); // ignore upper and lowercase
        var nameB = b.name.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      });
      candies.forEach(candy => {
      let candyHTML = "<h3><a href='/candies/" + candy.id + "'>" + candy.name + "</a></h3><br>";
      $("#" + candy.taste + "Candies").append(candyHTML)
      })
    })
  })
//comments show
    $(".js-next").on("click", function(e) {
      e.preventDefault()
      var nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.get("/comments/" + nextId + ".json", function(comment) {  
        $(".commentCandyName").text("Candy: " + comment.candy.name);
        $(".commentName").text("Comment: " + comment.name);
        $(".js-next").attr("data-id", comment.id);
      });
    });
  };
