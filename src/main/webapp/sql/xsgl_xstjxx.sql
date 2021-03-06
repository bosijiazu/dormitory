CREATE TABLE XSGL_XSTJXX (
ID int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
XH varchar(64) NOT NULL COMMENT '学号',
TJXQ varchar(40) DEFAULT NULL COMMENT '体检学期',
TJRQ datetime DEFAULT NULL COMMENT '体检日期',
TJYY varchar(40) DEFAULT NULL COMMENT '体检医院',
SG varchar(20) DEFAULT NULL COMMENT '身高',
TZ varchar(20) DEFAULT NULL COMMENT '体重',
SLZY varchar(20) DEFAULT NULL COMMENT '视力左眼',
SLYY varchar(20) DEFAULT NULL COMMENT '视力右眼',
WGK varchar(40) DEFAULT NULL COMMENT '五官科',
JWBS varchar(40) DEFAULT NULL COMMENT '既往病史',
NK varchar(40) DEFAULT NULL COMMENT '内科',
TJJL varchar(255) DEFAULT NULL COMMENT '体检结论',
TJYJ varchar(255) DEFAULT NULL COMMENT '体检意见',
QTTJ varchar(255) DEFAULT NULL COMMENT '其他体检',
PRIMARY KEY (ZJ)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学生体检信息';
