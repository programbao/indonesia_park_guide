<template>
	<view class="article-details">
		<view class="content" v-if="articleContent">
			<mp-html :content="articleContent" />
		</view>
		<view class="empty" v-else>
			<view class="txt">
				暂无内容
			</view>
			<button type="default" @click="visible = true">补充</button>
		</view>
		<tips-model v-model:visible="visible"></tips-model>
		<float-panel
			:canSelect="true"
			@navIndexClick="visible = true"
		  />
	</view>
</template>

<script>
	import {
		getArticle
	} from '@/utils/request/apiRequest.js'
	export default {
		data() {
			return {
				curTag: {},
				curPark: {},
				visible: false,
				articleContent: null
			}
		},
		onLoad() {
			let curTag = uni.getStorageSync('curTag')
			let curPark = uni.getStorageSync('curPark')
			// 设置页面标题
			uni.setNavigationBarTitle({
				title: curTag.name
			})
			getArticle({ tagId: curTag.id, parkId: curPark.id }).then(res => {
				this.articleContent = res.contentHtml
			})
		},
		methods: {
			
		}
	}
</script>

<style scoped lang="less">
.article-details {
	padding: 20upx;
	.empty {
		position: fixed;
		top: 0%;
		left: 0%;
		bottom: 0;
		right: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		.txt {
			margin-bottom: 20upx;
		}
	}
	.content {
		padding: 20upx;
	}
}
</style>
