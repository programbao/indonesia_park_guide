import App from './App'
// #ifndef VUE3
import Vue from 'vue'
// import tipsModel from '@/components/tipsModel.vue'
// Vue.component('tips-model',tipsModel)
import './uni.promisify.adaptor'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  ...App
})

app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
import tipsModel from './components/tipsModel.vue'
import floatPanel from './components/floatPanel.vue'

export function createApp() {
  const app = createSSRApp(App)
  app.component('tips-model',tipsModel)
  app.component('float-panel',floatPanel)
  return {
    app
  }
}
// #endif