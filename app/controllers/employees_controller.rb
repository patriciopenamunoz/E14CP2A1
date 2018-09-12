class EmployeesController < ApplicationController
  def create
    Employee.create(employee_params)
  end

  def employee_params
    params.require('employee').permit(%I[first_name last_name email])
  end
end
