package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DoughnutMapper {

	@Select("SELECT YEAR(hire_date) hireYear, count(*) cnt FROM employees GROUP BY YEAR(hire_date)")
	List<Map<String, Object>> selectCountHireDate();
}
