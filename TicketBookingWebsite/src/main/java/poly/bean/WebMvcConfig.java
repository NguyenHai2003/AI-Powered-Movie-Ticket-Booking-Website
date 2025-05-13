package poly.bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.List;

@Configuration
@EnableWebMvc
public class WebMvcConfig extends WebMvcConfigurationSupport {

    // Override this method if you need to customize message converters
    @Override
    protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
    	converters.add(new MappingJackson2HttpMessageConverter());
        super.configureMessageConverters(converters);
        // Add custom message converters here if needed
    }
}
