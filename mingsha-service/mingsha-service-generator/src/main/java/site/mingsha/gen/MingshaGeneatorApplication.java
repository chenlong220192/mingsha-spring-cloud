package site.mingsha.gen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import site.mingsha.common.security.annotation.EnableCustomConfig;
import site.mingsha.common.security.annotation.EnableRyFeignClients;
import site.mingsha.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 代码生成
 *
 * @author mingsha
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class MingshaGeneatorApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaGeneatorApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
