package site.mingsha.monitor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import de.codecentric.boot.admin.server.config.EnableAdminServer;

/**
 * 监控中心
 *
 * @author mingsha
 */
@EnableAdminServer
@SpringBootApplication
public class MingshaMonitorApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MingshaMonitorApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  监控服务启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }
}
