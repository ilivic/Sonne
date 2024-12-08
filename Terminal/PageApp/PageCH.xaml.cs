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

namespace Terminal.PageApp
{
    /// <summary>
    /// Логика взаимодействия для PageCH.xaml
    /// </summary>
    public partial class PageCH : Page
    {
        public PageCH()
        {
            InitializeComponent();
        }

        private void ClEventCreate(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageMain());
        }

        private void ClEventTakeAnswer(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageTakeAnswer());

        }
    }
}
