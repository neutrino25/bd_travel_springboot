package com.neutrino.utils;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 转换日期类型的数据
 * S : 页面传递过来的类型
 * T ： 转换后的类型
 */
@Component
public class DateConveter implements Converter<String, Date> {

	@Override
	public Date convert(String source) {
		try {
			if(null != source){
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				return df.parse(source);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
