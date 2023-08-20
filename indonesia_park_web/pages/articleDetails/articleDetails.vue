<template>
	<view class="article-details">
		article-details
		<tips-model v-model:visible="visible"></tips-model>
		<float-panel
			:canSelect="true"
			@navIndexClick="visible = true"
		  />
	</view>
</template>

<script>
	export default {
		data() {
			return {
				curTag: {},
				visible: false
			}
		},
		onLoad() {
			this.curTag = uni.getStorageSync('curTag')
			// 设置页面标题
			uni.setNavigationBarTitle({
				title: this.curTag.name
			})
		},
		methods: {
			
		}
	}
</script>

<style>
.article-details {
	padding: 20upx;
}
</style>
