(function() {
  var drawBooks;

  $(function() {
    var books, client;
    client = new Apigee.Client({
      orgName: 'mmalloy@apigee.com',
      appName: 'testapp'
    });
    books = new Apigee.Collection({
      "client": client,
      "type": "books",
      "qs": {
        "ql": "order by created DESC"
      }
    });
    return books.fetch(function(err, data) {
      $('#books-list').empty();
      if (err) {
        alert("read failed");
      } else {
        drawBooks(books);
      }
      if (books.hasNextPage()) {
        return books.getNextPage(function(err, data) {
          if (err) {
            return alert("Could not get next page of books");
          } else {
            return books.fetch(function(err, data) {
              if (err) {
                return alert("There was a problem getting the next page of data");
              } else {
                books.resetEntityPointer();
                return drawBooks(books);
              }
            });
          }
        });
      }
    });
  });

  drawBooks = function(books) {
    var book, _results;
    _results = [];
    while (books.hasNextEntity()) {
      book = books.getNextEntity();
      _results.push($("#books-list").append('<li class="list-group-item"><strong>' + book.get("title") + "</strong><p>" + book.get("author") + "</p></li>"));
    }
    return _results;
  };

}).call(this);
