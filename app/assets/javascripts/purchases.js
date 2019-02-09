//purchases show
  $(function () {
    $(".js-next").on("click", function(e) {
      e.preventDefault()
      var user_id = parseInt($(".js-next").attr("user-id"))
      var nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.get("/users/" + user_id + "/purchases/" + nextId + ".json", function(purchase) {
        $(".purchaseCandyName").text(purchase.candy.name)
        $(".purchaseCandyTaste").text("Candy Taste: " + purchase.candy.taste) 
        $(".purchaseCandyAppetite").text("Candy Appetite Rating: " + purchase.candy.appetite)
        $(".purchaseCandyCost").text("Cost of Candy: " + purchase.candy.cost)
        $(".purchasePaymentType").text("Payment Type: " + purchase.payment_type)
        $(".js-next").attr("data-id", purchase.id);
      });
    });
  });

  function getPurchases() {
    $.getJSON("/purchases/", function(purchases) {
      purchases.forEach(purchase => {   
        $(".Purchase").append("<a href='/purchases/" + purchase.id + "'</a><br>");   
        $(".Purchase").text("Candy: " + purchase.candy.name);
        $(".Purchase").text("Candy Flavor: " + purchase.candy.taste) 
        $(".Purchase").text("Candy Appetite Rating: " + purchase.candy.appetite)
        $(".Purchase").text("Cost of Candy: " + purchase.candy.cost)
        $(".Purchase").text("Payment Type: " + purchase.payment_type)
      })  
    });
  };
