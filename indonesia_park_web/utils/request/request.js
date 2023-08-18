// 开发接口

// #ifdef MP-WEIXIN
let baseURL = 'http://10.40.10.230:8080/';
// #endif
// #ifdef H5
let baseURL = '/api/';
// #endif

async function request(url, params, method,token) {
	return new Promise(resolve => {
	  uni.request({
	    url: baseURL + url,
	    header: {
	      'Content-Type': 'application/json',
				 // "Content-Type": "application/x-www-form-urlencoded"
	      'X-Requested-With': 'XMLHttpRequest',
				token
	    },
	    method: method,
	    data: params,
	    success: res => {
				resolve(res.data);
	    },
	    fail (err) {
	      resolve(err)
	    }
	  })
	})// return
}

export default request