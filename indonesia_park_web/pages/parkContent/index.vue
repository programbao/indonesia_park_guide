<template>
	<view class="park-content">
		<item-content :color="colors[index]" :park="park" :item-data="item"
			v-for="(item, index) in items"></item-content>
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
				items: [],
				park: {},
				colors: [
					"#a8b7fe",
					"#f7ced6",
					"#a8daf7",
					"#ecbaad",
					"#FF5733",
					"#FF7F33",
					"#FFA733",
					"#FFD133",
					"#FFE433",
					"#FFFC33",
					"#E6FF33",
					"#C0FF33",
					"#9BFF33",
					"#75FF33",
					"#33FF38",
					"#33FF61",
					"#33FF8A",
					"#33FFB4",
					"#33FFDD",
					"#33F3FF",
					"#33D0FF",
					"#33AFFF",
					"#338CFF",
					"#3363FF",
					"#333BFF",
					"#6033FF",
					"#8A33FF",
					"#B433FF",
					"#DD33FF",
					"#FF33FB",
					"#FF33D1",
					"#FF33A7",
					"#FF337E",
					"#FF3354",
				]
			};
		},
		onLoad(option) {
			this.park = option
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
		background-color: #f9f8fe;
	}
</style>