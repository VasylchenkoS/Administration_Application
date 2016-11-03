package com.vasilchenko.mvc.service;


import com.vasilchenko.java.dao.EmployeeDAO;
import com.vasilchenko.java.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeDAO employeeDAO;

	public List<Employee> getEmployee(){
		return employeeDAO.getAllEmployee();
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void addNewEmployee(Employee employee){
		employeeDAO.addNewEmployee(employee);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void modifyEmployee(Employee employee) {
		employeeDAO.updateEmployee(employee);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public Employee getEmployeeById(int id){
		return employeeDAO.getEmployeeById(id);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void removeEmployee(int id){employeeDAO.deleteEmployeeById(id);}
}
