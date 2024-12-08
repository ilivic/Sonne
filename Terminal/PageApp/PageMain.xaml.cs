using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using Terminal.ADOApp;

namespace Terminal.PageApp
{
    /// <summary>
    /// Логика взаимодействия для PageMain.xaml
    /// </summary>
    public partial class PageMain : Page
    {
        private static readonly Regex onlyNumbers = new Regex("[^0-9]+"); 
        public static List<academics> _academics {  get; set; }
        public static List<GPACall> _gpa {  get; set; }
        public PageMain()
        {
            InitializeComponent();
            _academics = new List<academics>();
            CMBAcademic.ItemsSource = App.Connection.academics.ToList();
            CMBGender.ItemsSource = App.Connection.Gender.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            _gpa = new List<GPACall>();
            foreach (var index in _academics.ToList())
            {
                _gpa.Add(new GPACall
                {
                    academics = index,
                    Title = index.Title,
                    result = 0,
                });

            }
            ListGPA.ItemsSource = _gpa;

        }
        public class GPACall
        {
            public ADOApp.academics academics { get; set; }
            public string Title{ get; set; }
            public double result { get; set; }

        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            var _sel = (sender as CheckBox).DataContext as ADOApp.academics;
            _academics.Add(_sel);
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            var _sel = (sender as CheckBox).DataContext as ADOApp.academics;
            _academics.Remove(_sel);
        }

        private void ClEventCreatePush(object sender, RoutedEventArgs e)
        {
            //try
            // {
            if (TxtName.Text != "" && TxtPhone.Text != "" && CMBGender.SelectedItem != null && _gpa.Count != 0)
            {
                int color = 0;
                if (CHAchivment.IsChecked.Value == false && CHTarger.IsChecked.Value == false)
                {
                    color = 6;
                }
                else if (CHAchivment.IsChecked.Value == false && CHTarger.IsChecked.Value == true)
                {
                    color = 3;
                }
                else if (CHAchivment.IsChecked.Value == true && CHTarger.IsChecked.Value == false)
                {
                    color = 4;
                }
                else
                {
                    color = 5;
                }
                var _gender = (CMBGender.SelectedItem) as Gender;
                applicants _new = new applicants()
                {
                    FullName = TxtName.Text,
                    DateBirt = DPBirt.SelectedDate.Value.Date.Date,
                    dateCreate = DateTime.Now.Date.Date,
                    Color_id = color,
                    Phone = TxtPhone.Text,
                    IsTarget = CHTarger.IsChecked.Value,
                    isAchievement = CHAchivment.IsChecked.Value,
                    Gender_id = _gender.id_gender,
                    GPA = 0

                };
                App.Connection.applicants.Add(_new);
                App.Connection.SaveChanges();
                double _summ = 0;
                foreach (var index in _gpa)
                {
                    App.Connection.academicApplicant.Add(new academicApplicant()
                    {
                        academics = index.academics,
                        result = index.result,
                        applicants = _new
                    });
                    _summ += index.result;
                };
                _new.GPA = (_summ / _gpa.Count);
                App.Connection.SaveChanges();
                MessageBox.Show($"ваш код {_new.id_app}");
                NavigationService.GoBack();
            }
            // }
            //catch (Exception ex) 
            //{
            //   MessageBox.Show(ex.Message);
            //}
        }

        private static bool IsTextAllowed(string text)
        {
            return !onlyNumbers.IsMatch(text);
        }

        private void TxtPhone_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text);
        }
    }
}
