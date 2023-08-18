<template>
	<view class="item-content">
		<view class="title">
			{{ itemData.categoryName || '--' }}
		</view>
		<view class="tag-box">
			<view class="tab" v-for="tag in itemData.tags">
				<view class="image-box">
					<image :src="tag.image ? tag.image : '/static/tab-default.png'" mode=""></image>
				</view>
				<view class="tabName">{{ tag.name }}</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: ["itemData"],
		// props: {
		// 	itemData: {
		// 		type: Object,
		// 		default: () => { categoryName: '', tags: [] }
		// 	}
		// },
		data() {
			return {

			}
		},
		methods: {

		}
	}
</script>

<style lang="less">
	.item-content {
		background-color: #fff;
		border-radius: 20upx;
		margin-bottom: 30upx;

		.title {
			padding: 10upx 0;
			border-bottom: 1rpx solid #e8e8e8;
			text-align: center;
			font-size: 30upx;
			font-weight: 600;
		}

		.tag-box {
			display: grid;
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			grid-gap: 10px;
			justify-items: center;
			padding: 20upx 0 30upx;

			.tab {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				.image-box {
					width: 80upx;
					height: 80upx;
					display: flex;
					justify-content: center;
					align-items: center;
					image {
						width: 50upx;
						height: 50upx;
					}
				}
				
				.tabName {
					font-size: 25upx;
				}
			}


			// .tab:nth-child(4n) {
			// 	justify-self: end;
			// 	/* 靠右对齐 */
			// }

			// .tab:nth-child(4n + 1),
			// .tab:first-child {
			// 	justify-self: start;
			// 	/* 靠左对齐 */
			// }
		}
	}
</style>