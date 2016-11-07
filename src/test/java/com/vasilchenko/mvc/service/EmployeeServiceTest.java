package com.vasilchenko.mvc.service;

import com.vasilchenko.java.components.Position;
import com.vasilchenko.java.model.Employee;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@ContextConfiguration(locations = "classpath:test-hibernate-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback(true)
public class EmployeeServiceTest {

	@Autowired EmployeeService employeeService;

	@Test
	public void testGetEmployee() throws Exception {
		Assert.assertNotNull(employeeService.getEmployee());
	}

	@Test
	public void testAddNewEmployee() throws Exception {
		Employee employee = new Employee();
		String testName = "testName";
		employee.setName(testName);
		String testSurname = "testSurname";
		employee.setSurname(testSurname);
		employeeService.addNewEmployee(employee);
		Employee findEmployee = employeeService.getEmployee().stream()
				.filter(employee1 ->
						Objects.equals(employee1.getName(), testName) &
								Objects.equals(employee1.getSurname(), testSurname))
				.findAny()
				.orElse(null);
		Assert.assertEquals(employee.getName(), findEmployee.getName());
		Assert.assertEquals(employee.getSurname(), findEmployee.getSurname());
	}

	@Test
	public void testModifyEmployee() throws Exception {
		Employee employee = new Employee();
		String testName = "testName";
		employee.setName(testName);
		String testSurname = "testSurname";
		employee.setSurname(testSurname);
		employeeService.addNewEmployee(employee);
		Employee findEmployee = employeeService.getEmployee().stream()
				.filter(employee1 ->
						Objects.equals(employee1.getName(), testName) &
								Objects.equals(employee1.getSurname(), testSurname))
				.findAny()
				.orElse(null);
		Assert.assertNotEquals(findEmployee.getPosition(), Position.DIRECTOR);
		findEmployee.setPosition(Position.DIRECTOR);
		employeeService.modifyEmployee(findEmployee);
		Assert.assertEquals(findEmployee.getPosition(), Position.DIRECTOR);
	}

	@Test
	public void testGetEmployeeById() throws Exception {
		Employee employee = new Employee();
		String testName = "testName";
		employee.setName(testName);
		String testSurname = "testSurname";
		employee.setSurname(testSurname);
		employeeService.addNewEmployee(employee);
		Employee findEmployee = employeeService.getEmployee().stream()
				.filter(employee1 ->
						Objects.equals(employee1.getName(), testName) &
								Objects.equals(employee1.getSurname(), testSurname))
				.findAny()
				.orElse(null);
		Employee actual = employeeService.getEmployeeById(findEmployee.getId());
		Assert.assertEquals(findEmployee.getId(), actual.getId());
	}

	@Test
	public void testRemoveEmployee() throws Exception {
		Employee employee = new Employee();
		String testName = "testName";
		employee.setName(testName);
		String testSurname = "testSurname";
		employee.setSurname(testSurname);
		employeeService.addNewEmployee(employee);
		Employee findEmployee = employeeService.getEmployee().stream()
				.filter(employee1 ->
						Objects.equals(employee1.getName(), testName) &
								Objects.equals(employee1.getSurname(), testSurname))
				.findAny()
				.orElse(null);
		employeeService.removeEmployee(findEmployee.getId());
		Assert.assertNull(employeeService.getEmployeeById(findEmployee.getId()));
	}
}