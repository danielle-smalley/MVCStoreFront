using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCStoreFront.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace MVCStoreFront.UI.Models
{
    public class CartItemViewModel
    {
        //Added this ViewModel to combine Domain-related info (Product) with other info (int Qty) - therefor this is a ViewModel
            [Range(1, int.MaxValue)]//ensures the values in the cart are greater than 0
            public int Qty { get; set; }

            public Product Product { get; set; }

            //fqctor
            public CartItemViewModel(int qty, Product product)
            {
                //Prop = param
                Qty = qty;
                Product = product;
            }
    }
}