using System.Configuration;
using System.Data;
using System.Windows;

namespace cosmoScreen
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            var login = new login();
            bool? result = login.ShowDialog();

            if (result == true)
            {
                var mainWindow = new MainWindow();
                mainWindow.Show();
            }
            else
            {
                Shutdown();
            }
        }
    }

}
