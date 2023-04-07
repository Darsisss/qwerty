//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TradeApp.Model.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Order = new HashSet<Order>();
        }
    
        public string ArticleNumber { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public string Photo { get; set; }
        public int ManufacturerId { get; set; }
        public decimal Cost { get; set; }
        public Nullable<int> DiscountAmount { get; set; }
        public int QuantityInStock { get; set; }
        public Nullable<int> MaxDiscountAmount { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Manufacter Manufacter { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
    }
}
