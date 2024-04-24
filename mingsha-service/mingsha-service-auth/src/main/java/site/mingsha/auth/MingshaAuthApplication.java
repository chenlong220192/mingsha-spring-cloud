package site.mingsha.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import site.mingsha.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 *
 * @author mingsha
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class MingshaAuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  认证服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
