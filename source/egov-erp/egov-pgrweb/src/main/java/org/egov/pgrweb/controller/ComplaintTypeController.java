package org.egov.pgrweb.controller;

import org.egov.lib.rjbac.dept.Department;
import org.egov.lib.rjbac.dept.ejb.api.DepartmentService;
import org.egov.pgr.entity.ComplaintType;
import org.egov.pgr.service.ComplaintTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/complaint-type")
public class ComplaintTypeController {

    private DepartmentService departmentService;
    private ComplaintTypeService complaintTypeService;

    @Autowired
    public ComplaintTypeController(DepartmentService departmentService, ComplaintTypeService complaintTypeService) {
        this.departmentService = departmentService;
        this.complaintTypeService = complaintTypeService;
    }

    @ModelAttribute
    public ComplaintType createOrRetrieveComplaintType() {
        return new ComplaintType();
    }

    @ModelAttribute("departments")
    public List<Department> departments() {
        return departmentService.getAllDepartments();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String complaintType() {
        return "complaint-type";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String createComplaintType(@Valid @ModelAttribute ComplaintType complaintType, BindingResult errors, RedirectAttributes redirectAttrs) {
        if(errors.hasErrors()) {
            return "complaint-type";
        }

        complaintTypeService.createComplaintType(complaintType);
        redirectAttrs.addFlashAttribute("message", "Successfully created Complaint Type !");

        return "redirect:/complaint-type";
    }
}
