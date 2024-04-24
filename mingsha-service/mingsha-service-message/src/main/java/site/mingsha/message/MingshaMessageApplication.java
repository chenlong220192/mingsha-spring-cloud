package site.mingsha.message;

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
public class MingshaMessageApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaMessageApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  消息服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
