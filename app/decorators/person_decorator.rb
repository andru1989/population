module PersonDecorator

  def select_identification_types
    Person.identification_types.map do |name, _|
      [name.humanize, name]
    end
  end

  def select_genders
    Person.genders.map do |name, _|
      [name.humanize, name]
    end
  end

  def full_name
    [name, last_name].join(' ')
  end

end