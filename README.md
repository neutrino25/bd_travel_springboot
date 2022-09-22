
毕业设计项目，将ssm技术切换为springboot，使用内置的tomcat即可运行项目。

管理系统
- url: http://localhost:8080/managerLoginPage
- user: admin  password: 123

用户门户网站
- url: http://localhost:8080/user
- user: neutrino  password: 123

技术
- 后台：springboot+mybatis+mysql
- 前台：jsp+js+bootstrap
- 开发工具: idea

功能列表
- 管理端管理员用户可以管理景点、美食、门票、订单（用户取票）、用户（激活与禁用）；
- 门户网站用户/游客可以查看景点、美食、门票（购买）、订单查询、用户注册、用户登录、个人信息更新操作；

项目使用步骤
- 通过idea导入项目，配置maven、jdk;
- springboot整合jsp，需要在idea中配置webapp目录：
  file-projectStructure-modules-选中web,为它配置webResourceDirectories,即新增,指定项目中的webapp目录;
- 将sql脚本在本地数据库执行（建表语句以及插入数据的语句）;
- 修改application.properties配置文件中datasource相关配置(url、username、password);
- 通过BdTravelApplication启动类，启动项目即可。

注意
- 前端页面适配15.6寸笔记本屏幕；
- 根据请求中的关键字寻找controller;
- 当时编码经验不足，功能相对简单，但是完整;





