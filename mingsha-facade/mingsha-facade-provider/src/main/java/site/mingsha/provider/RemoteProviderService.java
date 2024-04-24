package site.mingsha.provider;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import site.mingsha.common.core.constant.ServiceNameConstants;
import site.mingsha.common.core.domain.R;
import site.mingsha.provider.factory.RemoteProviderFallbackFactory;

/**
 * 服务提供方
 *
 * @author mingsha
 */
@FeignClient(contextId = "remoteProviderService", value = ServiceNameConstants.PROVIDER_SERVICE, fallbackFactory = RemoteProviderFallbackFactory.class)
public interface RemoteProviderService
{
    /**
     *
     * @return 结果
     */
    @GetMapping("search")
    public R search();

    /**
     *
     * @return 结果
     */
    @GetMapping("search4degrade")
    public R search4degrade();
}
