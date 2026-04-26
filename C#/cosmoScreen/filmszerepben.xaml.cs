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
using MySql.Data.MySqlClient;
using static cosmoScreen.Methods;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for filmszerepben.xaml
    /// </summary>
    public partial class filmszerepben : Window
    {
        int selected_id;
        public filmszerepben()
        {
            InitializeComponent();
            LoadMoviesCombo();
            LoadActorsCombo();
            LoadData("SELECT aim.id,aim.movie_id,aim.actor_id,m.title AS movie_title,a.name AS actor_name FROM actor_in_movie aim JOIN movies m ON aim.movie_id = m.id JOIN actors a ON aim.actor_id = a.id;", actor_in_movie_datagrid);
        }

        private void films_menuItem_Click(object sender, RoutedEventArgs e)
        {
            films filmsWindow = new films();
            filmsWindow.Show();
            this.Hide();
        }

        private void actor_in_movie_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (actor_in_movie_datagrid.SelectedItem is DataRowView sor)
            {
                selected_id = Convert.ToInt32(sor["id"]);
                int movieId = Convert.ToInt32(sor["movie_id"]);
                int actorId = Convert.ToInt32(sor["actor_id"]);

                delete_data_btn.IsEnabled = true;
                edit_data_btn.IsEnabled = true;

                movie_combobox.SelectedValue = movieId;
                actor_combobox.SelectedValue = actorId;
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

        private void user_menuItem_Click(object sender, RoutedEventArgs e)
        {
            felhasznalok felhasznalokWindow = new felhasznalok();
            felhasznalokWindow.Show();
            this.Hide();
        }

        private void logout_btn_Click(object sender, RoutedEventArgs e)
        {
            Logout(this);
        }

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string query = $"INSERT INTO actor_in_movie (movie_id, actor_id) VALUES ('{movie_combobox.SelectedValue}', '{actor_combobox.SelectedValue}')";
            executeQuery(query);
            LoadData("SELECT aim.id,aim.movie_id,aim.actor_id,m.title AS movie_title,a.name AS actor_name FROM actor_in_movie aim JOIN movies m ON aim.movie_id = m.id JOIN actors a ON aim.actor_id = a.id", actor_in_movie_datagrid);
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE actor_in_movie SET movie_id = {movie_combobox.SelectedValue},actor_id = {actor_combobox.SelectedValue} WHERE id = {selected_id}";
            executeQuery(sorfrissites);
            actor_in_movie_datagrid.SelectedItem = null;
            LoadData("SELECT aim.id,aim.movie_id,aim.actor_id,m.title AS movie_title,a.name AS actor_name FROM actor_in_movie aim JOIN movies m ON aim.movie_id = m.id JOIN actors a ON aim.actor_id = a.id", actor_in_movie_datagrid);
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
        }

        private void delete_data_btn_Click(object sender, RoutedEventArgs e)
        {

            DataRowView sor = (DataRowView)actor_in_movie_datagrid.SelectedItem;
            int id = Convert.ToInt32(sor["id"]);
            string torol = $"DELETE FROM actor_in_movie WHERE id = {id}";
            actor_in_movie_datagrid.SelectedItem = null;
            executeQuery(torol);
            LoadData("SELECT aim.id,aim.movie_id,aim.actor_id,m.title AS movie_title,a.name AS actor_name FROM actor_in_movie aim JOIN movies m ON aim.movie_id = m.id JOIN actors a ON aim.actor_id = a.id", actor_in_movie_datagrid);
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        public void LoadMoviesCombo()
        {
            try
            {
                openConnection();

                string query = "SELECT id, title FROM movies";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                movie_combobox.ItemsSource = dt.DefaultView;
                movie_combobox.DisplayMemberPath = "title";
                movie_combobox.SelectedValuePath = "id";

                closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void LoadActorsCombo()
        {
            try
            {
                openConnection();

                string query = "SELECT id, name FROM actors";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                actor_combobox.ItemsSource = dt.DefaultView;
                actor_combobox.DisplayMemberPath = "name";
                actor_combobox.SelectedValuePath = "id";

                closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void InputChanged(object sender, EventArgs e)
        {
            btn_upload.IsEnabled = ValidateInputs();
        }
        private bool ValidateInputs()
        {
            if (movie_combobox.SelectedIndex < 0) return false;
            if (actor_combobox.SelectedIndex < 0) return false;

            return true;
        }
    }
}
