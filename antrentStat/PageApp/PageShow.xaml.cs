using antrentStat.ADOApp;
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
    /// Логика взаимодействия для PageShow.xaml
    /// </summary>
    public partial class PageShow : Page
    {
        public PageShow( applicants _sel)
        {
            InitializeComponent();
            this.DataContext = _sel;
            ListACAAPP.ItemsSource = App.Connection.academicApplicant.Where(z => z.app_id == _sel.id_app).ToList();
        }

        private void ClEventRevers(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
