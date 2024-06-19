package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface chart5Mapper {
	@Select("SELECT d.dept_name dname, t.y year, t.cnt cnt"
			+ " FROM"
			+ "	departments d"
			+ "	INNER JOIN"
			+ "	(SELECT a.dept_no dept_no, a.유입년도 y, (a.유입 - b.유출) cnt"
			+ "	FROM"
			+ "	(SELECT dept_no, YEAR(from_date) 유입년도, COUNT(*) 유입"
			+ "	FROM dept_emp"
			+ "	GROUP BY dept_no, YEAR(from_date)) a"
			+ "	INNER JOIN"
			+ "	(SELECT dept_no, YEAR(to_date) 유출년도, COUNT(*) 유출"
			+ "	FROM dept_emp"
			+ "	WHERE to_date != '9999-01-01'"
			+ "	GROUP BY dept_no, YEAR(to_date)) b"
			+ "	ON a.dept_no = b.dept_no AND a.유입년도 = b.유출년도) t"
			+ "	ON d.dept_no = t.dept_no"
			+ " ORDER BY d.dept_name, t.y")
	List<Map<String, Object>> selectDeptMemberForYear();
}
