using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RandomNumberGenerator
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //string connString = @"Data Source=ZBC-S-SHAZ0184;Initial Catalog=Performance;User ID=PerformanceLogin;Password=PerformanceLogin;Integrated Security=True";

            //SqlConnection conn = new SqlConnection(connString);

            //conn.Open();

            //conn.Close();

            //Console.ReadKey();

            MainController();

        }

        #region Model

        /// <summary>
        /// through this method i will connect to the database and 
        /// </summary>
        static void DBPerformance()
        {
            string connString = @"Data Source=ZBC-S-SHAZ0184;Initial Catalog=Performance;User ID=PerformanceLogin;Password=PerformanceLogin;Integrated Security=True";

            SqlConnection conn = new SqlConnection(connString);

            conn.Open();

            UserOption(connString, conn);

        }

        #endregion

        #region View

        static void MainView()
        {
            Console.WriteLine("Hello and Welcome to Our SQL and C# Combine Program!\n" +
                "you have two options here\n" +
                "1.\tFind the RandomNumber using an ID Number\n" +
                "2.\tFind All the ID's using a RandomNummber\n");
        }

        #endregion

        #region Controller


        static void MainController()
        {
            DBPerformance();

            MainView();
        }

        static void UserOption(string connectionstring, SqlConnection sqlconn)
        {

        }



        /// <summary>
        /// This will generate 1 million numbers with random number between 0, 9999 and will create a txt file and add them there.
        /// The reason why this method is not being used is because i have already used it.
        /// </summary>
        static void RandomNumberGenerator()
        {
            Console.WriteLine("ID, RandomNumber");

            int id = 0;

            Random random = new Random();

            for (int i = 0; i < 1000000; i++)
            {
                id++;

                Console.WriteLine(id);

                int randomNumber = random.Next(0, 9999);

                using (StreamWriter SW = File.AppendText("C:\\Users\\Shaz0184\\Desktop\\Github\\DataBase\\2. SQL Server Import\\RandomNumberGenerated.txt"))
                {
                    if (id == 1)
                    {
                        SW.WriteLine("ID, RandomNumber");
                    }
                    else 
                    { 
                        SW.WriteLine($"{id},{randomNumber}");
                    }


                }
            }
        }

        #endregion

    }
}
