(function() {
  $(function() {
    $("#submit-btn").bind("click", function() {
      var book, books, client;
      client = new Apigee.Client({
        orgName: 'mmalloy@apigee.com',
        appName: 'testapp'
      });
      books = new Apigee.Collection({
        "client": client,
        "type": "books"
      });
      book = {
        "title": $("#title").val(),
        "author": $("#author").val()
      };
      books.addEntity(book, function(err, response) {
        var htmlMessage;
        if (err) {
          return $("#save-message").html('<div class="alert alert-danger">Book ' + $("#title").val() + " did not save</div>");
        } else {
          htmlMessage = '<p>&nbsp <br/></p><div class="alert alert-success">Book ' + $("#title").val() + "  saved successfully</div>";
          return document.getElementById('save-message').innerHTML = htmlMessage;
        }
      });
      $("#title").val("");
      $("#author").val("");
      return window.location.reload;
    });
    return $("#finished-btn").bind("click", function() {
      return window.location.href = "index.html";
    });
  });

}).call(this);
