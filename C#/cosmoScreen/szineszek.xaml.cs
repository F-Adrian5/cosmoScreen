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

        private void LoadActors()
        {
            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM actors", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                actors_datagrid.ItemsSource = ds.Tables[0].DefaultView;
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
                LoadActors();
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
            LoadActors();
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

        private int actor_id = -1;
        private void actors_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var actor_name = "";
            DataRowView sor = (DataRowView)actors_datagrid.SelectedItem;

            delete_data_btn.IsEnabled = true;
            edit_data_btn.IsEnabled = true;
            if (sor != null)
            {
                actor_id = Convert.ToInt32(sor["id"]);
                actor_name = sor["name"].ToString();
                actor_name_input.Text = actor_name;
            }
        }

        private void delete_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string torol = $"DELETE FROM actors WHERE id ='{actor_id}'";
            actors_datagrid.SelectedItem = null;
            executeQuery(torol);
            LoadActors();
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE actors SET name='{actor_name_input.Text}' WHERE id='{actor_id}'";
            executeQuery(sorfrissites);
            actors_datagrid.SelectedItem = null;
            LoadActors();
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }
    }
}
