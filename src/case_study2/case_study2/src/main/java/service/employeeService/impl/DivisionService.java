package service.employeeService.impl;


import model.employee.Division;
import repository.impl.employeeRepository.IDivisionRepository;
import repository.impl.employeeRepository.impl.DivisionRepository;
import service.employeeService.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    IDivisionRepository divisionRepository = new DivisionRepository();

    @Override
    public List<Division> findAllDivision() {
        return divisionRepository.findAllDivision();
    }
}
