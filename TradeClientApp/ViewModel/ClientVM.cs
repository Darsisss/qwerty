using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TradeApp.Model.Database;

namespace TradeApp.ViewModel
{
    internal class ClientVM 
    {
        private ObservableCollection <Product> _products;

        public ObservableCollection <Product> Products {

            get { 

                return _products; 
            }
            set {
            
                _products = value;
                
            }
        }

        private void DataLoad() {

            using (TradeEntities context = new TradeEntities()) {

                var _productList = context.Product.ToList();
                _productList.ForEach(pL => Products.Add(pL));
            }
        }

        private void Initialize() {

            Products = new ObservableCollection <Product> ();
        }

        public ClientVM() {
        
            Initialize();
            DataLoad();
        }
                
    }
}
