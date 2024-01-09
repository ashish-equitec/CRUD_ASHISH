using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using WebApplicationCrud.Models;

namespace WebApplicationCrud.Repository
{
    public class EmpRepository
    {
        private readonly string dbString;

        public EmpRepository(string connectionString)
        {
            dbString = connectionString;
        }

        private IDbConnection GetDbConnection()
        {
            IDbConnection dbConnection = new SqlConnection(dbString);
            dbConnection.Open();
            return dbConnection;
        }

        public void AddEmployee(Employee emp)
        {
            try
            {
                using (IDbConnection dbConnection = GetDbConnection())
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("Name", emp.Name);
                    parameters.Add("DOB", emp.DOB);
                    parameters.Add("Location", emp.Location);
                    parameters.Add("Designation", emp.Designation);
                    parameters.Add("Email_Address", emp.Email_Address);
                    parameters.Add("Deleted", true);

                    dbConnection.Execute("EmployeeAdd", parameters, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Employee> GetAllEmployee()
        {
            try
            {
                using (IDbConnection dbConnection = GetDbConnection())
                {
                    return dbConnection.Query<Employee>("EmployeeView", commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void UpdateEmployee(Employee emp)
        {
            try
            {
                using (IDbConnection dbConnection = GetDbConnection())
                {
                    emp.Deleted = true;

                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("ID", emp.Id);
                    parameters.Add("Name", emp.Name);
                    parameters.Add("DOB", emp.DOB);
                    parameters.Add("Location", emp.Location);
                    parameters.Add("Designation", emp.Designation);
                    parameters.Add("Email_Address", emp.Email_Address);
                    parameters.Add("Deleted", true);

                    dbConnection.Execute("EmployeeUpdate", parameters, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool DeleteEmployee(int Id)
        {
            try
            {
                using (IDbConnection dbConnection = GetDbConnection())
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@ID", Id);

                    dbConnection.Execute("EmployeeDeleteByID", parameters, commandType: CommandType.StoredProcedure);
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
