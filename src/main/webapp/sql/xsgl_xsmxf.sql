CREATE TABLE XSGL_XSMXF (
ID int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
XH varchar(64) NOT NULL COMMENT '学号',
JMYY varchar(255) DEFAULT NULL COMMENT '减免原因',
JMJE double DEFAULT NULL COMMENT '减免金额',
MXFSFRQ datetime DEFAULT NULL COMMENT '免学费始发日期',
MXFTFRQ datetime DEFAULT NULL COMMENT '免学费停发日期',
JFLY varchar(40) DEFAULT NULL COMMENT '经费来源',
FJ varchar(255) DEFAULT NULL COMMENT '附件',
BZ varchar(255) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学生免学费';