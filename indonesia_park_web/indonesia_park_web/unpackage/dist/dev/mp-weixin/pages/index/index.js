"use strict";
const common_vendor = require("../../common/vendor.js");
const utils_request_apiRequest = require("../../utils/request/apiRequest.js");
require("../../utils/request/http.js");
require("../../utils/request/request.js");
const _sfc_main = {
  data() {
    return {
      title: "Hello",
      parkList: []
    };
  },
  onLoad() {
  },
  onReady() {
    utils_request_apiRequest.getParkList().then((res) => {
      this.parkList = res;
    });
  },
  methods: {
    parkClick(park) {
      common_vendor.index.navigateTo({
        url: `/pages/parkContent/index?id=${park.id}&parkName=${park.name}`
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.f($data.parkList, (park, index, i0) => {
      return {
        a: common_vendor.t(park.name),
        b: park.image,
        c: index,
        d: common_vendor.o(($event) => $options.parkClick(park), index)
      };
    })
  };
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "D:/Users/Desktop/indonesia_park_web/indonesia_park_web/pages/index/index.vue"]]);
wx.createPage(MiniProgramPage);
