package com.confiedy.app;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
@ComponentScan
@Configuration
@EnableJpaRepositories
class ConfiedyAppConfig {
    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }

}