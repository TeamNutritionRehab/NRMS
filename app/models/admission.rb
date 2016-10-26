class Admission < ActiveRecord::Base
	belongs_to :child

#///////////////////////////////////////////////////////////////////
	scope :Is_muac, lambda{where(:admission_criteria => "muac")}
	scope :Is_z_score, lambda{where(:admission_criteria => "z_score")}
	scope :Is_oedema, lambda{where(:admission_criteria => "bilateral_oedema")}
	scope :Is_bmi, lambda{where(:admission_criteria => "bmi_for_age")}

#////////////////////////////////////////////////////////////////////
	#Validations
	as_enum :admission_type, [:new_admission, :relapse, :readmission], map: :string, source: :admission_type 
	as_enum :admission_criteria, [:muac, :z_score, :bilateral_oedema, :bmi_for_age, :other], map: :string, source: :admission_criteria
#////////////////////////////////////////////////////////////////////
end
