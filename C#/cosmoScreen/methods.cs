using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace cosmoScreen
{
    internal static class Methods
    {
        //connection to the database
        public static MySqlConnection connection = new MySqlConnection("server=localhost;database=cosmoscreen;uid=root");
        public static MySqlCommand command;

        public static void openConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        public static void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public static void executeQuery(string query)
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

        public static void LoadData(string query, DataGrid datagrid)
        {
            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                datagrid.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
        }
    }
}
