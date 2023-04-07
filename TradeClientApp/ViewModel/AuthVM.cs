using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TradeApp.Model.Database;

namespace TradeApp.ViewModel
{
    internal class AuthVM : BaseVM {

        private string _login;
        private string _password;
        private string _buttonSignIn = "Войти";
        private string _buttonGuest = "Войти как гость";

        public string Password {
            get => _password;
            set {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public string Login {

            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }

        public string ButtonSignIn {

            get => _buttonSignIn;
            set {
                _buttonSignIn = value;
                OnPropertyChanged(nameof(ButtonSignIn));
            }
        }

        public string ButtonGuest {

            get => _buttonGuest;
            set {

                _buttonGuest = value;
                OnPropertyChanged(nameof(ButtonGuest));
            }
        }

        public async Task<int> ValidateUser() {

            try {

                ButtonSignIn = "Идёт подключение...";

                using (TradeEntities context = new TradeEntities()) {

                    var user = await context.User.FirstOrDefaultAsync(u => u.Login == _login && u.Password == _password);

                    if (user != null) {

                        return user.Role;
                    }
                    else {

                        return 0;
                    }

                }
            }
            catch (Exception ex) {

                MessageBox.Show(ex.Message, "Ошибка соединения", MessageBoxButton.OK, MessageBoxImage.Stop);

                return 0;
            }
            finally {

                ButtonSignIn = "Войти";
            }

        }
    }
}
