"use strict";
const common_vendor = require("../../common/vendor.js");
const utils_request_http = require("./http.js");
let token = common_vendor.index.getStorageSync("token");
let userInfo = common_vendor.index.getStorageSync("userInfo");
userInfo.id;
function getParkList() {
  return utils_request_http.apiGet("park/list", {}, token).then((res) => {
    if (res.code === 0) {
      return false;
    }
    if (res.code === 1) {
      return res.data;
    }
  });
}
exports.getParkList = getParkList;
