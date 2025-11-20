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
using System.Windows.Threading;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for szineszek.xaml
    /// </summary>
    public partial class szineszek : Window
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;database=cosmoscreen;uid=root");
        MySqlCommand command;

        public szineszek()
        {
            InitializeComponent();
            btn_upload.IsEnabled = false;
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

        private void get_data_btn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM actors", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                actors_datagrid.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
                get_data_btn.IsEnabled = false;
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }

        }

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string actor_uplodad = $"INSERT INTO actors(name) VALUES('{actor_name_input.Text}')";
            executeQuery(actor_uplodad);

        }

        private void actor_name_input_TextChanged(object sender, TextChangedEventArgs e)
        {
            if(actor_name_input.Text == ""){
                btn_upload.IsEnabled = false;
            }
            else
            {
                btn_upload.IsEnabled = true;
            }
        }
    }
}
