import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
    plugins: [uni()],
    server:{
        proxy:{
            '/api':{
                target: "http://10.40.10.230:8080/",
                changeOrigin: true,
                rewrite:(path)=>{
                    return path.replace(/^\/api/,'')
                }
            }
        }
    }
});
