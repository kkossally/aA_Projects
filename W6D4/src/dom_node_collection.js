class DOMNodeCollection {
  
  constructor(array) {
    this.elements = array;
  }

  html(string) {   // should these functions be defined separately on the prototype
    if (string !== undefined) {
      this.elements.forEach( (el) => {
        el.innerHTML = string;
      });
    } else if (string === undefined) {
      return this.elements[0];
    }
  }

  empty() {
    this.html("");
  }

  append(collection) {
    const that = this
    if (collection instanceof DOMNodeCollection) {
      collection.elements.forEach(function(element) {
        debugger
        that.elements.forEach(function(ele) {
          let cloned = element.cloneNode(true);
          ele.append(cloned);
        });
      });
    } else if (collection instanceof HTMLElement) {
      that.elements.forEach(function(ele) {
        let cloned = collection.cloneNode(true);
        ele.append(cloned);
      });
    }
  }
  attr(attributeName, value) {
    this.elements.forEach(function(el) {
      el.setAttribute(attributeName, value);
    });
  }

  addClass(className) {
    this.elements.forEach(function(el) {
      el.classList.add(className);
    });
  }

  removeClass(className){
    this.elements.forEach(function(el) {
      el.classList.remove(className);
    });
  }

  
  parent() {
    return new DOMNodeCollection(this.parentElement);
  }
  
  children(selector){
    const daycare = [];

    this.elements.forEach(function(el) {
      Array.from(el.children).forEach(function(kid) {
        if (selector === undefined) daycare.push(kid);
        else if (kid.tagName === selector.toUpperCase()) daycare.push(kid);
      });
    });
    return new DOMNodeCollection(daycare);
  }
  
  find(selector) {
    return this.children(selector);
  }

  remove() {
    this.parent().remove();
  }


}

module.exports = DOMNodeCollection;