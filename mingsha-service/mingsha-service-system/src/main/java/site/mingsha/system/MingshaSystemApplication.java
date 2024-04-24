package site.mingsha.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import site.mingsha.common.security.annotation.EnableCustomConfig;
import site.mingsha.common.security.annotation.EnableRyFeignClients;
import site.mingsha.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 系统模块
 *
 * @author mingsha
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class MingshaSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
