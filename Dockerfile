FROM node:20-alpine

WORKDIR /app

# 从根目录安装依赖
COPY package*.json ./
RUN npm install --production

# 复制 backend 代码（保留目录结构）
COPY backend/ ./backend/

# 创建数据目录
RUN mkdir -p /app/backend/data /app/backend/uploads

EXPOSE 3002

WORKDIR /app/backend
CMD ["node", "server.js"]
