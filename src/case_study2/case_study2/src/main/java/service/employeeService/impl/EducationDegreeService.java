package service.employeeService.impl;

import model.employee.EducationDegree;
import repository.impl.employeeRepository.IEducationDegreeRepository;
import repository.impl.employeeRepository.impl.EducationDegreeRepository;
import service.employeeService.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();

    @Override
    public List<EducationDegree> findAllEducationDegree() {
        return educationDegreeRepository.findAllEducationDegree();
    }
}
