using System.Windows;

using TradeApp.ViewModel;

namespace TradeApp.View.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow  {

        public AuthorizationWindow()
        {
            InitializeComponent();
            this.DataContext = new AuthVM();
            
        }

        private async void btnSignIn_Click(object sender, RoutedEventArgs e) {

            (DataContext as AuthVM).Password = password.Password;

            var user = await (DataContext as AuthVM).ValidateUser();
            if (user == 1) {

                new AdminWindow().Show();
                
                this.Hide();
            }
            
            else if (user == 3) {

                new ClientWindow().Show();
                
                this.Hide();
            }
            else {

                MessageBox.Show("Неверный логин или пароль", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        
        private void btnGuest_Click(object sender, RoutedEventArgs e) { 

            new ClientWindow().Show();

            this.Hide();
        }
    }
}
