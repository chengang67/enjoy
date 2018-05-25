//
//  BeventModel.h
//  SZZF
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface BeventModel : BaseModel


/**
 * id
 */
@property(nonatomic, assign) NSInteger id;
/**
 * id
 */
@property(nonatomic, assign) NSInteger pe_id;
/**
 * 标题
 */
@property(nonatomic, strong)NSString * pe_title;
/**
 * 状态
 */
@property(nonatomic, assign) NSInteger pe_status;
/**
 * 事件来源
 */
@property(nonatomic, strong)NSString *pe_source;
/**
 * 事件等级
 */
@property(nonatomic, assign) NSInteger pe_grade;
/**
 * 事件类型
 */
@property(nonatomic, strong)NSString * pe_type;
/**
 * 录入人
 */
@property(nonatomic, assign) NSInteger pe_enter;
/**
 * 录入时间
 */
@property(nonatomic,strong)NSDate * pe_enter_time;
/**
 * 受理时间
 */
@property(nonatomic,strong)NSDate * pe_processing_time;
/**
 * 镇
 */
@property(nonatomic, strong)NSString * pe_town;
/**
 * 村
 */
@property(nonatomic, strong)NSString * pe_village;
/**
 * 网格
 */
@property(nonatomic, strong)NSString * pe_grid;
/**
 * 处置类型
 */
@property(nonatomic, strong)NSString * pe_manage_type;
/**
 * 地址
 */
@property(nonatomic, strong)NSString * pe_address;
/**
 * 联系人
 */
@property(nonatomic, strong)NSString * pe_contacts;
/**
 * 联系方式
 */
@property(nonatomic, strong)NSString * pe_mobile;
/**
 * 内容
 */
@property(nonatomic, strong)NSString * pe_content;
/**
 * 结果
 */
@property(nonatomic, strong)NSString * pe_results;
/**
 * 抄送
 */
@property(nonatomic, strong)NSString * pe_cc;
/**
 * 短信提醒
 */
@property(nonatomic, assign) NSInteger pe_issms;
/**
 * 事件来源一级
 */
@property(nonatomic, assign) NSInteger pe_source_one;
/**
 * 事件来源二级
 */
@property(nonatomic, assign) NSInteger pe_source_two;

@property(nonatomic, assign) NSInteger pe_source_three;
/**
 * 事件类型一级
 */
@property(nonatomic, assign) NSInteger pe_type_one;
/**
 * 事件类型二级
 */
@property(nonatomic, assign) NSInteger pe_type_two;
/**
 * 事件类型三级
 */
@property(nonatomic, assign) NSInteger pe_type_three;
/**
 * 上报人id
 */
@property(nonatomic, assign) NSInteger pe_report;
/**
 * 案卷编号
 */
@property(nonatomic, strong)NSString * pe_case;
/**
 * 派单人id
 */
@property(nonatomic, assign) NSInteger pe_send_single;
/**
 * 派单时间
 */
@property(nonatomic,strong)NSDate *pe_send_time;
/**
 * 上报时间
 */
@property(nonatomic,strong)NSDate *pe_report_time;
/**
 * 操作人id
 */
@property(nonatomic, assign) NSInteger pe_operat;
/**
 * 操作时间
 */
@property(nonatomic,strong)NSDate *pe_operat_time;
/**
 * 延期审批1_通过2_不通过
 */
@property(nonatomic, assign) NSInteger pe_approval_status;
/**
 * 内容附件
 */
@property(nonatomic, strong)NSString *  pe_content_accessory;

/**
 * 结果附件
 */
@property(nonatomic, strong)NSString *  pe_results_accessory;
/**
 * 1终止 2恢复
 */
@property(nonatomic, assign) NSInteger pe_stop;// 1终止 2恢复

/**
 * 问题状态
 */
@property(nonatomic, assign) NSInteger pe_casestatus;


@property(nonatomic, assign) NSInteger pe_send_departmentid; //派发到部门

/**
 * 签收人
 */
