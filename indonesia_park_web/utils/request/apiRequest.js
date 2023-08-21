// 统一管理接口
import {apiGet,apiPost,apiPut,apiDelete} from './http.js'
let token = uni.getStorageSync('token')
let userInfo = uni.getStorageSync('userInfo')
const game_id = userInfo.id

/**
 * 获取园区列表
 * @params 
 * */ 
 export function getParkList() {
	 return apiGet('park/list',{},token).then(res => {
		 if(res.code === 0) {
			 return false
		 }
		 if(res.code === 1) {
			 return res.data
		 }
	 })
 }
/**
 * 获取分类和标签
 */
 export function getCategoryWithTags() {
	 return apiGet('tags/getCategoriesWithTags',{},token).then(res => {
		 if(res.code === 0) {
			 return false
		 }
		 if(res.code === 1) {
			 return res.data
		 }
	 })
 }
 /**
  * 获取内容提示
  */
 export function getContentTips() {
	 return apiGet('park/contentTips',{},token).then(res => {
		 if(res.code === 0) {
			 return false
		 }
		 if(res.code === 1) {
			 return res.data
		 }
	 })
 }
 /**
   * 添加反馈内容
   * */ 
 export function addFeedback(params) {
 	 return apiPost('addFeedback',params,token).then(res => {
 		 if(res.code === 0) {
 		 	return false
 		 }
 		 if(res.code === 1) {
 		 	return true
 		 }
 	 })
 }
 
 /**
  * 获取文章内容
  */
 export function getArticle(params) {
 	 return apiGet('getArticle',params,token).then(res => {
 		 if(res.code === 0) {
 			 return false
 		 }
 		 if(res.code === 1) {
 			 return res.data
 		 }
 	 })
 }
 
 
// =======个人信息========
/**
 * 获取个人信息
 * @params token 验证
 * */ 
 export function getUserInfo() {
	 return apiGet('user/info',{},token).then(res => {
		 if(res.code === 401) {
			 return false
		 }
		 if(res.code === 200) {
			 uni.setStorageSync('userInfo',res.data)
			 return res.data
		 }
	 })
 }
 

/**
 * 登录
 * @params phone 电话号码
 * @params code  验证码
 * */
 export function userLogin(params) {
 	return apiGet('login',params).then(res => {
		if(res&&res.token) {
			return res
		}
 	})
 }
 
 /**
  * 登出
  * @params token 用户验证
  * */
 export function userLogout() {
	 return apiGet('user/logout',{},token).then(res => {
		 if(res&&res.code&&res.code=== 200) {
				uni.removeStorageSync('token')
				uni.removeStorageSync('userInfo')
				uni.removeStorageSync('loginType')
				return true
		 }
	 })
 }
 

 /**
   * 修改用户信息
   * */ 
 export function changeUserInfo(params) {
 	 return apiPost('user/changeUserInfo',params,token).then(res => {
		 console.log(res)
 		 if(res&&res.code&&~~res.code === 200) {
			 // 更新用户数据
				getUserInfo(token)
 				return true
 		 }else if(res&&res.code&&~~res.code === 500) {
			 return false
		}
 	 })
 }
 
 
 

// =======上传========
function uploadFiles(fileSrc,fileName,resolve) {
	let ossUrl = 'https://xbaoimage.oss-cn-beijing.aliyuncs.com'
	let ossPolicy = 'eyJleHBpcmF0aW9uIjoiMjAyMC0wNC0xMFQxMjowMDowMC4wMDBaIiwiY29uZGl0aW9ucyI6W1siY29udGVudC1sZW5ndGgtcmFuZ2UiLDAsMTA0ODU3NjAwMF1dfQ=='
	let oSSAccessKeyId = 'LTAI4FrF4Y5yB3N94vNUFG25'
	let ossSignature = '91tSA9KIySWsj9peJN5ZQLC5BxY='

	uni.uploadFile({
		url: ossUrl,
		filePath: fileSrc,
		fileType: 'image',
		name: 'file',
		formData:{
			name: fileSrc,
			'key' : "${filename}",
			'policy': ossPolicy, 
			'success_action_status' : '200', 
			'OSSAccessKeyId': oSSAccessKeyId,
			//让服务端返回200,不然，默认会返回204
			'signature': ossSignature,
		},
		success: (res) => {
			console.log(fileName)
			console.log(res)
			if(res&&res.statusCode === 403){
				return false
			}else {
				resolve({
					imageSrc: fileSrc,
					ossUrl: ossUrl + '/' + fileName
				})
			}
		}
	});
						
}
 /**
  * 上传文件
  * */
	export function upload(count=1,file = 'nofile',fileSrc,fileName,tips='加载中') {
		return new Promise((resolve,reject) => {
			if(file === 'nofile') {
				uni.chooseImage({
						count: count,
						sizeType: ['compressed'],
						sourceType: ['album'],
						success: (res) => {
							// 提示状态
							uni.showToast({
								title:tips,
								icon: 'loading',
								mask: true,
								duration: 60*1000
							})
							let imageSrc = res.tempFilePaths[0]
							let imageName = res.tempFiles[0].name
							uploadFiles(imageSrc,imageName,resolve)
						}
					})
			}else {
				uploadFiles(fileSrc,fileName,resolve)
			}
		})
	}
	