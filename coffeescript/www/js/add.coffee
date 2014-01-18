$( () -> 
  $( "#submit-btn" ).bind "click", () ->
    client = new Apigee.Client
      orgName:'mmalloy@apigee.com',
      appName:'testapp' 
    books = new Apigee.Collection
      "client":client, 
      "type":"books"
    book=         
      "title":$("#title").val(),
      "author":$("#author").val()
    books.addEntity book, (err, response) ->
      if err
        $("#save-message").html '<div class="alert alert-danger">Book ' + $("#title").val() + " did not save</div>"
      else
        htmlMessage = '<p>&nbsp <br/></p><div class="alert alert-success">Book ' + $("#title").val() + "  saved successfully</div>"
        document.getElementById('save-message').innerHTML = htmlMessage
    $("#title").val ""
    $("#author").val ""
    window.location.reload
        
  $("#finished-btn").bind "click", () ->
    window.location.href = "index.html";
)