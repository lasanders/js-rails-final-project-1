//candies index
function postCandies() {
  $.getJSON("/candies/", function(candies) {
    candies.forEach(candy => {   
      $("#" + candy.taste + "Candies").append("<a href='/candies/" + candy.id + "'>" + candy.name + "</a><br>");   
    });
  });
};
postCandies();


  function getFormatted() {
    return this.description + this.user_id
  }

   function getComments(can) {
      $.get("/comments/", function(comments) {  
        var can = parseInt($(".js-next").attr("data-id")) 
        comments.forEach(comment => {
          Object.getPrototypeOf(comment).getFormatted = () => {
            return comment.name;
          };
        if(comment.candy_id == can) {
    $("#allComments").append("Comment: " + comment.getFormatted() + "<br>");
        }
      })
     })
    }
  
