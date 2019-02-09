class Comment {	
  constructor({name, user_id, candy_id}) {
    this.name = name    
    this.user_id = user_id
    this.candy_id = candy_id
  };
}
Comment.prototype.getComments = () => {
  return this.name + this.user_id
}
  
function postComments() {
  $.getJSON("/candies/", function(candies) {
    candies.forEach(candy => {   
    let candyHTML = `<h4>${candy.name}</h4><br>`;
      $.getJSON("/comments/", function(comments) {
        comments.forEach(c => {
          if(c.candy_id == candy.id) {
            candyHTML += `<li><a href='/comments/ ${c.id}'> ${c.name}</a></li>`
          }    
        })
      $(".Comment").append(candyHTML)
      });
    });
  });
}
postComments();

//comments show
  $(function () {
    $(".js-next").on("click", function(e) {
      e.preventDefault()
      var nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.get("/comments/" + nextId + ".json", function(comment) {  
        $(".commentCandyName").text("Candy: " + comment.candy.name);
        $(".commentName").text("Comment: " + comment.name);
        $(".js-next").attr("data-id", comment.id);
      });
    });
  });
