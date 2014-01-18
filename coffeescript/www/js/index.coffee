# Index.coffee
#
# Companion file to index.html, compiles to index.js in www/js folder

app = 
  initialize: () ->
    this.bindEvents()
    
  bindEvents: () ->
    document.addEventListener 'deviceready', this.onDeviceReady, false
  
  onDeviceReady: () ->
    app.receivedEvent 'deviceready'
  
  receivedEvent: (id) ->
    parentElement = document.getElementById id
    listeningElement = parentElement.querySelector '.listening'
    receivedElement = parentElement.querySelector '.received'

    listeningElement.setAttribute 'style', 'display:none;'
    receivedElement.setAttribute 'style', 'display:block;'

    console.log 'Received Event: ' + id
    