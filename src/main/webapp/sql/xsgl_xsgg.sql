CREATE TABLE XSGL_XSGG (
ID int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
XH varchar(64) NOT NULL COMMENT '学号',
BT varchar(40) DEFAULT NULL COMMENT '标题',
FBR varchar(20) DEFAULT NULL COMMENT '发布人',
FBRQ datetime DEFAULT NULL COMMENT '发布日期',
GGLX varchar(40) DEFAULT NULL COMMENT '公告类型',
ZZ varchar(40) DEFAULT NULL COMMENT '组织',
GGNR varchar(255) DEFAULT NULL COMMENT '公告内容',
PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学生公告';