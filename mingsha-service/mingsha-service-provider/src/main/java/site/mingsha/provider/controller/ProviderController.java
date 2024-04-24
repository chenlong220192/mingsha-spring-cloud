package site.mingsha.provider.controller;

import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import site.mingsha.common.core.domain.R;

/**
 * 文件请求处理
 *
 * @author mingsha
 */
@RefreshScope
@RestController
public class ProviderController {

    private static final Logger log = LoggerFactory.getLogger(ProviderController.class);

    @Value("${provider.search.result:FAILURE}")
    private String SEARCH_PARAM;

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/search")
    public R search() {
        log.info("Provider:查询请求成功。{}", SEARCH_PARAM);
        return R.ok(null, SEARCH_PARAM);
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/search4degrade")
    public R search4degrade() throws InterruptedException {
        log.error("Provider:查询请求异常。");
        TimeUnit.SECONDS.sleep(3);
        return R.ok();
    }

}
