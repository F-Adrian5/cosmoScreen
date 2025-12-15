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

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for felhasznalok.xaml
    /// </summary>
    public partial class felhasznalok : Window
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;database=cosmoscreen;uid=root");
        MySqlCommand command;
        public felhasznalok()
        {
            InitializeComponent();
        }

        public void openConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        public void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
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

        public void executeQuery(string query)
        {
            try
            {
                openConnection();

                command = new MySqlCommand(query, connection);

                if (command.ExecuteNonQuery() >= 1)
                {
                    MessageBox.Show("Végrehajtva!");
                }
                else
                {
                    MessageBox.Show("Nem lett végrehajtva!");
                }
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
        }

        private void LoadUsers()
        {
            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM users", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                users_datagrid.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
        }

        private void get_data_btn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadUsers();
                get_data_btn.IsEnabled = false;
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
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
            LoadUsers();
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
            LoadUsers();
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE users SET name='{user_name_input.Text}', email='{email_input.Text}', password='{password_input.Text}' WHERE id='{user_id}'";
            executeQuery(sorfrissites);
            users_datagrid.SelectedItem = null;
            LoadUsers();
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }
    }
}
