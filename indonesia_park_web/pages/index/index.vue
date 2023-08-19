<template>
	<view class="content">
		<view class="list-container">
			<view class="item-box" v-for="(park, index) in parkList" :key="index" @click="parkClick(park)">
				<!-- :style="{backgroundImage: 'url(' + park.image + ')', backgroundSize:'100% auto', backgroundPosition: 'center center', backgroundRepeat: 'no-repeat'}" -->
				<text class="item-text">{{ park.name }}</text>
				<image class="img-box" :src="park.image"></image>
				<!-- <view class="gradient-bg"></view> -->
				<!-- <image :src="park.image" mode="heightFix"></image> -->
				
			</view>
			<button class="more" @click="visible = true">更多</button>
			<!-- Add more item-box elements here -->
		</view>
		<tips-model v-model:visible="visible"></tips-model>
	</view>
</template>

<script>
	import {
		getParkList
	} from '@/utils/request/apiRequest.js'
	export default {
		data() {
			return {
				title: 'Hello',
				parkList: [],
				visible: false
			}
		},
		onLoad() {},
		onReady() {
			getParkList().then(res => {
				this.parkList = res;
			})
		},
		methods: {
			parkClick(park) {
				uni.setStorageSync('curPark', park);
				uni.navigateTo({
					url: `/pages/parkContent/index?id=${park.id}&parkName=${park.name}`
				});
			}
		}
	}
</script>

<style lang="less">
	@item-box-size: 100upx;

	.list-container {
		background-color: white;
		padding: 20upx;
		min-height: 100%;
		.more {
			margin-top: 20upx;
		}
	}

	.item-box {
		height: @item-box-size;
		background-color: #fff;
		box-shadow: 0px 0.5upx 4upx rgba(0, 0, 0, 0.1);
		padding: 30upx;
		position: relative;
		overflow: hidden;
		display: flex;
		border-radius: 40upx;
		margin-top: 20upx;
		font-weight: 500;
		display: flex;
		align-items: center;
		justify-content: space-between;
		.img-box {
			width: 200upx;
			border-radius: 30upx;
			height: 100%;
			margin-left: 20upx;
		}
		
		// .gradient-bg {
		// 	background-color: rgba(0, 0, 0, 0.8);
		// 	position: absolute;
		// 	top: 0;
		// 	left: 0;
		// 	width: 100%;
		// 	height: 100%;
		// }
		.item-text {
			// color: #fff;
			z-index: 1;
			width: 60%;
			flex-wrap: wrap;
			display: flex;
		}
	}
</style>