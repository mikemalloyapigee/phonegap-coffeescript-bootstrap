$( () -> 
  client = new Apigee.Client
    orgName:'mmalloy@apigee.com',
    appName:'testapp'          
  books = new Apigee.Collection
    "client":client, 
    "type":"books"
    
  books.fetch (err, data) ->
    $('#books-list').empty()
    if (err)
      alert("read failed");
    else
      drawBooks books
    if books.hasNextPage()
      books.getNextPage (err, data) ->
        if err
          alert "Could not get next page of books"
        else
          books.fetch (err, data) ->
            if err
              alert "There was a problem getting the next page of data"
            else
              books.resetEntityPointer()
              drawBooks books
      
)

drawBooks = (books) ->
  while books.hasNextEntity()
    book = books.getNextEntity()
    #alert(book.get("title")); // Output the title of the book
    $("#books-list").append('<li class="list-group-item"><strong>'+book.get("title")+"</strong><p>"+book.get("author")+"</p></li>")


  