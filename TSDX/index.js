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
/******/ 	return __webpack_require__(__webpack_require__.s = 33);
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
var NavBackIcon = exports.NavBackIcon = 'http://192.168.31.62:8083/dist/icon/nav-back.png';

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.isEmptyObj = isEmptyObj;
var modal = weex.requireModule('modal');
var navigator = weex.requireModule('navigator');

// 一些公共常量
var _weex$config = weex.config,
    bundleUrl = _weex$config.bundleUrl,
    env = _weex$config.env;
var platform = exports.platform = env.platform.toLowerCase();
var iphoneX = exports.iphoneX = platform === 'ios' && env.deviceHeight === 2436;

var navbarHeight = exports.navbarHeight = 98;
var deviceHeight = exports.deviceHeight = env.deviceHeight * 750 / env.deviceWidth; // TODO: 减去状态栏高度
var navbarAndStatusBarHeight = exports.navbarAndStatusBarHeight = platform === 'ios' ? 128 : 98;

// 空函数
var noop = exports.noop = function noop() {};

// 显示toast信息
var toast = exports.toast = function toast(message) {
  var duration = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0.8;

  modal.toast({ message: message, duration: duration });
};

// alert 主要用于调试
var alert = exports.alert = function alert(message) {
  modal.alert({ message: message });
};

// 通过 bundleUrl 取指定 page 的 url
var getPageUrl = exports.getPageUrl = function getPageUrl(options) {
  var pageName = options.pageName,
      params = options.params,
      removeParams = options.removeParams;

  var pageUrl = new Httpurl(bundleUrl);

  // weex 不知道为什么要在 bundleUrl 后边加上 url 这个参数，导致分享时 URL 过长而出错，这里统一删掉
  delete pageUrl.params.url;

  // 开发环境，地址是 `src/pages/${pageName}/index.html` 和 `dist/${pageName}.weex.js`
  // 线上环境，地址是 `hemamall/${pageName}.html` 和 `hemamall/${pageName}.weex.js`
  pageUrl.pathname = pageUrl.pathname.replace(/\/\w+\/index\.html/ig, '/' + pageName + '/index.html').replace(/hemamall\/\w+\.html/ig, 'hemamall/' + pageName + '.html');
  // 如果有 _wx_tpl 处理一下
  if (pageUrl.params._wx_tpl) {
    pageUrl.params._wx_tpl = pageUrl.params._wx_tpl.replace(/\/\w+\.weex\.js/ig, '/' + pageName + '.weex.js');
  }

  // 如果没有协议头，要加上，否则 Native 下会降级到 Web
  if (!pageUrl.protocol) {
    pageUrl.protocol = 'http:';
  }

  // 附加参数
  if (params) {
    for (var key in params) {
      pageUrl.params[key] = params[key];
    }
  }

  // 去除参数
  if (removeParams && removeParams.length) {
    for (var i = 0; i < removeParams.length; i += 1) {
      var _key = removeParams[i];
      delete pageUrl.params[_key];
    }
  }

  // 额外逻辑
  // 某些页面，进入时要隐藏 navibar
  if (['shop', 'trailer', 'gallery', 'detail', 'sellerbrand'].indexOf(pageName) > -1) {
    pageUrl.params.wx_navbar_hidden = 'true';
  }

  return pageUrl.toString();
};

// 到指定的页面
var gotoPage = exports.gotoPage = function gotoPage(options) {
  var url = options.url || getPageUrl(options);
  navigator.push({ url: url, animated: true }, noop);
};

function isEmptyObj(obj) {
  for (var v in obj) {
    return false;
  }
  return true;
}

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(3)
)

/* script */
__vue_exports__ = __webpack_require__(4)

/* template */
var __vue_template__ = __webpack_require__(5)
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
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/components/go-back.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-d67b8268"
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
/* 3 */
/***/ (function(module, exports) {

module.exports = {
  "go-back": {
    "width": "64",
    "height": "64",
    "alignItems": "center",
    "justifyContent": "center"
  },
  "i-back": {
    "width": "48",
    "height": "48"
  }
}

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _utils = __webpack_require__(1);

var _cdnurl = __webpack_require__(0);

//
//
//
//
//
//

var navigator = weex.requireModule('navigator');

exports.default = {
  props: [],
  data: function data() {
    return {
      iNavBack$png: _cdnurl.iNavBack$png,
      NavBackIcon: _cdnurl.NavBackIcon
    };
  },

  methods: {
    onGoBack: function onGoBack(event) {
      var options = {
        animated: true // 关闭页面时使用动画效果
      };
      navigator.pop(options, function (result) {});
    }
  }
};

/***/ }),
/* 5 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["go-back"],
    on: {
      "click": _vm.onGoBack
    }
  }, [_c('image', {
    staticClass: ["i-back"],
    attrs: {
      "src": _vm.NavBackIcon
    }
  })])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(7)
)

/* script */
__vue_exports__ = __webpack_require__(8)

