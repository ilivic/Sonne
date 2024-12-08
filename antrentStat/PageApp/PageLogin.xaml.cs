using antrentStat.ClassApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace antrentStat.PageApp
{
    /// <summary>
    /// Логика взаимодействия для PageLogin.xaml
    /// </summary>
    public partial class PageLogin : Page
    {
        public PageLogin()
        {
            InitializeComponent();
        }

        private void ClEventAtho(object sender, RoutedEventArgs e)
        {
            if (TxtLog.Text != "" && TxtPass.Password != "")
            {
                var _user = App.Connection.Users.Where(z => z.Login == TxtLog.Text && z.password == TxtPass.Password).FirstOrDefault();
                if (_user != null)
                {
                    ClassAll.CorrUser = _user;
                    NavigationService.Navigate(new PageMain());
                }
                else
                {
                    MessageBox.Show("пользователя в системе не обнаружено");
                }
            }
            else 
            {
                MessageBox.Show("Нужен логин и пароль");
            }
        }
    }
}
