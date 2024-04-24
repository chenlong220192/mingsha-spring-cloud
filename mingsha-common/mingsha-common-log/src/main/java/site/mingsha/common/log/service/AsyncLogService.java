package site.mingsha.common.log.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import site.mingsha.common.core.constant.SecurityConstants;
import site.mingsha.system.RemoteLogService;
import site.mingsha.system.domain.SysOperLog;

/**
 * 异步调用日志服务
 * 
 * @author mingsha
 */
@Service
public class AsyncLogService
{
    @Autowired
    private RemoteLogService remoteLogService;

    /**
     * 保存系统日志记录
     */
    @Async
    public void saveSysLog(SysOperLog sysOperLog) throws Exception
    {
        remoteLogService.saveLog(sysOperLog, SecurityConstants.INNER);
    }
}
