package site.mingsha.provider.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;
import site.mingsha.common.core.domain.R;
import site.mingsha.provider.RemoteProviderService;

/**
 * 降级处理
 *
 * @author mingsha
 */
@Component
public class RemoteProviderFallbackFactory implements FallbackFactory<RemoteProviderService>
{
    private static final Logger log = LoggerFactory.getLogger(RemoteProviderFallbackFactory.class);

    @Override
    public RemoteProviderService create(Throwable throwable)
    {
        log.error("服务提供方调用失败:{}", throwable.getMessage());
        return new RemoteProviderService()
        {
            @Override
            public R search()
            {
                return R.fail("调用失败:" + throwable.getMessage());
            }

            @Override
            public R search4degrade()
            {
                return R.fail("调用失败:" + throwable.getMessage());
            }
        };
    }
}
