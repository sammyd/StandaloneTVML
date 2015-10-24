
var resourceLoader;

App.onLaunch = function(options) {
  resourceLoader = ResourceLoader.create();
  var doc = getDocument("MainMenu.tvml");
  pushDoc(doc);
}

function getDocument(named) {
  var docString = resourceLoader.loadBundleResource(named);
  var parser = new DOMParser();
  return parser.parseFromString(docString, "application/xml");
}

function pushDoc(document) {
  navigationDocument.pushDocument(document);
}
