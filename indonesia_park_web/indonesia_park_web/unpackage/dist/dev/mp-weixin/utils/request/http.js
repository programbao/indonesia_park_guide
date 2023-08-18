"use strict";
const utils_request_request = require("./request.js");
function apiGet(url, params, token) {
  return utils_request_request.request(url, params, "GET", token);
}
exports.apiGet = apiGet;
