package site.mingsha.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 *
 * @author mingsha
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class MingshaGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  网关服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
