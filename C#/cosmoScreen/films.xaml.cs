using MySql.Data.MySqlClient;
using MySqlConnector;
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
using System.Data;
using MySql.Data.MySqlClient;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for films.xaml
    /// </summary>
    public partial class films : Window
    {
        private MySql.Data.MySqlClient.MySqlConnection connection =
            new MySql.Data.MySqlClient.MySqlConnection("server=localhost;database=cosmoscreen;uid=root");

        private MySql.Data.MySqlClient.MySqlCommand command;

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

                command = new MySql.Data.MySqlClient.MySqlCommand(query, connection);

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

                MySql.Data.MySqlClient.MySqlDataAdapter adapter =
                    new MySql.Data.MySqlClient.MySqlDataAdapter("SELECT * FROM movies", connection);

                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                movie_datagrid.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }

            try
            {
                openConnection();

                // SQL lekérdezés, amely kiválasztja az országok neveit (pl. ha van egy 'függőhidak' nevű tábla)
                string query = "SELECT * FROM showing_in";

                command = new MySql.Data.MySqlClient.MySqlCommand(query, connection);
                MySql.Data.MySqlClient.MySqlDataReader reader = command.ExecuteReader();

                // Töröljük az esetlegesen meglévő elemeket a ComboBox-ból
                showing_in_input.Items.Clear();

                // Végigmegyünk a lekérdezett adatokon és hozzáadjuk azokat a ComboBox-hoz
                HashSet<string> showing_in_Halmaz = new HashSet<string>();
                while (reader.Read())
                {
                    showing_in_Halmaz.Add(reader["type"].ToString());
                }
                foreach (var item in showing_in_Halmaz)
                {
                    showing_in_input.Items.Add(item);
                }

                reader.Close();
                closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba a formátumok betöltésekor: " + ex.Message);
            }

        }

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string actor_uplodad = $"INSERT INTO movies(title,genre,runtime,director,production,age_restriction,showing_in,poster,trailer,description,release_date) VALUES('{title_input.Text}','{genre_combobox.Text}','{runtime_input.Text}','{director_input.Text}','{director_input.Text}','{production_input.Text}','{age_restriction_combobox.Text}','{poster_input.Text}','{trailer_input.Text}','{description_input.Text}',{release_date_input.Text}";
            executeQuery(actor_uplodad);
        }
    }
}
