package com.neutrino.config;

import com.neutrino.utils.DateConveter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ConversionServiceFactoryBean;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Configuration
public class BeanConfig {
    /**
     * 表单全局日期转换器
     */
    @Bean
    public ConversionService getConversionService(DateConveter dateConverter){
        ConversionServiceFactoryBean factoryBean = new ConversionServiceFactoryBean();
        Set<Converter> converters = new HashSet<>();
        converters.add(dateConverter);
        factoryBean.setConverters(converters);
        return factoryBean.getObject();
    }
}
