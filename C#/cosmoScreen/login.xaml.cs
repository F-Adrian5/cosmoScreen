using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Shapes;
using static cosmoScreen.Methods;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for login.xaml
    /// </summary>
    public partial class login : Window
    {
        public login()
        {
            InitializeComponent();
        }
        private void login_btn_Click(object sender, RoutedEventArgs e)
        {
            // getting what the user typed in
            string email = loginE_input.Text;
            string password = loginP_input.Password;

            try
            {
                // opening the connection and setting the query
                openConnection();
                string query = "SELECT email, password, admin FROM users WHERE email = @email AND admin = 1";

                // adding value to the command variable
                command = new MySqlCommand(query, connection);
                
                // to the commands parameter, added the email variable's data
                // to the query's @email
                command.Parameters.AddWithValue("@email", email);

                //creating an sql reader
                MySqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // with the reader getting all the data
                    string dbPass = reader.GetString("password");
                    string dbEmail = reader.GetString("email");
                    bool isAdmin = reader.GetBoolean("admin");

                    // checking the data
                    if (dbPass == password && dbEmail == email && isAdmin)
                    {
                        DialogResult = true;
                    }
                    else {
                        MessageBox.Show("Nincs jogosultsága belépni az admin felületre");
                    
                    }
                }
                else {
                    MessageBox.Show("Hibás email vagy jelszó!");
                }

                // closing the reader and the connection
                reader.Close();
                closeConnection();
            }
            catch (Exception ex)
            {
                //error
                MessageBox.Show("Hiba történt a művelet során: ", ex.Message);
            }
        }
        
        private void inputChanged(object sender, RoutedEventArgs e)
        {
            login_btn.IsEnabled =
                !string.IsNullOrWhiteSpace(loginE_input.Text) &&
                !string.IsNullOrWhiteSpace(loginP_input.Password);
        }
    }
}