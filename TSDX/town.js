// { "framework": "Vue"} 

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
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
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
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 27);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var iDetailArrow$png = exports.iDetailArrow$png = '//img.alicdn.com/tfs/TB17KMpawMPMeJjy1XcXXXpppXa-27-45.png';
var iNavBack$png = exports.iNavBack$png = '//img.alicdn.com/tfs/TB1eCPVigMPMeJjy1XbXXcwxVXa-64-64.png';
var iDetailNetWorkErrow$png = exports.iDetailNetWorkErrow$png = "//img.alicdn.com/tfs/TB18FawavxNTKJjy0FjXXX6yVXa-240-180.png";
var iClose$png = exports.iClose$png = '//img.alicdn.com/tfs/TB1u9Y5bUgQMeJjy0FiXXXhqXXa-36-36.png';

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(2)
)

/* script */
__vue_exports__ = __webpack_require__(3)

/* template */
var __vue_template__ = __webpack_require__(4)
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/components/index-slider.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-08c35c4c"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),
/* 2 */
/***/ (function(module, exports) {

module.exports = {
  "size": {
    "width": "750",
    "height": "300"
  },
  "indicator-size": {
    "width": "750",
    "height": "42"
  },
  "indicator": {
    "position": "absolute",
    "bottom": 0,
    "right": 0,
    "itemColor": "#DDDDDD",
    "itemSelectedColor": "#FF0000",
    "itemSize": "14"
  },
  "gray-bar": {
    "position": "absolute",
    "bottom": "0",
    "backgroundColor": "rgba(0,0,0,0.4)"
  }
}

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

exports.default = {
  data: function data() {
    return {
      scrollHnadlerCallCount: 0,
      offsetXRatio: 0,
      currIdx: 0,
      itemList: [{ itemId: '520421163634', title: 'item1', pictureUrl: 'https://gd2.alicdn.com/bao/uploaded/i2/T14H1LFwBcXXXXXXXX_!!0-item_pic.jpg' }, { itemId: '522076777462', title: 'item2', pictureUrl: 'https://gd1.alicdn.com/bao/uploaded/i1/TB1PXJCJFXXXXciXFXXXXXXXXXX_!!0-item_pic.jpg' }, { itemId: '522076777462', title: 'item3', pictureUrl: 'https://gd3.alicdn.com/bao/uploaded/i3/TB1x6hYLXXXXXazXVXXXXXXXXXX_!!0-item_pic.jpg' }, { itemId: '522076777467', title: 'item4', pictureUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491837948&di=3dcecd1b1d709196873a91f9fd585962&imgtype=jpg&er=1&src=http%3A%2F%2Fphotocdn.sohu.com%2F20160304%2Fmp61863731_1457078539188_3.gif' }]
    };
  }
};

/***/ }),
/* 4 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["slider-show", "size"]
  }, [_c('slider', {
    staticClass: ["size"],
    attrs: {
      "interval": "3000",
      "autoPlay": "true"
    }
  }, [_vm._l((_vm.itemList), function(item) {
    return _c('div', {
      key: item
    }, [_c('image', {
      staticClass: ["size"],
      attrs: {
        "src": item.pictureUrl
      }
    })])
  }), _c('indicator', {
    staticClass: ["indicator", "indicator-size"]
  })], 2), _c('div', {
    staticClass: ["gray-bar", "indicator-size"]
  })])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ }),
/* 5 */,
/* 6 */,
/* 7 */,
/* 8 */,
/* 9 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(10)
)

/* script */
__vue_exports__ = __webpack_require__(11)

/* template */
var __vue_template__ = __webpack_require__(12)
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/components/town-list-item.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-3527b812"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),
/* 10 */
/***/ (function(module, exports) {

module.exports = {
  "item": {
    "width": "750",
    "height": "200",
    "borderBottomColor": "#000000",
    "borderBottomStyle": "solid",
    "borderBottomWidth": "1",
    "flexDirection": "row",
    "alignItems": "center"
  },
  "sub-item": {
    "width": "50",
    "height": "180",
    "backgroundColor": "rgb(200,64,64)",
    "borderTopRightRadius": "12",
    "borderBottomRightRadius": "12",
    "alignItems": "center",
    "justifyContent": "center"
  },
  "sub-title": {
    "color": "#FFFFFF",
    "fontSize": "26",
    "fontWeight": "bold",
    "textAlign": "center",
    "maxHeight": "160",
    "maxWidth": "40"
  },
  "sub-summary": {
    "position": "absolute",
    "left": "80",
    "right": "230"
  },
  "summary": {
    "color": "#000000",
    "fontSize": "28",
    "textOverflow": "ellipsis",
    "lines": 4,
    "maxHeight": "180"
  },
  "sub-image": {
    "position": "absolute",
    "right": "15",
    "width": "180",
    "height": "180"
  }
}

/***/ }),
/* 11 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _cdnurl = __webpack_require__(0);

exports.default = {
  data: function data() {
    return {
      iDetailArrow$png: _cdnurl.iDetailArrow$png,
      pictureUrl: 'https://gd2.alicdn.com/bao/uploaded/i2/T14H1LFwBcXXXXXXXX_!!0-item_pic.jpg'
    };
  }
}; //
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/***/ }),
/* 12 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["item"],
    on: {
      "click": _vm.jump
    }
  }, [_vm._m(0), _vm._m(1), _c('image', {
    staticClass: ["sub-image"],
    attrs: {
      "src": _vm.pictureUrl,
      "resize": "stretch"
    }
  })])
},staticRenderFns: [function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["sub-item"]
  }, [_c('text', {
    staticClass: ["sub-title"]
  }, [_vm._v("栏里的的")])])
},function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["sub-summary"]
  }, [_c('text', {
    staticClass: ["summary"]
  }, [_vm._v("\"三省交三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三三省交界三省交界三省交界三省交界三省交界三省交界三省交界三省交界三省交界三省交界\\n三省交界三省交界三省交界三省交界\"")])])
}]}
module.exports.render._withStripped = true

/***/ }),
/* 13 */,
/* 14 */,
/* 15 */,
/* 16 */,
/* 17 */,
/* 18 */,
/* 19 */,
/* 20 */,
/* 21 */,
/* 22 */,
/* 23 */,
/* 24 */,
/* 25 */,
/* 26 */,
/* 27 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _town = __webpack_require__(28);

var _town2 = _interopRequireDefault(_town);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_town2.default.el = '#root';
new Vue(_town2.default);

/***/ }),
/* 28 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(29)
)

/* script */
__vue_exports__ = __webpack_require__(30)

