INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('200b60d1-00f8-4a73-97da-aa8ba374d100', 'admin123', 'admin', '管理员', null, '', '1', '0', '0', '1', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('200b60d1-00f8-4a73-97da-aa8ba374d120', 'jingli', '123456', '经理', null, '', '1', '1', '0', '1', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('210b60d1-00f8-4a73-97da-aa8ba374d121', 'liulaoshi', '123456', '刘老师', null, '', '5', '1', '0', '2', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('220b60d1-00f8-4a73-97da-aa8ba374d122', 'wanglaoshi', '123456', '王老师', null, '', '5', '1', '0', '2', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('230b60d1-00f8-4a73-97da-aa8ba374d123', 'liuzhuli', '123456', '刘助理', null, '', '10', '0', '1', '3', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('240b60d1-00f8-4a73-97da-aa8ba374d124', 'wangzhuli', '123456', '王助理', null, '', '10', '0', '1', '3', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('250b60d1-00f8-4a73-97da-aa8ba374d125', 'chenyuanwai', '123456', '陈员外', null, '', '15', '0', '0', '4', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('260b60d1-00f8-4a73-97da-aa8ba374d126', 'dadizhu', '123456', '大地主', null, '', '20', '0', '0', '5', '127.0.0.1');
INSERT INTO `t_user` (uid,user_name,password,nick_name,mobile,qq,user_order,is_subscribe,is_qq,role_id,register_ip) VALUES ('270b60d1-00f8-4a73-97da-aa8ba374d127', 'qiyejia', '123456', '企业家', null, '', '25', '0', '0', '6', '127.0.0.1');

ALTER TABLE t_user
ADD COLUMN skin_id  varchar(10) NULL DEFAULT 'skin0' AFTER create_time;

ALTER TABLE t_user
ADD COLUMN is_no_talking  int(1) NULL DEFAULT 0 COMMENT '是否被禁言 0 否 1 是' AFTER skin_id;


ALTER TABLE t_role
ADD COLUMN auths  varchar(16) NULL COMMENT '权限' AFTER note;

ALTER TABLE `t_user`
ADD INDEX `uid` (`uid`) ,
ADD INDEX `username` (`user_name`) ;

ALTER TABLE `t_user`
ADD COLUMN `email`  varchar(100) NULL DEFAULT NULL COMMENT '邮箱' AFTER `is_no_talking`;

CREATE TABLE `t_notice` (
`id`  int NOT NULL ,
`content`  varchar(256) NULL ,
`is_publish`  int NULL DEFAULT 0 COMMENT '是否发布 0 否 1 是' ,
`create_time`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
;

