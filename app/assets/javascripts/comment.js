
  function getFormatted() {
    return this.description + this.user_id
  }

    function getComments() {
      $.get("/comments/", function(comments) {  
        var can = parseInt($(".js-next").attr("data-id")) 
        comments.forEach(comment => {
          Object.getPrototypeOf(comment).getFormatted = () => {
            return comment.name;
        }
      })
     })
    }
//comment
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


