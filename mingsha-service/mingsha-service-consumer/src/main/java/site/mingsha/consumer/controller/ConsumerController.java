package site.mingsha.consumer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import site.mingsha.common.core.domain.R;
import site.mingsha.provider.RemoteProviderService;

/**
 *
 * @author mingsha
 */
@RestController
public class ConsumerController {

    private static final Logger log = LoggerFactory.getLogger(ConsumerController.class);

    @Autowired
    private RemoteProviderService remoteProviderService;

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/search")
    public R search() {
        log.info("Consumer:查询请求成功。");
        return remoteProviderService.search();
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/search4degrade")
    public R search4degrade() {
        return remoteProviderService.search4degrade();
    }

}
