using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCStoreFront.UI.Models;

namespace MVCStoreFront.UI.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart --This action will generate a view with a list of CartItemViewModel objects
        public ActionResult Index()
        {
            //pull session-based cart info into a local variable that we can pass to the view

            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Does the shoppingCart exist and have items in it?
            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //The user hasn't put anything in their cart, or they removed all items, or session expired
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                //Create message about empty cart
                ViewBag.Message = "Your cart is empty :( Let's change that!";
            }
            else
            {
                ViewBag.Message = null;
            }

            return View(shoppingCart);
        }

        public ActionResult UpdateCart(int productID, int qty)  
        {
            //get the cart from session and place its value in a local shoppingCart variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //target correct cartItem using bookID for key - then change the qty property with the qty parameter
            shoppingCart[productID].Qty = qty;

            //return the local cart to the session and redirect the user back to shoppingCart to see their changes
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int id)
        {
            //get the cart from session and place it in a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //remove the item from the local cart
            shoppingCart.Remove(id);

            //Update session
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }
    }
}