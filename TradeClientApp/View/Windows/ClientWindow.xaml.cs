﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using TradeApp.ViewModel;

namespace TradeApp.View.Windows 
{
    /// <summary>
    /// Логика взаимодействия для ClientWindow.xaml
    /// </summary>
    public partial class ClientWindow : Window {

        public ClientWindow() { 

            InitializeComponent();
            this.DataContext = new ClientVM();
        }
        
    }
}
