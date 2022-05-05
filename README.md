# 斜杠人生后端

### 项目介绍

本项目旨在打造一个学习技能、为有第二职业规划人士提供信息和资源的社区平台，帮助“斜杠青年”们实现个性化发展。并实现了登录注册、分版区发帖、评论回复、收藏点赞、内容搜索、观看学习视频、DAU统计等功能。

### 环境相关

jdk1.8、SpringBoot2.5、Mysql5.7、Redis4.0

### 部署流程

1. 将SQL文件导入数据库（测试数据库为Mysql5.7）

   

   ![](http://bmalimarkdown.oss-cn-beijing.aliyuncs.com/img/image-20220501220747757.png)


2. 具备pom.xml文件中的依赖库

3. 修改application.yaml文件中的mysql，redis配置

   - 更换Mysql的IP、用户名、密码
   
     ![](http://bmalimarkdown.oss-cn-beijing.aliyuncs.com/img/1.png)

   - 更换redis的IP、密码

     ![](http://bmalimarkdown.oss-cn-beijing.aliyuncs.com/img/2.png)

   - 可选：Druid监控页配置、阿里云OSS配置（用来保存图片）

![](http://bmalimarkdown.oss-cn-beijing.aliyuncs.com/img/2022-05-05193255.png)

### 使用相关

部署完成后，可于http://{{ip号}}:{{端口号}}/swagger-ui.html查看、测试接口文档信息

如：http://101.43.198.16:10000/swagger-ui.html



