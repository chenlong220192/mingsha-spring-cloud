package site.mingsha.consumer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import site.mingsha.common.security.annotation.EnableRyFeignClients;
import site.mingsha.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 文件服务
 *
 * @author mingsha
 */
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class MingshaConsumerApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaConsumerApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  服务消费方服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
