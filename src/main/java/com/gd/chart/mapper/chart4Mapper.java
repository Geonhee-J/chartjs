package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface chart4Mapper {
	@Select("SELECT gender, YEAR(hire_date) y, COUNT(*) cnt"
			+ " FROM employees"
			+ " GROUP BY gender, YEAR(hire_date)"
			+ " ORDER BY gender, YEAR(hire_date)")
	List<Map<String, Object>> selectGenderCountByYear();
}
