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
    /// Interaction logic for bufe.xaml
    /// </summary>
    public partial class bufe : Window
    {

        MySqlConnection connection = new MySqlConnection("server=localhost;database=cosmoscreen;uid=root");
        MySqlCommand command;

        public bufe()
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
                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM buffet", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                buffet_datagrid.ItemsSource = ds.Tables[0].DefaultView;
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
            string actor_uplodad = $"INSERT INTO buffet(name,price,description,img) VALUES('{food_name.Text}','{food_price.Text}','{food_description.Text}','{food_image_url.Text}')";
            executeQuery(actor_uplodad);
        }
        private void InputChanged(object sender, TextChangedEventArgs e)
        {
            btn_upload.IsEnabled = ValidateInputs();
        }

        private bool ValidateInputs()
        {
            if (string.IsNullOrWhiteSpace(food_name.Text)) return false;
            if (string.IsNullOrWhiteSpace(food_description.Text)) return false;
            if (string.IsNullOrWhiteSpace(food_image_url.Text)) return false;

            if (!int.TryParse(food_price.Text, out int price) || price < 0)
                return false;

            return true;
        }

        private void buffet_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var buffet_name = "";
            var buffet_price = "";
            var buffet_description = "";
            var buffet_img = "";
            DataRowView sor = (DataRowView)buffet_datagrid.SelectedItem;

            delete_data_btn.IsEnabled = true;
            if (sor != null)
            {
                buffet_name = sor["name"].ToString();
                buffet_price = sor["price"].ToString();
                buffet_description = sor["description"].ToString();
                buffet_img = sor["img"].ToString();
                food_name.Text = buffet_name;
                food_price.Text = buffet_price;
                food_description.Text = buffet_description;
                food_image_url.Text = buffet_img;
            }

        }

     

        private void delete_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string torol = $"DELETE FROM buffet WHERE name ='{food_name.Text}'";
            buffet_datagrid.SelectedItem = null;
            executeQuery(torol);
           

        }
    }
}
