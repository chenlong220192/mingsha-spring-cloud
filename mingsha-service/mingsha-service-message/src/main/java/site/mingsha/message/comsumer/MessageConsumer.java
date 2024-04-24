package site.mingsha.message.comsumer;

import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @author chenlong
 * @date 2024-03-09
 */
@Component
@RocketMQMessageListener(topic = "topic_test", selectorExpression = "demo_0", consumerGroup = "consumer_group_0")
public class MessageConsumer implements RocketMQListener<String> {

    private static final Logger log = LoggerFactory.getLogger(MessageConsumer.class);

    @Override
    public void onMessage(String message) {
        // 处理消息的逻辑
        log.info("消息消费成功！TOPIC:{} TAG:{} MESSAGE:{}", "topic_test", "demo_0", message);
    }

}
