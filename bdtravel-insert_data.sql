--之所以先truncate 是因为主键自增长，防止主键不是从1开始自增
truncate table tastyfood;
truncate table scenic;
truncate table ticket;
truncate table `order`;--关键字，需要加引号
truncate table `user`;--关键字，需要加引号
truncate table manager;

INSERT INTO bdtravel.`user` (userid,username,password,name,email,telephone,birthday,sex,state,code) VALUES
('1','neutrino','202cb962ac59075b964b07152d234b70','neutrino',NULL,NULL,'2022-09-07','female',1,NULL);

INSERT INTO bdtravel.`order` (tid,uid,paid,num,`no`,code,state) VALUES
(1,'1',1.0,1,'ef628cd7-e007-4452-a0ae-2e23662b7d94','515583d4-923b-497c-ba5d-6aa178e5fdcd',2);

INSERT INTO bdtravel.ticket (fid,name,`explain`,dprice,mprice) VALUES
(1,'水外洞天公园','成人需购买门票，12岁以下儿童免门票。',100.0,99.0),
(2,'景秀动物园','成人需购买门票，12岁以下儿童免门票。',58.0,28.0),
(3,'野生动物园','成人需购买门票，12岁以下儿童免门票。',199.0,98.0),
(4,'野三坡白洋淀','成人需购买门票，12岁以下儿童免门票。',588.0,88.0);

INSERT INTO bdtravel.tastyfood (name,`describe`,commend,pic) VALUES
('香辣鸡煲','黄焖鸡米饭又叫香辣鸡煲或浓汁香辣鸡煲饭。色香味美，口感鲜嫩，透味不粘腻，香味浓郁。','鸡米饭天祥路店；','/image/foodpic/hc.png'),
('牛肉罩饼','牛肉罩饼，色香味美，口感鲜嫩，透味不粘腻，香味浓郁。','晓遥之家菜馆；老保定菜馆；','/image/foodpic/zb.png'),
('浓郁豆腐','浓郁豆腐，色香味美，口感鲜嫩，透味不粘腻，香味浓郁。','味多好家常菜；','/image/foodpic/zddf.jpg'),
('牛肉罩饼','牛肉罩饼，色香味美，口感鲜嫩，透味不粘腻，香味浓郁。','牛肉罩饼裕华店；','/image/foodpic/zb.png');

INSERT INTO bdtravel.scenic (name,theme,addr,feature,pic,sales) VALUES
('水外洞天公园','湖光山色','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/byd.png',0),
('景秀动物园 ','湖光山色','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/bys.png',0),
('野生动物园 ','田园度假','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/ds.png',0),
('野三坡白洋淀  ','登山徒步','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/dxg.png',0);

INSERT INTO bdtravel.manager (managerid,name,password,flag) VALUES
('1','admin','123',0);