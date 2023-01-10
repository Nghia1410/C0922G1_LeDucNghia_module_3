package repository.impl.employeeRepository;


import model.employee.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> findAllEducationDegree();
}