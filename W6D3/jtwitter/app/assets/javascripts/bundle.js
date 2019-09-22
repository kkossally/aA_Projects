/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
const APIUtil = {
  followUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'POST',
      url: `/users/${id}/follow`
    });
  },

  unfollowUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'DELETE',
      url: `/users/${id}/follow`
    });
  }
};

/* harmony default export */ __webpack_exports__["default"] = (APIUtil);


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _api_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");


class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  };

  successCB() {
    if (this.followState === "unfollowed") {
      this.followState = "followed";
    } else if (this.followState === "followed") {
      this.followState = "unfollowed";
    } else if (this.followState === "Following...") {
      this.followState = "followed";
    } else if (this.followState === "Unfollowing...") {
      this.followState = "unfollowed";
    }
    this.render();
  }

  render() {
    if (this.followState === "unfollowed"){
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    } else {
      this.$el.text(`${this.followState}`);
    }

    if (this.followState === 'Following...' || this.followState === 'Unfollowing...') {
      this.$el.prop("disabled", true)
    } else {
      this.$el.prop("disabled", false)
    }
  }

  handleClick(){
    this.$el.on("click", e => {
      e.preventDefault();

      if (this.followState === "unfollowed") {
        this.followState = "Following...";
        this.render();
        _api_util_js__WEBPACK_IMPORTED_MODULE_0__["default"].followUser(this.userId).then(this.successCB.bind(this));
      } else {
        this.followState = "Unfollowing...";
        this.render();
        _api_util_js__WEBPACK_IMPORTED_MODULE_0__["default"].unfollowUser(this.userId).then(this.successCB.bind(this));
      }
    });
  }
}


/* harmony default export */ __webpack_exports__["default"] = (FollowToggle);

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _follow_toggle_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
/* harmony import */ var _api_util_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");



$(() => {
  const $els = $(".follow-toggle");
  $els.each( (index, el) => {
    new _follow_toggle_js__WEBPACK_IMPORTED_MODULE_0__["default"]($(el));
  });  
});

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map