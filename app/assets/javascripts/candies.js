//candies show

function getComments() {
  $.get("/comments/", function(comments) {  
      var can = parseInt($(".js-next-candy").attr("data-id")) 
        comments.forEach(comment => {
          comment.getFormatted = () => {
            return comment.name;
          };
          if(comment.candy_id == can) {
            $("#allComments").append("Comment: " + comment.getFormatted() + "<br>");
        }
      })
  })
}
getComments()

//candies index
function postCandies() {
  $.getJSON("/candies/", function(candies) {
    candies.forEach(candy => {   
    let candyHTML = "<h3><a href='/candies/" + candy.id + "'>" + candy.name + "</a></h3><br>";
      $.getJSON("/comments/", function(comments) {
        comments.forEach(c => {
          if(c.candy_id == candy.id) {
            candyHTML += `<li> ${c.name} </li>`
          }    
        })
      $("#" + candy.taste + "Candies").append(candyHTML)
      });
    });
  });
}
postCandies();
