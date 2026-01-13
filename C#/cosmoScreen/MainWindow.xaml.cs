using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void bufe_click(object sender, RoutedEventArgs e)
        {
            bufe bufeWindow = new bufe();
            bufeWindow.Show();
            this.Hide();
        }

        private void film_Click(object sender, RoutedEventArgs e)
        {
            films filmWindow = new films();
            filmWindow.Show();
            this.Hide();
        }

        private void szineszek_click(object sender, RoutedEventArgs e)
        {
            szineszek szineszekWindow = new szineszek();
            szineszekWindow.Show();
            this.Hide();
        }

        private void felhasznalok_Click(object sender, RoutedEventArgs e)
        {
            felhasznalok felhasznalokWindow = new felhasznalok();
            felhasznalokWindow.Show();
            this.Hide();
        }
    }
}