@property(nonatomic, assign) NSInteger pe_signin;
/**
 * 签收时间
 */
@property(nonatomic,strong)NSDate *pe_signin_time;
/**
 * 延期申请烦人
 */
@property(nonatomic, assign) NSInteger pe_extensionreq;
/**
 * 延期申请时间
 */
@property(nonatomic,strong)NSDate *pe_extensionreq_time;
/**
 * 延期审核人
 */
@property(nonatomic, assign) NSInteger pe_extensioncheck;
/**
 * 延期审核时间
 */
@property(nonatomic,strong)NSDate * pe_extensioncheck_time;
/**
 * 申请原因
 */
@property(nonatomic, strong)NSString * pe_extension_postpone;
/**
 * 处置人
 */
@property(nonatomic, assign) NSInteger pe_dispose;
/**
 * 处置时间
 */
@property(nonatomic,strong)NSDate *pe_dispose_time;
/**
 * 结案人
 */
@property(nonatomic, assign) NSInteger pe_end;
/**
 * 结案时间
 */
@property(nonatomic,strong)NSDate *pe_end_time;
/**
 * 中止人
 */
@property(nonatomic, assign) NSInteger pe_discontinue;
/**
 * 中止时间
 */
@property(nonatomic,strong)NSDate *pe_discontinue_time;
/**
 * 恢复人
 */
@property(nonatomic, assign) NSInteger pe_renew;
/**
 * 恢复时间
 */
@property(nonatomic,strong)NSDate *pe_renew_time;
/**
 * 撤回人
 */
@property(nonatomic, assign) NSInteger pe_revocation;
/**
 * 撤回时间
 */
@property(nonatomic,strong)NSDate * pe_revocation_time;


/**
 * 办结时间
 */
@property(nonatomic,strong)NSDate *pe_banjie_time;


/**
 * 办结人
 */
@property(nonatomic, assign) NSInteger pe_banjie;

/**
 * 纬度
 */
@property(nonatomic ,assign)CGFloat pe_lat;

/**
 * 经度
 */
@property(nonatomic ,assign)CGFloat pe_lng;


/**
 * 平台 （1数字城管 2综合治理 3综合执法）
 */
@property(nonatomic, strong)NSString * pe_platform;

/**
 * 最后修改部门
 */
@property(nonatomic, assign) NSInteger pe_last_departmentid;

/**
 * 最后操作人
 */
@property(nonatomic, assign) NSInteger pe_last_operation;

/**
 * 派遣结束时间
 */
@property(nonatomic,strong)NSDate *pe_dispatch_endtime;
/**
 * 处置结束时间
 */
@property(nonatomic,strong)NSDate *pe_dispose_endtime;

/**
 * 处置时限
 */
@property(nonatomic, assign) NSInteger pe_dispose_limit;    //处置时限
/**
 * 处置时限单位（1小时 2天 3分钟 4紧急工作时）
 */
@property(nonatomic, assign) NSInteger pe_dispose_limitunit;    //处置时限单位（1小时 2天 3分钟 4紧急工作时）

/**
 * 返工人
 */
@property(nonatomic, assign) NSInteger pe_rework;//    NUMBER    Y            返工人
/**
 * 返工时间
 */
@property(nonatomic,strong)NSDate *pe_rework_time;//    DATE    Y            返工时间

/**
 * 结果评价
 */

@property(nonatomic,assign)double pe_estimate_result;
/**
 * 效率评价
 */
@property(nonatomic,assign)double pe_estimate_efficien;
/**
 * 态度评价
 */
@property(nonatomic,assign)double pe_estimate_attitude;
/**
 * 评价意见
 */
@property(nonatomic, strong)NSString * pe_estimate_opinion;
/**
 * 评价人
 */
@property(nonatomic, assign) NSInteger pe_estimate;
/**
 * 评价时间
 */
@property(nonatomic,strong)NSDate *pe_estimate_time;
/**
 * 派发的协助部门
 */
