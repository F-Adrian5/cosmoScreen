using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Shapes;
using static cosmoScreen.Methods;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for felhasznalok.xaml
    /// </summary>
    public partial class felhasznalok : Window
    {
        public felhasznalok()
        {
            InitializeComponent();
            LoadData("SELECT * FROM users", users_datagrid);
        }

        private void films_menuItem_Click(object sender, RoutedEventArgs e)
        {
            films filmsWindow = new films();
            filmsWindow.Show();
            this.Hide();
        }

        private void buffet_menuItem_Click(object sender, RoutedEventArgs e)
        {
            bufe bufeWindow = new bufe();
            bufeWindow.Show();
            this.Hide();
        }

        private void actor_menuItem_Click(object sender, RoutedEventArgs e)
        {
            szineszek szineszekWindow = new szineszek();
            szineszekWindow.Show();
            this.Hide();
        }

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateInputs())
            {
                MessageBox.Show(
                    "Hibás adatbevitel! Ellenőrizd az e-mail címet.",
                    "Hiba",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);

                return;
            }


            string user_upload = $"INSERT INTO users(name,email,password) VALUES('{user_name_input.Text}','{email_input.Text}','{password_input.Text}')";
            executeQuery(user_upload);
            LoadData("SELECT * FROM users", users_datagrid);
        }

        private void InputChanged(object sender, TextChangedEventArgs e)
        {
            btn_upload.IsEnabled = ValidateInputs();
        }

        private bool ValidateInputs()
        {
            if (string.IsNullOrWhiteSpace(user_name_input.Text))
                return false;

            if (string.IsNullOrWhiteSpace(email_input.Text))
                return false;

            if (!IsValidEmail(email_input.Text))
                return false;

            if (string.IsNullOrWhiteSpace(password_input.Text))
                return false;

            if (!IsValidPassword(password_input.Text))
                return false;


            return true;
        }

        public static bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            return Regex.IsMatch(email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                RegexOptions.IgnoreCase);
        }

        public bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password))
                return false;

            return Regex.IsMatch(password,
                @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_+\-=?:]).{8,}$");

        }

        private int user_id = -1;
        private void users_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var user_name = "";
            var user_email = "";
            var user_password = "";
            DataRowView sor = (DataRowView)users_datagrid.SelectedItem;

            delete_data_btn.IsEnabled = true;
            edit_data_btn.IsEnabled = true;
            if (sor != null)
            {
                user_id = Convert.ToInt32(sor["id"]);
                user_name = sor["name"].ToString();
                user_email = sor["email"].ToString();
                user_password = sor["password"].ToString();
                user_name_input.Text = user_name;
                email_input.Text = user_email;
                password_input.Text = user_password;
            }
        }

        private void delete_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string torol = $"DELETE FROM users WHERE id ='{user_id}'";
            users_datagrid.SelectedItem = null;
            executeQuery(torol);
            LoadData("SELECT * FROM users", users_datagrid);
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE users SET name='{user_name_input.Text}', email='{email_input.Text}', password='{password_input.Text}' WHERE id='{user_id}'";
            executeQuery(sorfrissites);
            users_datagrid.SelectedItem = null;
            LoadData("SELECT * FROM users", users_datagrid);
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }

        private void logout_btn_Click(object sender, RoutedEventArgs e)
        {
            Logout(this);
        }
    }
}
