using antrentStat.ADOApp;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using _excel = Microsoft.Office.Interop.Excel;
using Page = System.Windows.Controls.Page;

namespace antrentStat.ClassApp
{
    public class ClassAll
    {
        public static Users CorrUser { get; set; }
        public static void ExportFalse()
        {
            var _list = App.Connection.applicants.Where(z=>z.Color_id==1).ToList();
            _Application excel = new _excel.Application();
            Workbook _wb;
            Worksheet _ws;
            _wb = excel.Workbooks.Add();
            _ws = _wb.Worksheets[1];
            _ws.Name = "не принятые";
            _ws.Cells[1, 1].Value2 = "номер";
            _ws.Cells[1, 2].Value2 = "абитуриент";
            _ws.Cells[1, 3].Value2 = "дата рождения";
            _ws.Cells[1, 4].Value2 = "пол";
            _ws.Cells[1, 5].Value2 = "средний бал";
            _ws.Cells[1, 6].Value2 = "целевое направление";
            _ws.Cells[1, 7].Value2 = "спортивные достижения";
            _ws.Cells[1, 8].Value2 = "номер телефона";
            var j = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = _ws.Cells[j, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = _ws.Cells[j, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                _ws.Cells[j, 1].Value2 = index.id_app;
                _ws.Cells[j, 2].Value2 = index.FullName;
                _ws.Cells[j, 3].Value2 = index.DateBirt;
                _ws.Cells[j, 4].Value2 = index.Gender.title;
                _ws.Cells[j, 5].Value2 = index.GPA;
                _ws.Cells[j, 6].Value2 = index.IsTarget;
                _ws.Cells[j, 7].Value2 = index.isAchievement;
                _ws.Cells[j, 8].Value2 = index.Phone;
                _ws.Cells[j+1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    _ws.Cells[j+2, i].Value2 = indexer.academics.Title;
                    _ws.Cells[j+3, i].Value2 = indexer.result;

                    i++;
                }
                j++;
                j++;
                j++;
                j++;
                j++;
            }
            _wb.SaveAs("Сипсок не приянтых.xlsx");
            _wb.Close();
            MessageBox.Show("Список сохранён в папке документы");
        }
        public static void ExportTrue()
        {
            var _list = App.Connection.applicants.Where(z => z.Color_id == 2).ToList();
            _Application excel = new _excel.Application();
            Workbook _wb;
            Worksheet _ws;
            _wb = excel.Workbooks.Add();
            _ws = _wb.Worksheets[1];
            _ws.Name = "принятые";
            _ws.Cells[1, 1].Value2 = "номер";
            _ws.Cells[1, 2].Value2 = "абитуриент";
            _ws.Cells[1, 3].Value2 = "дата рождения";
            _ws.Cells[1, 4].Value2 = "пол";
            _ws.Cells[1, 5].Value2 = "средний бал";
            _ws.Cells[1, 6].Value2 = "целевое направление";
            _ws.Cells[1, 7].Value2 = "спортивные достижения";
            _ws.Cells[1, 8].Value2 = "номер телефона";
         
            var j = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = _ws.Cells[j, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = _ws.Cells[j, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                _ws.Cells[j, 1].Value2 = index.id_app;
                _ws.Cells[j, 2].Value2 = index.FullName;
                _ws.Cells[j, 3].Value2 = index.DateBirt.Date.Date;
                _ws.Cells[j, 4].Value2 = index.Gender.title;
                _ws.Cells[j, 5].Value2 = index.GPA;
                _ws.Cells[j, 6].Value2 = index.IsTarget;
                _ws.Cells[j, 7].Value2 = index.isAchievement;
                _ws.Cells[j, 8].Value2 = index.Phone;
                _ws.Cells[j + 1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    _ws.Cells[j + 2, i].Value2 = indexer.academics.Title;
                    _ws.Cells[j + 3, i].Value2 = indexer.result;

                    i++;
                }
                j++;
                j++;
                j++;
                j++;
                j++;
            }
            
            _wb.SaveAs("Сипсок приянтых.xlsx");
            _wb.Close();
            MessageBox.Show("Список сохранён в папке документы");
        }
        public static void ExportAll()
        {
            var _list = App.Connection.applicants.Where(z => z.Color_id !=1 && z.Color_id!=2).ToList();
            _Application excel = new _excel.Application();
            Workbook _wb;
            Worksheet _ws;
            _wb = excel.Workbooks.Add();
            _ws = _wb.Worksheets[1];
            _ws.Name = "на рассмотрений";
            _ws.Cells[1, 1].Value2 = "номер";
            _ws.Cells[1, 2].Value2 = "абитуриент";
            _ws.Cells[1, 3].Value2 = "дата рождения";
            _ws.Cells[1, 4].Value2 = "пол";
            _ws.Cells[1, 5].Value2 = "средний бал";
            _ws.Cells[1, 6].Value2 = "целевое направление";
            _ws.Cells[1, 7].Value2 = "спортивные достижения";
            _ws.Cells[1, 8].Value2 = "номер телефона";
            var j = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = _ws.Cells[j, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = _ws.Cells[j, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                _ws.Cells[j, 1].Value2 = index.id_app;
                _ws.Cells[j, 2].Value2 = index.FullName;
                _ws.Cells[j, 3].Value2 = index.DateBirt;
                _ws.Cells[j, 4].Value2 = index.Gender.title;
                _ws.Cells[j, 5].Value2 = index.GPA;
                _ws.Cells[j, 6].Value2 = index.IsTarget;
                _ws.Cells[j, 7].Value2 = index.isAchievement;
                _ws.Cells[j, 8].Value2 = index.Phone;
                _ws.Cells[j + 1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    _ws.Cells[j + 2, i].Value2 = indexer.academics.Title;
                    _ws.Cells[j + 3, i].Value2 = indexer.result;

                    i++;
                }
                j++;
                j++;
                j++;
                j++;
                j++;
            }
            _wb.SaveAs("Сипсок.xlsx");
            _wb.Close();
            MessageBox.Show("Список сохранён в папке документы");
        }
        public static void ExportFull()
        {
            _Application excel = new _excel.Application();
            Workbook _wb;
            Worksheet _ws;
            Worksheet __ws;
            Worksheet ___ws;
           
            var _list = App.Connection.applicants.Where(z => z.Color_id != 1 && z.Color_id != 2).ToList();
            _wb = excel.Workbooks.Add();
            _ws = _wb.Worksheets.Add();
            __ws = _wb.Worksheets.Add();
            ___ws = _wb.Worksheets.Add();
            _ws.Name = "на рассмотрений";
            _ws.Cells[1, 1].Value2 = "номер";
            _ws.Cells[1, 2].Value2 = "абитуриент";
            _ws.Cells[1, 3].Value2 = "дата рождения";
            _ws.Cells[1, 4].Value2 = "пол";
            _ws.Cells[1, 5].Value2 = "средний бал";
            _ws.Cells[1, 6].Value2 = "целевое направление";
            _ws.Cells[1, 7].Value2 = "спортивные достижения";
            _ws.Cells[1, 8].Value2 = "номер телефона";
            var j = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = _ws.Cells[j, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = _ws.Cells[j, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                _ws.Cells[j, 1].Value2 = index.id_app;
                _ws.Cells[j, 2].Value2 = index.FullName;
                _ws.Cells[j, 3].Value2 = index.DateBirt;
                _ws.Cells[j, 4].Value2 = index.Gender.title;
                _ws.Cells[j, 5].Value2 = index.GPA;
                _ws.Cells[j, 6].Value2 = index.IsTarget;
                _ws.Cells[j, 7].Value2 = index.isAchievement;
                _ws.Cells[j, 8].Value2 = index.Phone;
                _ws.Cells[j + 1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    _ws.Cells[j + 2, i].Value2 = indexer.academics.Title;
                    _ws.Cells[j + 3, i].Value2 = indexer.result;

                    i++;
                }
                j++;
                j++;
                j++;
                j++;
                j++;
            }
            _list = App.Connection.applicants.Where(z => z.Color_id == 2).ToList();
            __ws.Name = "принятые";
            __ws.Cells[1, 1].Value2 = "номер";
            __ws.Cells[1, 2].Value2 = "абитуриент";
            __ws.Cells[1, 3].Value2 = "дата рождения";
            __ws.Cells[1, 4].Value2 = "пол";
            __ws.Cells[1, 5].Value2 = "средний бал";
            __ws.Cells[1, 6].Value2 = "целевое направление";
            __ws.Cells[1, 7].Value2 = "спортивные достижения";
            __ws.Cells[1, 8].Value2 = "номер телефона";
            var k = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = __ws.Cells[k, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = __ws.Cells[k, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                __ws.Cells[k, 1].Value2 = index.id_app;
                __ws.Cells[k, 2].Value2 = index.FullName;
                __ws.Cells[k, 3].Value2 = index.DateBirt.Date.Date;
                __ws.Cells[k, 4].Value2 = index.Gender.title;
                __ws.Cells[k, 5].Value2 = index.GPA;
                __ws.Cells[k, 6].Value2 = index.IsTarget;
                __ws.Cells[k, 7].Value2 = index.isAchievement;
                __ws.Cells[k, 8].Value2 = Convert.ToDouble(index.Phone);
                __ws.Cells[k + 1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    __ws.Cells[k + 2, i].Value2 = indexer.academics.Title;
                    __ws.Cells[k + 3, i].Value2 = indexer.result;

                    i++;
                }
                k++;
                k++;
                k++;
                k++;
                k++;
            }
            _list = App.Connection.applicants.Where(z => z.Color_id == 1 ).ToList();
            ___ws.Name = "не принятые";
            ___ws.Cells[1, 1].Value2 = "номер";
            ___ws.Cells[1, 2].Value2 = "абитуриент";
            ___ws.Cells[1, 3].Value2 = "дата рождения";
            ___ws.Cells[1, 4].Value2 = "пол";
            ___ws.Cells[1, 5].Value2 = "средний бал";
            ___ws.Cells[1, 6].Value2 = "целевое направление";
            ___ws.Cells[1, 7].Value2 = "спортивные достижения";
            ___ws.Cells[1, 8].Value2 = "номер телефона";
            var l = 2;
            foreach (var index in _list)
            {
                _excel.Range column_date = ___ws.Cells[l, 3];
                column_date.NumberFormat = "yyyy:MM:dd";
                _excel.Range column_phone = ___ws.Cells[l, 8];
                column_phone.NumberFormat = "## ### ## ## ##";
                ___ws.Cells[l, 1].Value2 = index.id_app;
                ___ws.Cells[l, 2].Value2 = index.FullName;
                ___ws.Cells[l, 3].Value2 = index.DateBirt;
                ___ws.Cells[l, 4].Value2 = index.Gender.title;
                ___ws.Cells[l, 5].Value2 = index.GPA;
                ___ws.Cells[l, 6].Value2 = index.IsTarget;
                ___ws.Cells[l, 7].Value2 = index.isAchievement;
                ___ws.Cells[l, 8].Value2 = index.Phone;
                ___ws.Cells[l + 1, 1].Value2 = "Предметы";
                var i = 1;
                foreach (var indexer in App.Connection.academicApplicant.Where(z => z.app_id == index.id_app).ToList())
                {
                    ___ws.Cells[l + 2, i].Value2 = indexer.academics.Title;
                    ___ws.Cells[l + 3, i].Value2 = indexer.result;

                    i++;
                }
                l++;
                l++;
                l++;
                l++;
                l++;
            }
            _wb.SaveAs("Сипсок всего.xlsx");
            _wb.Close();
            MessageBox.Show("Список сохранён в папке документы");
        }

    }
}
