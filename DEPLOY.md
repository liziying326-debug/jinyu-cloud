# 金玉广告物料网站 - 云端部署指南

## 架构
- **前端**: Vercel (静态页面)
- **后端**: Render (Express API)
- **数据**: Render 磁盘持久化

---

## 第一步：部署后端到 Render

1. 访问 https://render.com
2. 注册/登录 GitHub 账号
3. 点击 "New Web Service"
4. 上传 `backend` 文件夹（或用 Git）
5. 配置：
   - **Runtime**: Docker
   - **Plan**: Free
   - **Port**: 3002
6. 点击部署，等待完成
7. 记录域名：`https://xxx.onrender.com`

---

## 第二步：配置前端

1. 打开 `frontend/api.js`
2. 修改第 7 行：
   ```js
   window.API_BACKEND_URL = 'https://xxx.onrender.com';
   ```
3. 打开 `frontend/vercel.json`
4. 把所有 `your-backend.onrender.com` 换成你的实际域名

---

## 第三步：部署前端到 Vercel

1. 访问 https://vercel.com
2. 注册/登录 GitHub 账号
3. 点击 "Add New Project"
4. 上传 `frontend` 文件夹
5. 点击部署，等待完成
6. 获得域名：`https://xxx.vercel.app`

---

## 访问地址

- **前台网站**: https://xxx.vercel.app
- **后台管理**: https://xxx.onrender.com
- **后台账号**: admin
- **后台密码**: admin123

---

## 注意事项

1. Render 免费版 15 分钟无访问会休眠，首次访问需等待唤醒
2. 数据保存在 Render 磁盘，重启不会丢失
3. 图片上传后保存在 Render，通过 Vercel 代理访问

---

## 搬到海外服务器

同样的 `backend` 和 `frontend` 目录，上传后：

```bash
# 后端
cd backend
npm install
npm start

# 前端用 Nginx 代理，或直接用 Node 运行
cd frontend
npx serve -s . -l 80
```
