using Google.Protobuf.WellKnownTypes;
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
    /// Interaction logic for szineszek.xaml
    /// </summary>
    public partial class szineszek : Window
    {
        public szineszek()
        {
            InitializeComponent();
            LoadData("SELECT * FROM actors", actors_datagrid);
            ExitApp(this);
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

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string actor_uplodad = $"INSERT INTO actors(name) VALUES('{actor_name_input.Text}')";
            executeQuery(actor_uplodad);
            LoadData("SELECT * FROM actors", actors_datagrid);
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
            LoadData("SELECT * FROM actors", actors_datagrid);
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE actors SET name='{actor_name_input.Text}' WHERE id='{actor_id}'";
            executeQuery(sorfrissites);
            actors_datagrid.SelectedItem = null;
            LoadData("SELECT * FROM actors", actors_datagrid);
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }

        private void user_menuItem_Click(object sender, RoutedEventArgs e)
        {
            felhasznalok felhasznalokWindow = new felhasznalok();
            felhasznalokWindow.Show();
            this.Hide();
        }

        private void NameOnly(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !e.Text.All(c => char.IsLetter(c) || c == ' ');
        }

        private void logout_btn_Click(object sender, RoutedEventArgs e)
        {
            login loginWindow = new login();
            loginWindow.Show();
            this.Hide();
        }
    }
}