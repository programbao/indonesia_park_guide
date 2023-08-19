<template>
	<view class="cu-dialog" v-show="modalVisible">
		<view class="content">
			<view class="cu-bar">
				<view class="title">补充/修正</view>
				<view class="close" @click="handleClose">
					<text class="i carbon:close"></text>
				</view>
			</view>
			<mp-html :content="contentTips" />
			<view class="uni-textarea">
				<textarea v-model="fbContent" />
			</view>
			<button type="primary" @click="submit">提交</button>
		</view>
	</view>
</template>

<script>
	import {
		getContentTips
	} from '@/utils/request/apiRequest.js'

	import {
		ref,
		watch,
		onMounted
	} from 'vue';
	export default {
		props: {
			data: String,
			visible: Boolean
		},
		emits: ['update:visible'],
		setup(props, ctx) {
			const modalVisible = ref(false);
			const contentTips = ref('');
			const fbContent = ref('');
			//弹窗关闭
			const handleClose = () => {
				modalVisible.value = false;
				ctx.emit('update:visible', false);
			};

			watch(
				() => props.visible,
				val => {
					modalVisible.value = val;
				}
			);
			onMounted(() => {
				getContentTips().then(res => {
					contentTips.value = res
				})
			});
			return {
				handleClose,
				modalVisible,
				contentTips,
				fbContent
			};
		}
	}
</script>

<style lang="less">
	.cu-dialog {
		position: fixed;
		top: 0;
		left: 0%;
		bottom: 0%;
		right: 0;
		background-color: rgba(0, 0, 0, 0.8);
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 3;

		.content {
			background-color: #fff;
			width: 80%;
			border-radius: 30upx;
			padding: 20upx;

			.cu-bar {
				height: 40upx;
				line-height: 40upx;
				text-align: center;
				position: relative;
				font-size: 30upx;
				font-weight: 500;
				font-size: 35upx;

				.close {
					position: absolute;
					width: 40upx;
					height: 40upx;
					right: 10upx;
					top: 0upx;
					font-size: 50upx;
				}
			}

			.uni-textarea {
				border: 1px solid #eee;
				margin: 20upx 0;
				border-radius: 10upx;

				textarea {
					width: 100%;
					// height: 100%;
					font-size: 40upx;
				}
			}
		}

	}
</style>