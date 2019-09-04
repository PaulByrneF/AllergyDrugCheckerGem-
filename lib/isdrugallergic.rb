class Checkallergy

  def self.check_allergy(presc_drug, allergies)

  #initialize variables
  @presc_drug = presc_drug 
  @allergies = allergies

  #if patient allergies are nil return false
  if @allergies.allergy_name.nil?

    status_code = 0
    status_message = "No allergy conflicts found with drug:"+@presc_drug

  #if patient has allergies
  else

    #if allergy_match? method returns true: return with conflict error
    if allergy_match?  
      status_code = 1
      status_message = "There was an allergy conflict with the proposed drug:"+@presc_drug

    #if allergy_match? method returns flase: return no conflict 
    else 
      status_code = 0
      status_message = "No allergy conflicts found with drug:"+@presc_drug
    end
  end
    
  #return response to the caller with the allergy conflict status
  return({"status_code":status_code, "status_message":status_message})

  end 
end


def allergy_match?
  #iterate through each patient allergy and compare to prescription drug
  @allergies.each do |allergy|

    # puts("\n\n\n"+allergy.downcase+" <==> "+@presc_drug.downcase+"\n\n\n")
    if allergy.allergy_name.downcase.eql? @presc_drug.downcase
      return true
      break
    else
      # puts("Allergic conflict not found")
      return false
    end

  end
end