// window.$1 = ((arg) => {
  
// })

const DOMNodeCollection = require("./dom_node_collection");

window.$l = function(selector) {
  let elements;
  
  if(selector instanceof HTMLElement) {
    elements = [selector];
  } else if (typeof selector === 'string') {
    elements = Array.from(document.querySelectorAll(selector));
  }
  return new DOMNodeCollection(elements);
  // return elements;
}

// window.DOMNodeCollection = DOMNodeCollection