/* template */
var __vue_template__ = __webpack_require__(31)
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/town.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-0fc3d2eb"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),
/* 29 */
/***/ (function(module, exports) {

module.exports = {
  "wrapper": {
    "justifyContent": "center",
    "alignItems": "center"
  },
  "list": {
    "position": "absolute",
    "top": 0,
    "right": 0,
    "bottom": 0,
    "left": 0
  }
}

/***/ }),
/* 30 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _indexSlider = __webpack_require__(1);

var _indexSlider2 = _interopRequireDefault(_indexSlider);

var _townListItem = __webpack_require__(9);

var _townListItem2 = _interopRequireDefault(_townListItem);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

//
//
//
//
//
//
//
//
//
//

var navigator = weex.requireModule('navigator');

exports.default = {
  components: {
    indexSlider: _indexSlider2.default,
    townListItem: _townListItem2.default
  },
  data: function data() {
    return {
      lists: ['A', 'B', 'C', 'D', 'E', 'D', 'E', 'D', 'E', 'D', 'E', 'D', 'E', 'D', 'E']
    };
  },

  methods: {
    jumpTown: function jumpTown() {
      navigator.push({
        url: 'http://192.168.31.62:8091/dist/detail.js',
        animated: "true"
      });
    }
  }
};

/***/ }),
/* 31 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["wrapper"]
  }, [_c('list', {
    staticClass: ["list"],
    attrs: {
      "showScrollbar": "false"
    }
  }, _vm._l((_vm.lists), function(num) {
    return _c('cell', {
      key: num,
      appendAsTree: true,
      attrs: {
        "append": "tree"
      },
      on: {
        "click": _vm.jumpTown
      }
    }, [_c('townListItem')], 1)
  }))])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ })
/******/ ]);