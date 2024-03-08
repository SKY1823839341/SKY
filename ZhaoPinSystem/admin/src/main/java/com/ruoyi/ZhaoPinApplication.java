package com.ruoyi;

import java.awt.Desktop;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import java.net.URI;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class ZhaoPinApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(ZhaoPinApplication.class, args);



        System.out.println("(♥◠‿◠)ﾉﾞ  后台启动成功，欢迎访问基于大数据存储实现招聘网站数据分析系统 http://localhost   ლ(´ڡ`ლ)ﾞ  \n" +
                "\n" +
                " ██████╗ ███████╗ ██████╗ ████████╗\n" +
                "██╔═══██╗██╔════╝██╔═══██╗╚══██╔══╝\n" +
                "██║██╗██║███████╗██║   ██║   ██║   \n" +
                "██║██║██║╚════██║██║▄▄ ██║   ██║   \n" +
                "╚█║████╔╝███████║╚██████╔╝   ██║   \n" +
                " ╚╝╚═══╝ ╚══════╝ ╚══▀▀═╝    ╚═╝   \n" +
                "   ''-'   `'-'    `-..-'    `-..-'    ");

        try {
            Desktop desktop = Desktop.getDesktop();
            URI uri = new URI("http://localhost"); //创建URI统一资源标识符
            desktop.browse(uri); //使用默认浏览器打开超链接
            System.out.println(uri);
        }catch (Exception e) {

        }
    }



}