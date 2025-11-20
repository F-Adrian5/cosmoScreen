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
using MySql.Data.MySqlClient;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for films.xaml
    /// </summary>
    public partial class films : Window
    {
        private MySqlConnection connection = new MySqlConnection("server=localhost;database=cosmoscreen;uid=root");

        private MySqlCommand command;

        public films()
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

        private void get_data_btn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                teszt_input.Text = release_date_input.Text;

                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM movies", connection);

                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                movie_datagrid.ItemsSource = ds.Tables[0].DefaultView;
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
            string actor_uplodad = $"INSERT INTO movies(title,genre,runtime,director,production,age_restriction,showing_in,poster,trailer,description,release_date) VALUES('{title_input.Text}','{genre_combobox.Text}','{runtime_input.Text}','{director_input.Text}','{director_input.Text}','{production_input.Text}','{age_restriction_combobox.Text}','{showing_in_input.Text}','{poster_input.Text}','{trailer_input.Text}','{description_input.Text}',{release_date_input.SelectedDate?.ToString("yyyy-MM-dd")}";
            executeQuery(actor_uplodad);
        }
    }
}
