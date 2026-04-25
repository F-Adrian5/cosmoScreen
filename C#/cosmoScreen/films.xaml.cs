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
using static cosmoScreen.Methods;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for films.xaml
    /// </summary>
    public partial class films : Window
    {
        public films()
        {
            InitializeComponent();
            LoadData("SELECT * FROM movies", movie_datagrid);
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

        private void btn_upload_Click(object sender, RoutedEventArgs e)
        {
            string actor_upload = $"INSERT INTO movies(title, genre, runtime, director, production, age_restriction, showing_in, poster, description, release_date) VALUES ('{title_input.Text}', '{genre_combobox.Text}', '{runtime_input.Text}', '{director_input.Text}', '{production_input.Text}', '{age_restriction_combobox.Text}', '{showing_in_combobox.Text}', '{poster_input.Text}', '{description_input.Text}', '{release_date_input.SelectedDate?.ToString("yyyy-MM-dd")}')";
            executeQuery(actor_upload);
            LoadData("SELECT * FROM movies", movie_datagrid);
        }
        private void InputChanged(object sender, EventArgs e)
        {
            btn_upload.IsEnabled = ValidateInputs();
        }
        private bool ValidateInputs()
        {

            if (string.IsNullOrWhiteSpace(title_input.Text)) return false;
            if (string.IsNullOrWhiteSpace(director_input.Text)) return false;
            if (string.IsNullOrWhiteSpace(production_input.Text)) return false;
            if (string.IsNullOrWhiteSpace(poster_input.Text)) return false;
            if (string.IsNullOrWhiteSpace(description_input.Text)) return false;

            if (!int.TryParse(runtime_input.Text, out int runtime) || !(runtime > 0))
                return false;

            if (genre_combobox.SelectedIndex < 0) return false;
            if (age_restriction_combobox.SelectedIndex < 0) return false;
            if (showing_in_combobox.SelectedIndex < 0) return false;

            if (release_date_input.SelectedDate == null) return false;

            return true;
        }

        private int movie_id = -1;
            private void movie_datagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                var movie_title = "";
                var movie_runtime = "";
                var movie_director = "";
                var movie_studio = "";
                var movie_poster = "";
                var movie_genre = "";
                var movie_age = "";
                var movie_showing_in = "";
                var movie_re_date = "";
                var movie_description = "";

                DataRowView sor = (DataRowView)movie_datagrid.SelectedItem;

                delete_data_btn.IsEnabled = true;
                edit_data_btn.IsEnabled = true;
                if (sor != null)
                {
                    movie_id = Convert.ToInt32(sor["id"]);
                    movie_title = sor["title"].ToString();
                    movie_runtime = sor["runtime"].ToString();
                    movie_director = sor["director"].ToString();
                    movie_studio = sor["production"].ToString();
                    movie_poster = sor["poster"].ToString();
                    movie_genre = sor["genre"].ToString();
                    movie_age = sor["age_restriction"].ToString();
                    movie_showing_in = sor["showing_in"].ToString();
                    movie_re_date = sor["release_date"].ToString();
                    movie_description = sor["description"].ToString();

                    title_input.Text = movie_title;
                    runtime_input.Text = movie_runtime;
                    director_input.Text = movie_director;
                    production_input.Text = movie_studio;
                    poster_input.Text = movie_poster;
                    genre_combobox.Text = movie_genre;
                    age_restriction_combobox.Text = movie_age;
                    showing_in_combobox.Text = movie_showing_in;
                    release_date_input.Text = movie_re_date;
                    description_input.Text = movie_description;
                }

            }

        private void delete_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string torol = $"DELETE FROM movies WHERE id ='{movie_id}'";
            movie_datagrid.SelectedItem = null;
            executeQuery(torol);
            LoadData("SELECT * FROM movies", movie_datagrid);
            delete_data_btn.IsEnabled = false;
            edit_data_btn.IsEnabled = false;
        }

        private void edit_data_btn_Click(object sender, RoutedEventArgs e)
        {
            string sorfrissites = $"UPDATE movies SET title='{title_input.Text}', genre='{genre_combobox.Text}', runtime='{runtime_input.Text}', director='{director_input.Text}', production='{production_input.Text}',age_restriction='{age_restriction_combobox.Text}', showing_in='{showing_in_combobox.Text}', poster='{poster_input.Text}', description='{description_input.Text}', release_date='{release_date_input.Text}' WHERE id='{movie_id}'";
            executeQuery(sorfrissites);
            movie_datagrid.SelectedItem = null;
            LoadData("SELECT * FROM movies", movie_datagrid);
            edit_data_btn.IsEnabled = false;
            delete_data_btn.IsEnabled = false;
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
    }
}
