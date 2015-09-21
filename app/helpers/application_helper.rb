module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'  ; 'alert-success'
      when 'error'    ; 'alert-error'
      when 'alert'    ; 'alert-block'
      when 'notice'   ; 'alert-info'
      when 'warning'  ;'alert-warning'
      when 'danger'   ; 'alert-danger'
      else flash_type.to_s
    end
  end

end
