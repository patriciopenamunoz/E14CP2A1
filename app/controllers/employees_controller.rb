class EmployeesController < ApplicationController
  def create
    @company = Company.find(params['company_id'])
    @employee = @company.employees.create(employee_params)
    redirect_to @company, notice: 'Employee was successfully created.'
  end

  def destroy
    @company = Company.find(params[:company_id])
    Employee.delete(params[:id])
    redirect_to @company, notice: 'Employee was successfully removed.'
  end

  def employee_params
    params.require('employee').permit(%I[first_name last_name email area_id])
  end
end
