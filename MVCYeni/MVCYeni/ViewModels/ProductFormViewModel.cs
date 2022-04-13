using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCYeni.Models.EntityFramework;

namespace MVCYeni.ViewModels
{
    public class ProductFormViewModel
    {
        public IEnumerable<Products> products { get; set; }//departmanlar tanımladıkınterface ile

        public Categories categories { get; set; }//Personel
       
    }
}