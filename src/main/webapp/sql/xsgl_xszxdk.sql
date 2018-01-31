CREATE TABLE XSGL_XSZXDK (
ID int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
XH varchar(64) NOT NULL COMMENT '学号',
XM varchar(20) DEFAULT NULL COMMENT '姓名',
XZB varchar(40) DEFAULT NULL COMMENT '行政班',
BZR varchar(20) DEFAULT NULL COMMENT '班主任',
NJ varchar(40) DEFAULT NULL COMMENT '年级',
XQ varchar(40) DEFAULT NULL COMMENT '学期',
SQDKRQ datetime DEFAULT NULL COMMENT '申请贷款日期',
DKHTH varchar(255) DEFAULT NULL COMMENT '贷款合同号',
DKZJE double DEFAULT NULL COMMENT '贷款总金额',
DKNS int(11) DEFAULT NULL COMMENT '贷款年数',
SQHKR datetime DEFAULT NULL COMMENT '首期还款日',
HKZZR datetime DEFAULT NULL COMMENT '还款终止日',
JKYT varchar(40) DEFAULT NULL COMMENT '借款用途',
DKYX varchar(40) DEFAULT NULL COMMENT '贷款银行',
QYR datetime DEFAULT NULL COMMENT '签约日',
SFYCXCH varchar(2) DEFAULT NULL COMMENT '是否一次性偿还',
DBFS varchar(20) DEFAULT NULL COMMENT '担保方式',
SFYQ varchar(2) DEFAULT NULL COMMENT '是否延期',
YQNX int(11) DEFAULT NULL COMMENT '延期年限',
HDRQ datetime DEFAULT NULL COMMENT '获贷日期',
FJ varchar(255) DEFAULT NULL COMMENT '附件',
SHZT varchar(20) DEFAULT NULL COMMENT '审核状态',
BZ varchar(255) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学生助学贷款';
