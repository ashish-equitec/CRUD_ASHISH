using ClosedXML.Excel;
using Dapper;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using WebApplicationCrud.Models;
using WebApplicationCrud.Repository;

namespace WebApplicationCrud.Controllers
{
    public class EmployeeController : Controller
    {
        static readonly string dBConnectionString = @"Data Source=DESKTOP-P83R1FH;Initial Catalog=CRUDOPERATION;User ID=sa;Password=123;";
        private EmpRepository employeeRepository = new EmpRepository(dBConnectionString);

        public ActionResult GetAllEmployeeDetails(string sortOrder, int? page, int? pageSize)
        {
            ViewBag.NameSortParam = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.DOBSortParam = sortOrder == "dob" ? "dob_desc" : "dob";
            ViewBag.LocationSortParam = sortOrder == "location" ? "location_desc" : "location";
            ViewBag.DesignationSortParam = sortOrder == "designation" ? "designation_desc" : "designation";
            ViewBag.EmailSortParam = sortOrder == "email" ? "email_desc" : "email";

            var employees = employeeRepository.GetAllEmployee();

            switch (sortOrder)
            {
                case "name_desc":
                    employees = employees.OrderByDescending(e => e.Name).ToList();
                    break;
                case "dob":
                    employees = employees.OrderBy(e => e.DOB).ToList();
                    break;
                case "dob_desc":
                    employees = employees.OrderByDescending(e => e.DOB).ToList();
                    break;
                case "location":
                    employees = employees.OrderBy(e => e.Location).ToList();
                    break;
                case "location_desc":
                    employees = employees.OrderByDescending(e => e.Location).ToList();
                    break;
                case "designation":
                    employees = employees.OrderBy(e => e.Designation).ToList();
                    break;
                case "designation_desc":
                    employees = employees.OrderByDescending(e => e.Designation).ToList();
                    break;
                case "email":
                    employees = employees.OrderBy(e => e.Email_Address).ToList();
                    break;
                case "email_desc":
                    employees = employees.OrderByDescending(e => e.Email_Address).ToList();
                    break;
                default:
                    employees = employees.OrderBy(e => e.Name).ToList();
                    break;
            }

            int pageSizeValue = pageSize ?? 4;
            int pageNumber = (page ?? 1);

            ViewBag.PageSizeList = new SelectList(new[] { 4,3, 5, 10, 25, 50, 100 }, pageSizeValue);
            ViewBag.PageSize = pageSizeValue;

            var pagedEmployees = employees.ToPagedList(pageNumber, pageSizeValue);


            return View(pagedEmployees);
        }

        public ActionResult AddEmployee()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddEmployee(Employee emp)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    emp.Deleted = true;
                    employeeRepository.AddEmployee(emp);
                    return View(emp);
                }
                return RedirectToAction("GetAllEmployeeDetails");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditEmployeeDetails(int id)
        {

            return View(employeeRepository.GetAllEmployee().Find(emp => emp.Id == id));
        }

        [HttpPost]
        public ActionResult EditEmployeeDetails(Employee obj)
        {
            try
            {
                employeeRepository.UpdateEmployee(obj);
                return RedirectToAction("GetAllEmployeeDetails");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult DeleteEmployee(int Id)
        {
            try
            {
                if (employeeRepository.DeleteEmployee(Id))
                {
                    ViewBag.AlertMsg = "Employee details deleted successfully";
                }
                return RedirectToAction("GetAllEmployeeDetails");
            }
            catch
            {
                return RedirectToAction("GetAllEmployeeDetails");
            }
        }
        public ActionResult ExportToExcel()
        {
            var employees = employeeRepository.GetAllEmployee();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Employees");

                worksheet.Cell(1, 1).Value = "ID";
                worksheet.Cell(1, 2).Value = "Name";
                worksheet.Cell(1, 3).Value = "DOB";
                worksheet.Cell(1, 4).Value = "Location";
                worksheet.Cell(1, 5).Value = "Designation";
                worksheet.Cell(1, 6).Value = "Email Address";

                int row = 2;
                foreach (var emp in employees)
                {
                    worksheet.Cell(row, 1).Value = emp.Id;
                    worksheet.Cell(row, 2).Value = emp.Name;
                    worksheet.Cell(row, 3).Value = emp.DOB;
                    worksheet.Cell(row, 4).Value = emp.Location;
                    worksheet.Cell(row, 5).Value = emp.Designation;
                    worksheet.Cell(row, 6).Value = emp.Email_Address;

                    row++;
                }

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    stream.Position = 0;

                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Employees.xlsx");
                }
            }
        }

        public ActionResult EmployeeDetails(int id)
        {

            return View(employeeRepository.GetAllEmployee().Find(emp => emp.Id == id));
        }

        [HttpPost]
        public ActionResult EmployeeDetails(Employee obj)
        {
            try
            {
                employeeRepository.UpdateEmployee(obj);
                return RedirectToAction("GetAllEmployeeDetails");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult SoftDeletedEmployee()
        {
            using (IDbConnection dbConnection = new SqlConnection(dBConnectionString))
            {
                dbConnection.Open();
                IList<Employee> EmployeeList = dbConnection.Query<Employee>("EmployeeSoftDelete", commandType: CommandType.StoredProcedure).ToList();
                return View(EmployeeList);
            }
        }

        public ActionResult RestoreEmployee(int ID)
        {
            using (IDbConnection dbConnection = new SqlConnection(dBConnectionString))
            {
                dbConnection.Open();
                _ = dbConnection.Query<Employee>("RestoreD", new { Id = ID }, commandType: CommandType.StoredProcedure).ToList();
                return RedirectToAction("GetAllEmployeeDetails");
            }
        }
    }
}