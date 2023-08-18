"use strict";
const common_vendor = require("../../common/vendor.js");
let baseURL = "http://10.40.10.230:8080/";
async function request(url, params, method, token) {
  return new Promise((resolve) => {
    common_vendor.index.request({
      url: baseURL + url,
      header: {
        "Content-Type": "application/json",
        // "Content-Type": "application/x-www-form-urlencoded"
        "X-Requested-With": "XMLHttpRequest",
        token
      },
      method,
      data: params,
      success: (res) => {
        resolve(res.data);
      },
      fail(err) {
        resolve(err);
      }
    });
  });
}
exports.request = request;
