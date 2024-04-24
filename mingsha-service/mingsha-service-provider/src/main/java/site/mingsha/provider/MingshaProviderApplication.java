package site.mingsha.provider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import site.mingsha.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 文件服务
 *
 * @author mingsha
 */
@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class MingshaProviderApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaProviderApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  服务提供方启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
