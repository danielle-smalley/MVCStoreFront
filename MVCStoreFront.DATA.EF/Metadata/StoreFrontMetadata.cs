using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace MVCStoreFront.DATA.EF//.Metadata
{
    //class StoreFrontMetadata
    //{
    //}
    /*
 *General rules and standard practices for metadata:
 * 1. You must decide how to structure your metadata
 *      -You can have all metadata classes and associated partial classes in one file
 *      -You can split (into different files) the metadata for each table. Ex: book metadata and partial class in one file.
 *      
 * 2. Metadata classes MUST live in the same namespace as the original EF generated class. 
 * 3. Here are the steps to follow:
 * -Ensure that the metadata classes have the same namespace as the EF classes
 * -Create the metadata class and copy all properties from the EF class
 * -Apply the necessary metadata attributes
 * -Create the partial class with the exact same name as the EF class (casing and spelling)
 * -Apply the metadata class to the partial class
 */

    #region Department Metadata
    public class DepartmentMetadata
    {
        //public int DeptID { get; set; } - this is a PK

        [Required(ErrorMessage = "Department is required")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        [Display(Name = "Department")]
        public string DeptName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department 
    {

    }
    #endregion

    #region Employees Metadata
    public class EmployeeMetadata
    {
        //public int EmpID { get; set; } - PK

        [Required(ErrorMessage = "A department is required")]
        public int DeptID { get; set; } //FK

        [Required(ErrorMessage = "First name is required")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Job title is required")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        [Display(Name = "Job Title")]
        public string JobTitle { get; set; }

        [Required(ErrorMessage = "Hire date is required")]
        [Display(Name = "Date of Hire")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime HireDate { get; set; }

        [Required(ErrorMessage = "Phone is required")]
        [StringLength(15, ErrorMessage = "Phone number must be 15 characters or less (include dashes)")]
        public string Phone { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        public string Email { get; set; }

        //[DisplayFormat(NullDisplayText = "[N/A]")]
        //[Display(Name = "Direct Report")]
        //public Nullable<int> DirectReportID { get; set; } - Jenna suggested to leave this one out, will comment out for now
    }
    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee   
    {
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }
    }
    #endregion

    #region Product Metadata
    public class ProductMetadata
    {
        //public int ProductID { get; set; } -- PK

        [Required(ErrorMessage = "Product name is required")]
        [Display(Name = "Product Name")]
        [StringLength(100, ErrorMessage = "Value must be 100 characters or less")]
        [UIHint("MultilineText")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "A category is required")] //--- FK
        public int CategoryID { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(100, ErrorMessage = "Value must be 100 characters or less")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Price is required")] 
        [Range(0, (Double)decimal.MaxValue, ErrorMessage = "Value must be a valid number, 0 or larger")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Items per unit is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Items/unit must be a valid number, 1 or larger")]
        [Display(Name = "Items per Unit")]
        public int ItemsPerUnit { get; set; }

        [Required(ErrorMessage = "Units on Order is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Units on order must be a valid number, 0 or larger")]
        [Display(Name = "Units on Order")]
        public int UnitsOnOrder { get; set; }


        [Range(0, int.MaxValue, ErrorMessage = "Units sold must be a valid number, 0 or larger")]
        [Display(Name = "Units Sold")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public Nullable<int> UnitsSold { get; set; }

        [Required(ErrorMessage = "Units in Stock is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Units in stock must be a valid number, 0 or larger")]
        [Display(Name = "Units in Stock")]
        public int UnitsInStock { get; set; }

        [Required(ErrorMessage = "Stock status is required")] //--- FK
        public int StockStatusID { get; set; }

        [Display(Name = "Product Image")]
        // - handle all other validation manually in the controller
        public string Image { get; set; }

    }
    [MetadataType(typeof(ProductMetadata))] 
    public partial class Product
    {

    }
    #endregion

    #region ProductCategory Metadata
    public class ProductCategoryMetadata
    {
        //public int CategoryID { get; set; } -- PK

        [Required(ErrorMessage = "Category name is required")]
        [Display(Name = "Category")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        public string CategoryName { get; set; }
    }

    [MetadataType(typeof(ProductCategoryMetadata))]
    public partial class ProductCategory    
    {

    }

    #endregion

    #region StockStatus Metadata

    public class StockStatusMetadata
    {
        //public int StockStatusID { get; set; } -- PK

        [Required(ErrorMessage = "Stock Status is required")]
        [Display(Name = "Stock Status")]
        [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
        public string Status { get; set; }
    }

    [MetadataType(typeof(StockStatusMetadata))]
    public partial class StockStatus
    {

    }
    #endregion

}

