$(function () {
    $(".js-next").on("click", function(e) {
    e.preventDefault()
    debugger
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/candies/" + nextId + ".json", function(data) {
        debugger
    $(".candyName").text("Candy: " + data.name);
    $(".candyTaste").text("Taste: " + data.taste + " candy");
    $(".candyAppetite").text("Appetite: " + data.appetite);
    $(".candyCost").text("Cost: $" + data.cost);
    $(".candyCount").text("Remaining Count: " + data.count);
    $(".js-next").attr("data-id", data.id);
      });
    });
  });
  
    function getComments() {
      $.get("/comments/", function(comments) {  
        var can = parseInt($(".js-next").attr("data-id")) 
        comments.forEach(comment => {
          Object.getPrototypeOf(comment).getFormatted = () => {
            return '$$$$$$$' + this.name;
          };
        if(comment.candy_id == can) {
    $("#allComments").append("Candy Comment: " + comment.getFormatted() + "<br>");
        }
      })
     })
    }
  getComments()
  