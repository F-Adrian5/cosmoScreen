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
using static cosmoScreen.Methods;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for bufe.xaml
    /// </summary>
    public partial class bufe : Window
    {

        public bufe()
        {
            InitializeComponent();
            LoadData("SELECT * FROM buffet", buffet_datagrid);
            ExitApp(this);
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

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string actor_uplodad = $"INSERT INTO buffet(name,price,description,img) VALUES('{food_name.Text}','{food_price.Text}','{food_description.Text}','{food_image_url.Text}')";
            executeQuery(actor_uplodad);
            LoadData("SELECT * FROM buffet", buffet_datagrid);
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

        private int buffet_id = -1;
        private void buffet_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var buffet_name = "";
            var buffet_price = "";
            var buffet_description = "";
            var buffet_img = "";
            DataRowView sor = (DataRowView)buffet_datagrid.SelectedItem;

            delete_data_btn.IsEnabled = true;
            edit_data_btn.IsEnabled = true;
            if (sor != null)
            {
                buffet_id = Convert.ToInt32(sor["id"]);
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
            string torol = $"DELETE FROM buffet WHERE id ='{buffet_id}'";
            buffet_datagrid.SelectedItem = null;
            executeQuery(torol);
            LoadData("SELECT * FROM buffet", buffet_datagrid);
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE buffet SET name='{food_name.Text}', price='{food_price.Text}', description='{food_description.Text}', img='{food_image_url.Text}' WHERE id='{buffet_id}'";
            executeQuery(sorfrissites);
            buffet_datagrid.SelectedItem = null;
            LoadData("SELECT * FROM buffet", buffet_datagrid);
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }

        private void user_menuItem_Click(object sender, RoutedEventArgs e)
        {
            felhasznalok felhasznalokWindow = new felhasznalok();
            felhasznalokWindow.Show();
            this.Hide();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show(
               "Biztosan ki akar jelentkezni?",
               "Confirm",
             MessageBoxButton.YesNo,
             MessageBoxImage.Question);

            if (result == MessageBoxResult.Yes)
            {
                login loginWindow = new login();
                loginWindow.Show();
                this.Hide();
            }
        }
    }
}
