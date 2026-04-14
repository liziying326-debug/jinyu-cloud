FROM node:20-alpine

WORKDIR /app

# 从根目录安装依赖
COPY package*.json ./
RUN npm install --production

# 复制 backend 代码
COPY backend/ .

# 创建数据目录
RUN mkdir -p /app/data /app/uploads

EXPOSE 3002

CMD ["node", "server.js"]
