package site.mingsha.gateway.handler;

import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.GatewayCallbackManager;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import site.mingsha.common.core.utils.ServletUtils;
import org.springframework.web.reactive.function.server.ServerResponse;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebExceptionHandler;
import reactor.core.publisher.Mono;

/**
 * 自定义限流异常处理
 *
 * @author mingsha
 */
public class SentinelFallbackHandler implements WebExceptionHandler
{
    private Mono<Void> writeResponse(ServerResponse response, ServerWebExchange exchange, String msg)
    {
        return ServletUtils.webFluxResponseWriter(exchange.getResponse(), msg);
    }

    @Override
    public Mono<Void> handle(ServerWebExchange exchange, Throwable ex)
    {
        if (exchange.getResponse().isCommitted())
        {
            return Mono.error(ex);
        }
        if (!BlockException.isBlockException(ex))
        {
            return Mono.error(ex);
        }
        String msg;
        if (ex instanceof FlowException) {
            msg = "请求被限流";
        } else if (ex instanceof ParamFlowException) {
            msg = "请求被热点参数限流";
        } else if (ex instanceof DegradeException) {
            msg = "请求被降级";
        } else if (ex instanceof AuthorityException) {
            msg = "请求权限拦截";
        } else {
            msg = "请求超过最大数，请稍候再试。";
        }
        System.out.println(msg);
        // 需要对msg 做进一步处理，用以区分具体异常行为。

        return handleBlockedRequest(exchange, ex, msg).flatMap(response -> writeResponse(response, exchange, msg));
    }

    private Mono<ServerResponse> handleBlockedRequest(ServerWebExchange exchange, Throwable throwable, String msg)
    {
        return GatewayCallbackManager.getBlockHandler().handleRequest(exchange, throwable);
    }
}
