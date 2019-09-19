class DOMNodeCollection {
  
  constructor(array) {
    this.elements = array;
  }

  html(string) {
    if (string !== undefined) {
      this.elements.forEach( (el) => {
        el.innerHTML = string;
      });
    } else if (string === undefined) {
      return this.elements[0];
    }
  }
}

module.exports = DOMNodeCollection;