@property(nonatomic, assign) NSInteger pe_send_departmentid_deputy;
/**
 * 评分总计
 */
@property(nonatomic,assign)double pe_estimate_aggregate;




/**
 *  结案结束时间
 */
@property(nonatomic,strong)NSDate *pe_end_endtime    ;//         结案结束时间

/**
 *  办结结束时间
 */
@property(nonatomic,strong)NSDate *pe_banjie_endtime    ;//    y            办结结束时间

/**
 * 签收结束时间
 */
@property(nonatomic,strong)NSDate *pe_signin_endtime    ;//    y            签收结束时间

/**
 * 责任人
 */
@property(nonatomic, assign) NSInteger pe_liable_person;//责任人

/**
 * 责任部门
 */
@property(nonatomic, assign) NSInteger pe_liable_department;//责任部门


/**
 * 甲方负责人
 */
@property(nonatomic, strong)NSString * pe_party_a;
/**
 * 乙方负责人
 */
@property(nonatomic, strong)NSString * pe_party_b;
/**
 * 甲方 性别
 */
@property(nonatomic, strong)NSString * pe_sex_a;
/**
 * 乙方 性别
 */
@property(nonatomic, strong)NSString * pe_sex_b;
/**
 * 甲方 民族
 */
@property(nonatomic, strong)NSString * pe_familyname_a;
/**
 * 乙方 民族
 */
@property(nonatomic, strong)NSString * pe_familyname_b;
/**
 * 甲方 联系人
 */
@property(nonatomic, strong)NSString * pe_tel_a;
/**
 * 乙方 联系人
 */
@property(nonatomic, strong)NSString * pe_tel_b;
/**
 * 甲方 id
 */
@property(nonatomic, strong)NSString * pe_id_a;
/**
 * 乙方 id
 */
@property(nonatomic, strong)NSString * pe_id_b;
/**
 * 甲方地址
 */
@property(nonatomic, strong)NSString * pe_address_a;
/**
 * 乙方地址
 */
@property(nonatomic, strong)NSString * pe_address_b;
/**
 * 纠纷事项
 */
@property(nonatomic, strong)NSString * pe_disputes;
/**
 * 处理方式
 */
@property(nonatomic, strong)NSString * pe_processing_mode;

/**
 * 茅盾附件
 */
@property(nonatomic, strong)NSString * pe_enclosures;
/**
 * 事件模式
 */
@property(nonatomic, assign) NSInteger pe_pattern;
/**
 * 安全隐患类型
 */
@property(nonatomic, assign) NSInteger pe_dangertypes;
/**
 * 发现时间
 */
@property(nonatomic,strong)NSDate *pe_findtime;
/**
 * 情况说明
 */
@property(nonatomic, strong)NSString * pe_situation;;
/**
 *  所属镇
 */
@property(nonatomic, assign) NSInteger pe_belongto_town     ;
/**
 * 责任部门
 */
@property(nonatomic, assign) NSInteger pe_deptid     ;
/**
 * 协同部门
 */
@property(nonatomic, assign) NSInteger pe_withdeptid     ;
/**
 * 处理部门
 */
@property(nonatomic, assign) NSInteger pe_deal     ;
/**
 * 监督员id
 */
@property(nonatomic, assign) NSInteger pe_reportuserid     ;
/**
 * 监督员上报日期
 */
@property(nonatomic,strong)NSDate *pe_reportdate     ;

/**
 * 部件编号
 */
@property(nonatomic, strong)NSString * pe_part_number;
/**
 * 事部件类型
 */
@property(nonatomic, assign) NSInteger pe_event_type;
/**
 * 立案人
 */
@property(nonatomic, assign) NSInteger pe_lauserid         ;
/**
 * 立案时间
 */
@property(nonatomic,strong)NSDate * pe_la_time ;

/**
 * 归档
 * 
 */
@property(nonatomic, assign) NSInteger pe_file;

/**
 * 市级编号
 */
@property(nonatomic, strong)NSString * pe_city_case;

/**
 * 核实人
 */


