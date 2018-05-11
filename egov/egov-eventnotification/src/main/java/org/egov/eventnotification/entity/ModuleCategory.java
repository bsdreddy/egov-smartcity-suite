package org.egov.eventnotification.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "egevntnotification_category")
@SequenceGenerator(name = ModuleCategory.SEQ_EGEVNTNOTIFICATION_CATEGORY, sequenceName = ModuleCategory.SEQ_EGEVNTNOTIFICATION_CATEGORY, allocationSize = 1)
public class ModuleCategory {

    public static final String SEQ_EGEVNTNOTIFICATION_CATEGORY = "seq_egevntnotification_category";
    
    @Id
    @GeneratedValue(generator = SEQ_EGEVNTNOTIFICATION_CATEGORY, strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    @Length(max = 100)
    private String name;

    @NotNull
    private Boolean active;
    
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "module_id")
    private TemplateModule module;

	public TemplateModule getModule() {
		return module;
	}

	public void setModule(TemplateModule module) {
		this.module = module;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
    
    
}
