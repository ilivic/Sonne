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
    /// Логика взаимодействия для PageTakeAnswer.xaml
    /// </summary>
    public partial class PageTakeAnswer : Page
    {
        public PageTakeAnswer()
        {
            InitializeComponent();
        }

        private void ClEventGetAnswer(object sender, RoutedEventArgs e)
        {
            try
            {
                if (TxtId.Text != "")
                {
                    var _sel = Convert.ToInt32(TxtId.Text);
                    var _result = App.Connection.acceptance.Where(z => z.app_id == _sel).FirstOrDefault();
                    if (_result != null)
                    {
                        if (_result.Result == true)
                        {
                            App.Current.MainWindow.Background = Brushes.Green;
                            MessageBox.Show(_result.Comment);
                            App.Current.MainWindow.Background = Brushes.White;
                            this.DataContext = _result;
                        }
                        else
                        {
                            App.Current.MainWindow.Background = Brushes.Maroon;
                            MessageBox.Show(_result.Comment);
                            App.Current.MainWindow.Background = Brushes.White;
                            this.DataContext = _result;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Вашу кандидатуру рассматривают");
                    }
                }
            
            }
            catch(Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ClEventRevers(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
