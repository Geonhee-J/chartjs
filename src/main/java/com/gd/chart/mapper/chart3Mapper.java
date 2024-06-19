package com.gd.chart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface chart3Mapper {
	@Select("SELECT"
			+ "	t.deptName deptName,"
			+ "	sum(t.salary) sumSalary,"
			+ "	round(AVG(t.salary)) avgSalary,"
			+ "	max(t.salary) maxSalary,"
			+ "	min(t.salary) minSalary"
			+ " FROM"
			+ " (SELECT s.emp_no empNo, s.salary salary, d.dept_name deptName"
			+ " FROM"
			+ "	(SELECT emp_no, salary"
			+ "	FROM salaries"
			+ "	WHERE to_date = '9999-01-01') s"
			+ "	INNER JOIN"
			+ "	(SELECT emp_no, dept_no"
			+ "	FROM dept_emp"
			+ "	WHERE to_date = '9999-01-01') de"
			+ "	ON s.emp_no = de.emp_no"
			+ "	INNER JOIN departments d"
			+ "	ON de.dept_no = d.dept_no) t"
			+ " GROUP BY t.deptName"
			+ " ORDER BY t.deptName ASC")
	List<Map<String, Object>> selectSalaryByDeptName();
}
