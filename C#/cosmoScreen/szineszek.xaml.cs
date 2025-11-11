using System;
using System.Collections.Generic;
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
    }
}
