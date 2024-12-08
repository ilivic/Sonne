using antrentStat.ADOApp;
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
    /// Логика взаимодействия для PageMain.xaml
    /// </summary>
    public partial class PageMain : Page
    {
        public static List<applicants> _applicants {  get; set; }
        public PageMain()
        {
            InitializeComponent();
            
            refresh();
        }
        private void refresh()
        {
            _applicants = new List<applicants>(App.Connection.applicants.Where(z => z.Color_id != 1 && z.Color_id != 2).ToList());
            ListApp.ItemsSource = _applicants.ToList();
            LblCounter.Content = _applicants.Count;
        }
        private void ClEventInfo(object sender, RoutedEventArgs e)
        {
            var _sel = (sender as Button).DataContext as applicants;
            if (_sel != null) 
            {
                NavigationService.Navigate(new PageShow(_sel));
            }
        }

        private void TxtSerch_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (TxtSerch.Text != "")
            {
                _applicants = _applicants.Where(z=>z.FullName.Contains(TxtSerch.Text)).ToList();
                ListApp.ItemsSource = _applicants.ToList();
                LblCounter.Content = _applicants.Count;
            }
            else 
            {
                refresh();
            }
        }

        private void FiltreFName(object sender, RoutedEventArgs e)
        {
            ListApp.ItemsSource = _applicants.OrderBy(z=>z.FullName).ToList();
        }

        private void FiltreGPA(object sender, RoutedEventArgs e)
        {
            ListApp.ItemsSource = _applicants.OrderBy(z=>z.GPA).ToList();
        }

        private void FiltreDate(object sender, RoutedEventArgs e)
        {
            ListApp.ItemsSource = _applicants.OrderBy(z=>z.dateCreate).ToList();
        }

        private void CMBTarget_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CMBTarget.SelectedValue != null)
            {
                var _sel = (CMBTarget.SelectedValue as ComboBoxItem).Content;
                switch (_sel.ToString())
                {
                    case "Целевеки":
                        {
                            refresh();
                            _applicants = _applicants.Where(z => z.IsTarget == true).ToList();
                            ListApp.ItemsSource = _applicants.ToList();
                            break;
                        }
                    case "спортивники":
                        {
                            refresh();
                            _applicants = _applicants.Where(z => z.isAchievement == true).ToList();
                            ListApp.ItemsSource = _applicants.ToList();
                            break;
                        }
                    case "Целевеки и спортивники":
                        {
                            refresh();
                            _applicants = _applicants.Where(z=>z.IsTarget ==true && z.isAchievement== true).ToList();
                            ListApp.ItemsSource = _applicants.ToList();
                            break;
                        }
                    case "все":
                        {
                            refresh();
                            break;
                        }
                }
            }
        }

        private void ClEventExit(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Закрыть приложение?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            { 
                App.Current.MainWindow.Close();
            }
        }

        private void ClEventPulse(object sender, RoutedEventArgs e)
        {
            var _sel = (sender as Button).DataContext as applicants;
            _sel.Color_id = 2;
            App.Connection.acceptance.Add(new acceptance()
            {
                DateAnswer = DateTime.Now.Date,
                Users = ClassAll.CorrUser,
                applicants = _sel,
                Result = true,
                Comment = "Успешно принят на собеседование",
                Color_id = 2
            });
            App.Connection.SaveChanges();
            refresh();
        }

        private void ClEventMainus(object sender, RoutedEventArgs e)
        {
            var _sel = (sender as Button).DataContext as applicants;
            _sel.Color_id = 1;
            App.Connection.acceptance.Add(new acceptance()
            {
                DateAnswer = DateTime.Now.Date,
                Users = ClassAll.CorrUser,
                applicants = _sel,
                Result = false,
                Comment = "Отказ",
                Color_id = 1
            });
            App.Connection.SaveChanges();
            refresh();
        }

        private void ClEventExportPulse(object sender, RoutedEventArgs e)
        {
            ClassAll.ExportTrue();
        }

        private void ClEventExportMainus(object sender, RoutedEventArgs e)
        {
            ClassAll.ExportFalse();
        }

        private void ClEventChec(object sender, RoutedEventArgs e)
        {
            ClassAll.ExportAll();
        }

        private void ClEventAll(object sender, RoutedEventArgs e)
        {
            ClassAll.ExportFull();
        }
    }
}
