Factory.sequence :form do |n|
  "Form_#{n}"
end

Factory.define :form do |form|
  form.name { Factory.next :form }
end