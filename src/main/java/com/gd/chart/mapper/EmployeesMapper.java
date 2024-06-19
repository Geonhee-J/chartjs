package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmployeesMapper {
	
	@Select("SELECT gender, count(*) cnt FROM employees GROUP BY gender")
	List<Map<String, Object>> selectCountGender();
}
