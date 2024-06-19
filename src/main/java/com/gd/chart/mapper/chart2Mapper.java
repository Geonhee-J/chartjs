package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface chart2Mapper {
	
	@Select("SELECT t.dept_name dname, count(*) cnt"
			+ " FROM"
			+ "	(SELECT emp_no, dept_name"
			+ "	FROM dept_emp de INNER JOIN departments d"
			+ "	ON de.dept_no = d.dept_no"
			+ "	WHERE TO_date = '9999-01-01') t"
			+ " GROUP BY t.dept_name;")
	List<Map<String, Object>> selectCountDeptName();
}