/* template */
var __vue_template__ = __webpack_require__(9)
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
/* 7 */
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
/* 8 */
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
/* 9 */
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
/* 10 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(11)
)

/* script */
__vue_exports__ = __webpack_require__(12)

/* template */
var __vue_template__ = __webpack_require__(13)
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
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/components/index-list-item.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-fa96bb72"
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
/* 11 */
/***/ (function(module, exports) {

module.exports = {
  "item": {
    "alignItems": "center",
    "width": "750",
    "height": "120",
    "borderBottomColor": "#000000",
    "borderBottomStyle": "solid",
    "borderBottomWidth": "1",
    "marginLeft": "15"
  },
  "link": {
    "flexDirection": "row",
    "alignItems": "center",
    "width": "750",
    "height": "120"
  },
  "town-image": {
    "marginLeft": "5",
    "width": "140",
    "height": "100"
  },
  "town-title": {
    "color": "#000000",
    "fontSize": "28",
    "fontWeight": "bold",
    "marginLeft": "30"
  },
  "sub-info": {
    "position": "absolute",
    "right": "120"
  },
  "sub-title": {
    "color": "#000000",
    "fontSize": "24"
  },
  "sub-distance": {
    "color": "#000000",
    "fontSize": "20",
    "textAlign": "right",
    "marginTop": "4"
  },
  "arrow": {
    "position": "absolute",
    "right": "40",
    "width": "20",
    "height": "40"
  }
}

/***/ }),
/* 12 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _cdnurl = __webpack_require__(0);

var modal = weex.requireModule('modal'); //
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
//
//
//
//

exports.default = {
  props: ['column'],
  data: function data() {
    return {
      iDetailArrow$png: _cdnurl.iDetailArrow$png,
      pictureUrl: 'https://gd2.alicdn.com/bao/uploaded/i2/T14H1LFwBcXXXXXXXX_!!0-item_pic.jpg'
    };
  },
  methods: {
    jump: function jump() {
      modal.toast({
        message: this.column,
        duration: 1
      });
      // navigator.push({
      //       url: 'http://192.168.31.62:8091/dist/town.js',
      //       animated: "true"
      //     })
    }
  }
};

/***/ }),
/* 13 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["item"],
    on: {
      "click": _vm.jump
    }
  }, [_c('div', {
    staticClass: ["link"]
  }, [_c('image', {
    staticClass: ["town-image"],
    attrs: {
      "src": _vm.column.photo
    }
  }), _c('text', {
    staticClass: ["town-title"]
  }, [_vm._v(_vm._s(_vm.column.columnName))]), _c('div', {
    staticClass: ["sub-info"]
  }, [_c('text', {
    staticClass: ["sub-title"]
  }, [_vm._v(_vm._s(_vm.column.subTitle))]), _c('text', {
    staticClass: ["sub-distance"]
  }, [_vm._v(_vm._s(_vm.column.subDesc))])]), _c('image', {
    staticClass: ["arrow"],
    attrs: {
      "src": _vm.iDetailArrow$png
    }
  })])])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ }),
/* 14 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(15)
)

/* script */
__vue_exports__ = __webpack_require__(16)

