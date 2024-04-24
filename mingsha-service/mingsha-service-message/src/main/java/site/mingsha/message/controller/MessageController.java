package site.mingsha.message.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.common.core.domain.R;
import site.mingsha.message.producer.MessageProducer;

import javax.annotation.Resource;

/**
 * 文件请求处理
 *
 * @author mingsha
 */
@RestController
public class MessageController {
  
    @Resource
    private MessageProducer messageProducer;

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/producer")
    public R getInfo() {
        messageProducer.send();
        return R.ok();
    }

}
