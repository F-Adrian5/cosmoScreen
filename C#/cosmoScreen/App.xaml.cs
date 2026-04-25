using System.Windows;

namespace cosmoScreen
{
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            ShowLogin();
        }

        public void ShowLogin()
        {
            var login = new login();
            bool? result = login.ShowDialog();

            if (result == true)
            {
                var mainWindow = new MainWindow();
                Current.MainWindow = mainWindow;
                mainWindow.Show();
            }
            else
            {
                Shutdown();
            }
        }
    }
}
