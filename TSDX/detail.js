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
/******/ 	return __webpack_require__(__webpack_require__.s = 16);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */,
/* 1 */,
/* 2 */,
/* 3 */,
/* 4 */,
/* 5 */,
/* 6 */,
/* 7 */,
/* 8 */,
/* 9 */,
/* 10 */,
/* 11 */,
/* 12 */,
/* 13 */,
/* 14 */,
/* 15 */,
/* 16 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _detail = __webpack_require__(17);

var _detail2 = _interopRequireDefault(_detail);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_detail2.default.el = '#root';
new Vue(_detail2.default);

/***/ }),
/* 17 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(18)
)

/* script */
__vue_exports__ = __webpack_require__(19)

/* template */
var __vue_template__ = __webpack_require__(21)
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
__vue_options__.__file = "/Users/zwj/Develop-Project/TownWeex/src/detail.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-c8f8462c"
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
/* 18 */
/***/ (function(module, exports) {

module.exports = {
  "scroller": {
    "position": "absolute",
    "top": 0,
    "right": 30,
    "bottom": 0,
    "left": 30
  },
  "slider": {
    "height": "260",
    "width": "690"
  },
  "sub-image": {
    "width": "690",
    "height": "260"
  },
  "indicator": {
    "position": "absolute",
    "bottom": 0,
    "right": 0,
    "width": "690",
    "height": "40",
    "backgroundColor": "rgba(0,0,0,0)",
    "itemColor": "#DDDDDD",
    "itemSelectedColor": "rgb(0,180,255)",
    "itemSize": "12"
  },
  "sub-author": {
    "height": "80",
    "justifyContent": "center"
  },
  "author": {
    "textAlign": "right",
    "fontSize": "26",
    "fontWeight": "bold",
    "color": "rgb(110,56,20)"
  },
  "article": {
    "paddingTop": "20",
    "paddingBottom": "30"
  },
  "paragraph": {
    "lineHeight": "50",
    "color": "#000000",
    "fontSize": "30"
  }
}

/***/ }),
/* 19 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _mock = __webpack_require__(20);

exports.default = {
  data: function data() {
    return {
      paragraph: _mock.paragraph,
      posts: ['1', '2', '2'],
      pictureUrl: 'https://gd2.alicdn.com/bao/uploaded/i2/T14H1LFwBcXXXXXXXX_!!0-item_pic.jpg'
    };
  },

  created: function created() {},
  methods: {}
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

/***/ }),
/* 20 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var paragraph = exports.paragraph = "地形地貌 境内大部为山地丘陵，地势为西高东低、南低北高，地面高程一般在海拔450米，最高点卢棚寨海拔 851米，最低处225米，土壤多属板页岩和石灰岩发育而成的红壤、黄壤和黄棕壤等 气候 属温带季风区的大陆性气候，同时又属麻阳盆地气候，其特点是四季分明，雨热同季，光照充足，无霜期长。春季湿润多雨，夏季雨量集中于5 - 6月，7 - 9月进入三伏气候，晴热少雨，秋季温和凉爽，冬季湿冷少雪。多年平均气温 25摄氏度，1月平均气温12摄氏度，7月平均气温 36摄氏度。矿藏及其他自然资源 境内有丰富的矾、重晶石矿、钼矿产资源。集中分布在柑子坪、蒲罗坪一带。自然灾害 主要自然灾害有旱涝、山体滑坡、霜冻等。旱涝灾害最为常见，最严重一次发生在1995年。农业 耕地面积9500多亩，人均0.83亩，土地总面积36297.62亩，经济林面积约13888亩，森林覆盖率达60 %。 以种植水稻、蔬菜、油菜为主。2011年种植水稻面积9062亩，生产水稻108.75万斤，油菜种植4568亩，生产油菜913600斤。主要经济作物有高山刺葡萄、金秋梨、猕猴桃、晒红烟等。畜牧业以猪、牛、羊、家禽为主。2011年生猪饲养量1650头，年末存栏850头；羊饲养量1033只，年末存栏825只；牛饲养量396头，年末存栏321头，家禽饲养量26136羽。工业 以木材加工、矿产开发为主。文化艺术 2011年末有乡文化站、广播电视站各1处，有村级活动场所7处，农家书屋9个，藏书15000余册，各类文化专业户7户，正在申请国家级文物单位1处。教育 2011年末有幼儿园2所，其中中心幼儿园1所，私立幼儿园1所，在园幼儿308人；小学4所，其中中心小学1所，村小3所，中心小学现有专任教师30人，在校学生691人；中学1所，现有专任教师40人，在校学生571人。适龄儿童入学率、小升初升学率均为100 %，小学年辍学率为0，初中年辍学率1.49 %。医疗卫生 2011年末有各级医疗卫生机构15个，门诊部（所）15个，有床位30张。专业卫生人员18名，其中执业医师6人，执业助理医师2人，注册护士4人。全乡新型农村合作医疗参保率达95 % 以上。体育 2011年末有学校体育场2个，篮球场10个。广播电视 现有有线电视用户1200户，入户率70 %。社会保障 农村最低生活保障户数283户，人数569人。国家抚恤、补助各类优抚对象63人，敬老院1家，床位48张，收养农村五保人员48人。参加新型农村养老保险人10945，参保率100 %。交通运输 境内有高村—拖冲乡道、锦尧公路2条公路交汇。邮政电信 2011年末有邮政所1处，代办所3处，电信企业1家，服务网店4个，固定电话用户965户，移动电话用户5623户，互联网用户268户。公共交通 2006年建成尧市乡客运站，日发客运汽车28班次，日均容量500余人次。给排水 2011年开始建设尧市乡自来水厂，预计今年年底前投入使用。供电 2002年尧市乡变电站、供电站建成。园林绿化 2011年末乡驻地有花坛4个，绿化面积100多平方米";

/***/ }),
/* 21 */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', [_c('scroller', {
    staticClass: ["scroller"],
    attrs: {
      "showScrollbar": "false"
    }
  }, [_vm._m(0), _c('slider', {
    staticClass: ["slider"],
    attrs: {
      "autoPlay": "false"
    }
  }, [_vm._l((_vm.posts), function(post) {
    return _c('div', {
      key: post
    }, [_c('image', {
      staticClass: ["sub-image"],
      attrs: {
        "src": _vm.pictureUrl,
        "resize": "stretch"
      }
    })])
  }), _c('indicator', {
    staticClass: ["indicator"]
  })], 2), _c('div', {
    staticClass: ["article"]
  }, [_c('div', {
    staticClass: ["main"]
  }, [_c('text', {
    staticClass: ["paragraph"]
  }, [_vm._v(_vm._s(_vm.paragraph))]), _c('text', {
    staticClass: ["paragraph"]
  }, [_vm._v(_vm._s(_vm.paragraph))])])])])])
},staticRenderFns: [function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('div', {
    staticClass: ["sub-author"]
  }, [_c('text', {
    staticClass: ["author"]
  }, [_vm._v("作者--县委网站")])])
}]}
module.exports.render._withStripped = true

/***/ })
/******/ ]);