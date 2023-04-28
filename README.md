# docker-mvnd
apache maven mvnd 的镜像

# 生成镜像
```
docker build -t mailbyms/mvnd:0.9.0-jdk-8 .
```

# 注意事项
- 内置了 maven，自定义配置文件需要放到 ~/.m2 目录下
