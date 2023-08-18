<template>
	<view class="park-content">
		<item-content :item-data="item" v-for="item in items"></item-content>
	</view>
</template>

<script>
	import ItemContent from './itemContent/index.vue'
	import {
		getCategoryWithTags
	} from '@/utils/request/apiRequest.js'
	export default {
		components: {
			ItemContent
		},
		data() {
			return {
				items: []
			};
		},
		onLoad(option) {
			// 设置页面标题
			uni.setNavigationBarTitle({
				title: option.parkName
			})
			getCategoryWithTags().then(res => {
				if (res) {
					this.items = res.filter(item => item.tags.length)
				}
			})
		}
	}
</script>

<style lang="less">
.park-content {
	padding: 30upx;
	min-height: 100%;
}
</style>
