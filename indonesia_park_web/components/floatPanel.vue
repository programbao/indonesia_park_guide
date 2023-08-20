<template>
	<view class="float-panel" :style="{
      transition: isDragging ? 'none' : 'transform 0.2s',
      top: top + 'px',
      right: right + 'px',
      opacity: isDragging || !canSelect ? 0.5 : 1
    }" ref="element" id="element" @touchstart="dragStart" @touchmove="drag" @touchend="dragEnd">
		<view v-for="(itemBtn, index) in floatBtns" @click="itemBtn.events.click" class="item-box">
			<text :class="'i ' + itemBtn.iconClassName"></text>
		</view>
		<!-- <view
      v-for="(itemBtn, index) in floatBtns"
      v-on="itemBtn.events"
      :key="index"
	  class="item-box"
    >
      <text :class="'i ' + itemBtn.iconClassName"></text>
    </view> -->
	</view>
</template>
<script setup>
	import {
		ref,
		onMounted,
		watch,
		getCurrentInstance
	} from 'vue'
	import {
		onLoad,
		onShow
	} from "@dcloudio/uni-app";
	const props = defineProps({
		prevAndNextStatusDict: {},
		canSelect: false,
		currentViewPortHeight: 0
	})
	const emit = defineEmits(['navIndexClick'])
	const floatBtns = [
		// {
		//   name: 'prev',
		//   iconClassName: 'icon-shangyiti',
		//   guideTxt: '跳转上一站',
		//   events: {
		//     click: (e) => {
		//       e.stopPropagation()
		//       emit('navIndexClick', 'prev')
		//     }
		//   }
		// },
		{
			name: '',
			iconClassName: 'carbon-edit',
			guideTxt: '补充/修正',
			events: {
				click: (e) => {
					e.stopPropagation()
					emit('navIndexClick')
				}
			}
		},
		// {
		//   name: 'next',
		//   iconClassName: 'icon-xiayiti',
		//   guideTxt: '跳转下一站点',
		//   events: {
		//     click: (e) => {
		//       e.stopPropagation()
		//       emit('navIndexClick', 'next')
		//     }
		//   }
		// }
	]
	let startY = 0
	let startTop = 0
	const top = ref(0)
	const right = 8
	let windowHeight = uni.getWindowInfo().windowHeight
	const isDragging = ref(false)
	let dragTimer = null
	const element = ref(null)
	// 获取组件实例
	const instance = getCurrentInstance();
	const query = uni.createSelectorQuery().in(instance);

	onMounted((option) => {
		// windowHeight = window.innerHeight;
		top.value = windowHeight * 0.7123
		// const {proxy} = getCurrentInstance()
		// console.log(proxy, '2384092834')
		// console.log(getCurrentInstance(), 'getCurrentInstance()')
		// console.log(proxy.$refs)
		// console.log(proxy.$refs['element'])
	});
	// watch(() => props.currentViewPortHeight, (val) => {
	// 	if (val) {
	// 		windowHeight = val
	// 		top.value = windowHeight * 0.6123
	// 	}
	// })
	const dragStart = (event) => {
		startY = event.touches[0].pageY
		startTop = top.value
		clearTimeout(dragTimer)
		dragTimer = setTimeout(() => {
			isDragging.value = true
		}, 100)
	}
	let eleClientHeight = 0
	const drag = (event) => {
		clearTimeout(dragTimer)
		event.preventDefault()
		if (isDragging.value) {
			const currentY = event.touches[0].pageY
			const diffY = currentY - startY
			let newTop = startTop + diffY
			query
				.select("#element").boundingClientRect(res => {
					eleClientHeight = parseInt(res.height)
					if (newTop < 40) {
						newTop = 40
					} else if (newTop > windowHeight - eleClientHeight) {
						newTop = windowHeight - eleClientHeight
					}
					top.value = newTop
				}).exec();
		}
	}
	const dragEnd = () => {
		clearTimeout(dragTimer)
		isDragging.value = false
	}
</script>
<style scoped lang="less">
	.float-panel {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		position: fixed;
		bottom: 21.39%;
		right: 16upx;
		width: 80upx;
		// height: 150px;
		height: 80upx;
		// background: #031117;
		background-color: #fff;
		box-shadow: 0px 1px 8px 0px rgba(175, 184, 193, 0.5);
		border-radius: 100%;
		z-index: 1;

		>.item-box {
			flex: 1;
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
			border-radius: 100%;
			// color: #01e7ff;
			// color: #fff;
			.survey-iconfont {
				font-size: 50upx;
			}

			.prev-diabled,
			.next-diabled {
				opacity: 0.2;
			}

			.use-prompt {
				position: absolute;
				display: flex;
				right: 100%;
				white-space: nowrap;
				margin-right: -6px;

				.guide-txt {
					margin-right: 18px;
					font-size: 14px;
					font-weight: 500;
					color: #272525;
					line-height: 20px;
				}

				.guide-line {
					width: 55px;
					display: flex;
					justify-content: center;
					align-items: center;

					.line {
						width: 39px;
						height: 1px;
						background-color: #332d2d;
					}

					.bot {
						border-radius: 50%;
						background-color: #201c1c;
						width: 10px;
						height: 10px;
						display: flex;
						justify-content: center;
						align-items: center;

						&::after {
							content: '';
							width: 4px;
							height: 4px;
							background-color: #01e7ff;
							border-radius: 50%;
						}
					}
				}
			}
		}
	}
</style>