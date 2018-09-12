class EmployeesController < ApplicationController
  def employee_params
    params.require('employee').permit(%I[first_name last_name email])
  end
end
