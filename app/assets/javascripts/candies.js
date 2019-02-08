//candies show
function getFormatted() {
  return this.description + this.user_id
}

function getComments() {
  $.get("/comments/", function(comments) {  
      var can = parseInt($(".js-next-candy").attr("data-id")) 
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
getComments()