using System.ComponentModel.DataAnnotations;

namespace WebApplicationCrud.Models
{
    public class Employee
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }
        public string DOB { get; set; }

        [Required(ErrorMessage = "Location is required.")]
        public string Location { get; set; }
        public string Designation { get; set; }

        [Required(ErrorMessage = "Email_Address is required.")]
        public string Email_Address { get; set; }
        public bool Deleted { get; set; }

    }
}