@property(nonatomic, assign) NSInteger pe_verify_person;     //number    y            核实人
@property(nonatomic,strong)NSDate *pe_verify_time;     //date    y            核实时间
@property(nonatomic,strong)NSDate * pe_verify_endtime;     //date    y            核实结束时间
@property(nonatomic, assign) NSInteger pe_check_person;     //number    y            核查人
@property(nonatomic,strong)NSDate *pe_check_time;     //date    y            核查时间
@property(nonatomic,strong)NSDate * pe_check_endtime;     //date    y            核查结束时间
@property(nonatomic, assign) NSInteger pe_verifysend_person;     //number    y            核实派发人
@property(nonatomic,strong)NSDate *pe_verifysend_time;     //date    y            核实派发时间
@property(nonatomic,strong)NSDate * pe_verifysend_endtime;     //date    y            核实派发结束时间
@property(nonatomic, assign) NSInteger pe_checksend_person;    //    number;     //y            核查派发人
@property(nonatomic,strong)NSDate * pe_checksend_time;     //date    y            核查派发时间
@property(nonatomic,strong)NSDate *pe_checksend_endtime;     //date    y            核查派发结束时间

@property(nonatomic, strong)NSString * pe_address_description ; //地址描述
@property(nonatomic, strong)NSString * pe_report_user    ;//NUMBER(8)    Y            举报人
@property(nonatomic, strong)NSString * pe_report_number;    //VARCHAR2(100)    Y            举报号码
@property(nonatomic, strong)NSString * pe_belongto_street; //所属街道
@property(nonatomic,strong)NSDate *pe_la_endtime; //立案结束时间

@property(nonatomic, assign) NSInteger pe_fk;//    NUMBER(8)    Y    0        反馈  1_是  0_否
@property(nonatomic, strong)NSString * pe_sj_case;//    VARCHAR2(100)    Y            市级编号
@property(nonatomic, assign) NSInteger pe_db;//    NUMBER(8)    Y            督办  1_是  0_否
@property(nonatomic, strong)NSString * pe_yc;//    VARCHAR2(100)    Y            异常  ( 退回 或者 返工)
@property(nonatomic, assign) NSInteger pe_processing_user;

@property(nonatomic, strong)NSString * pe_yj    ;//VARCHAR2(1000)    Y            意见

/**
 * 申请人名字
 */
@property(nonatomic, strong)NSString * pe_applicant_name;
/**
 * 申请人
 */
@property(nonatomic, assign) NSInteger pe_applicant;
/**
 * 申请时间
 */
//  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,strong)NSDate * pe_applicant_time;

/**
 * 申请意见
 */
@property(nonatomic, strong)NSString * pe_applicant_opinion;
/**
 * 申请附件
 */
@property(nonatomic, strong)NSString * pe_applicant_accessory;
/**
 * 延期时间
 */
@property(nonatomic,strong)NSDate * pe_extension_time;
/**
 * 协同派发部门
 */
@property(nonatomic, assign) NSInteger pe_synergy_dispatch_department;
/**
 * 协同派发时间
 */
@property(nonatomic,strong)NSDate * pe_synergy_dispatch_time;
/**
 * 协同派发人
 */
@property(nonatomic, assign) NSInteger pe_synergy_dispatch;
/**
 * 协同派发意见
 */
@property(nonatomic, strong)NSString * pe_synergy_dispatch_opinion;
/**
 * 审批人
 */
@property(nonatomic, assign) NSInteger pe_approval;
/**
 * 审批时间
 */
@property(nonatomic,strong)NSDate * pe_approval_time;
/**
 * 审批附件
 */
@property(nonatomic, strong)NSString * pe_approval_accessory;
/**
 * 审批意见
 */
@property(nonatomic, strong)NSString * pe_approval_opinion;
/**
 * 核查意见
 */
@property(nonatomic, strong)NSString * pe_check_opinion;
/**
 * 核查结果
 */
@property(nonatomic, strong)NSString * pe_check_result;

@end
