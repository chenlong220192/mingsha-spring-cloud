package site.mingsha.message.producer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Component;
import site.mingsha.common.rocketmq.producer.RocketMQProducer;

import javax.annotation.Resource;

/**
 * @author chenlong
 * @date 2024-03-09
 */
@Component
@RefreshScope
public class MessageProducer {

    private static final Logger log = LoggerFactory.getLogger(MessageProducer.class);

    private static final String TOPIC = "topic_test";
    private static final String TAG_DEMO_0 = "demo_0";
    private static final String TAG_DEMO_1 = "demo_1";

    @Value("${app.message.value:zzz}")
    private String APP_MESSAGE_VALUE;

    /**
     *
     */
    @Resource
    private RocketMQProducer producer;

    /**
     *
     */
    public void send() {
        final long start = System.currentTimeMillis();
        try {
            producer.asyncSend(TOPIC, TAG_DEMO_0, String.format("我是测试消息【%s】- %d", APP_MESSAGE_VALUE, System.currentTimeMillis()));
            log.error("消息投送成功！TOPIC:{} TAG:{}", TOPIC , TAG_DEMO_0);
            producer.asyncSend(TOPIC, TAG_DEMO_1, String.format("我是测试消息【%s】- %d", APP_MESSAGE_VALUE, System.currentTimeMillis()));
            log.error("消息投送成功！TOPIC:{} TAG:{}", TOPIC , TAG_DEMO_1);
        } catch (Exception e) {
            log.error("消息投送失败！！！");
        }
    }

}
