package service.employeeService.impl;

import model.employee.EducationDegree;
import model.employee.Employee;

import repository.impl.employeeRepository.IEducationDegreeRepository;
import repository.impl.employeeRepository.IEmployeeRepository;
import repository.impl.employeeRepository.impl.EducationDegreeRepository;
import repository.impl.employeeRepository.impl.EmployeeRepository;

import service.employeeService.IEducationDegreeService;
import service.employeeService.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {

    IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> displayEmployee() {
        return employeeRepository.displayEmployee();
    }

    public static class EducationDegreeService implements IEducationDegreeService {
        IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();

        @Override
        public List<EducationDegree> findAllEducationDegree() {
            return educationDegreeRepository.findAllEducationDegree();
        }
    }
}