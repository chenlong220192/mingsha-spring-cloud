# Spring Cloud BMS
* base on Spring Cloud,Nacos,Sentinel,RocketMQ.

* forked from https://doc.ruoyi.vip/
## 工程结构
```
├── deploy                                // 部署脚本
├── mingsha-common                        // 自定义starter
│       └── mingsha-common-core           // 核心代码
│       └── mingsha-common-actuator       // 监控器
│       └── mingsha-common-prometheus     // JVM Exporter
│       └── mingsha-common-datascope      // 权限范围
│       └── mingsha-common-datasource     // 多数据源
│       └── mingsha-common-log            // 操作日志
│       └── mingsha-common-redis          // Redis
│       └── mingsha-common-rocketmq       // RocketMQ
│       └── mingsha-common-security       // 安全模块
│       └── mingsha-common-swagger        // 接口模块
├── mingsha-facade                        // 门面模式
│       └── mingsha-facade-file           // 文件Feign客户端
│       └── mingsha-facade-system         // 系统Feign客户端
├── mingsha-service                       // 单个服务
│       └── mingsha-service-gateway       // 网关服务[8001]
│       └── mingsha-service-auth          // 认证服务[8002]
│       └── mingsha-service-system        // 系统服务[8003]
│       └── mingsha-service-file          // 文件服务[8004]
│       └── mingsha-service-message       // 消息服务[8005]
│       └── mingsha-service-generator     // 代码生成[8006]
│       └── mingsha-service-provider      // 提供服务[8007]
│       └── mingsha-service-consumer      // 消费服务[8008]
│       └── mingsha-service-monitor       // 监控服务[8009]
├── mingsha-ui                            // 前端工程[8000]
├── sql                                   // sql
├── Makefile                              // 基本命令
```