/* template */
var __vue_template__ = __webpack_require__(17)
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
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/components/navbar.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-688b5e20"
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
/* 15 */
/***/ (function(module, exports) {

module.exports = {
  "navbar": {
    "position": "relative",
    "height": "98",
    "width": "750",
    "flexDirection": "row",
    "paddingTop": "22",
    "paddingBottom": "12",
    "alignItems": "center",
    "justifyContent": "center"
  },
  "navbar-common": {
    "backgroundColor": "#FFFFFF",
    "borderBottomWidth": "1",
    "borderBottomStyle": "solid",
    "borderBottomColor": "rgba(0,0,0,0.1)"
  },
  "navbar-higher": {
    "height": "128",
    "paddingTop": "54"
  },
  "left-content": {
    "position": "absolute",
    "left": "20"
  }
}

/***/ }),
/* 16 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _goBack = __webpack_require__(2);

var _goBack2 = _interopRequireDefault(_goBack);

var _utils = __webpack_require__(1);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

//
//
//
//
//
//

exports.default = {
  components: {
    GoBack: _goBack2.default
  },
  props: ['pageFrom', // 页面来源
  'showGoBack' // 显示返回按钮
  ],
  data: function data() {
    return {
      isNewAppInIOS: _utils.platform === 'ios'
    };
  },

  computed: {},
  methods: {
    goBack: function goBack(e) {
      _goBack2.default.methods.goBack(e);
    }
  },
  created: function created() {}
};

/***/ }),
/* 17 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    class: ['navbar', _vm.isNewAppInIOS ? 'navbar-higher' : '', 'navbar-common']
  }, [_c('go-back', {
    staticClass: ["left-content"]
  }), _c('text', {
    staticClass: ["sub-title"]
  }, [_vm._v("凤凰描述")])], 1)
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ }),
/* 18 */,
/* 19 */,
/* 20 */,
/* 21 */,
/* 22 */,
/* 23 */,
/* 24 */,
/* 25 */,
/* 26 */,
/* 27 */,
/* 28 */,
/* 29 */,
/* 30 */,
/* 31 */,
/* 32 */,
/* 33 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _index = __webpack_require__(34);

var _index2 = _interopRequireDefault(_index);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_index2.default.el = '#root';
new Vue(_index2.default);

/***/ }),
/* 34 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(35)
)

/* script */
__vue_exports__ = __webpack_require__(36)

/* template */
var __vue_template__ = __webpack_require__(37)
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
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/index.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-2964abc9"
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
/* 35 */
/***/ (function(module, exports) {

module.exports = {
  "wrapper": {
    "justifyContent": "center",
    "alignItems": "center"
  },
  "list": {
    "position": "absolute",
    "top": 64,
    "right": 0,
    "bottom": 0,
    "left": 0
  },
  "navbar-wrapper": {
    "width": "750",
    "position": "absolute",
    "top": "0",
    "left": "0",
    "right": "0"
  }
}

/***/ }),
/* 36 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _indexSlider = __webpack_require__(6);

var _indexSlider2 = _interopRequireDefault(_indexSlider);

var _indexListItem = __webpack_require__(10);

var _indexListItem2 = _interopRequireDefault(_indexListItem);

var _navbar = __webpack_require__(14);

var _navbar2 = _interopRequireDefault(_navbar);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var modal = weex.requireModule('modal'); //
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

var navigator = weex.requireModule('navigator');
var stream = weex.requireModule('stream') || {};

exports.default = {
  name: 'App',
  components: {
    indexSlider: _indexSlider2.default,
    indexListItem: _indexListItem2.default,
    navbar: _navbar2.default
  },
  data: function data() {
    return {
      items: [{ "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }, { "columnName": "cxcxc" }]
    };
  },

  created: function created() {
    var self = this;
    stream.fetch({
      method: 'GET',
      url: "http://192.168.31.130:8080/columns/list?_search=false&nd=1560596254381&limit=10&page=1&sidx=priority&sord=asc&countyId=1",
      type: 'json'
    }, function (ret) {
      if (ret.data.resultCode == 200) {
        self.items = self.items.concat(ret.data.data.list);
        self.items.forEach(function (element) {
          element.photo = "http://192.168.31.130:8080/files/JS_FW_1_1_b1.PNG";
        });
      } else {
        modal.toast({
          message: "服务器错误",
          duration: 3
        });
      }
    });
  },
  methods: {
    jumpTown: function jumpTown() {
      modal.toast({
        message: 'This is a toast',
        duration: 1
      });

      // navigator.push({
      //       url: 'http://192.168.31.62:8091/dist/town.js',
      //       animated: "true"
      //     })
    }
  }
};

/***/ }),
/* 37 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["wrapper"]
  }, [_c('list', {
    staticClass: ["list"],
    attrs: {
      "showScrollbar": "false"
    }
  }, [_c('cell', {
    appendAsTree: true,
    attrs: {
      "append": "tree"
    }
  }, [_c('indexSlider')], 1), _vm._l((_vm.items), function(column) {
    return _c('cell', {
      key: column.id,
      appendAsTree: true,
      attrs: {
        "append": "tree"
      }
    }, [_c('indexListItem', {
      attrs: {
        "column": column
      }
    })], 1)
  })], 2), _c('div', {
    staticClass: ["navbar-wrapper"]
  }, [_c('navbar')], 1)])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ })
/******/ ]);