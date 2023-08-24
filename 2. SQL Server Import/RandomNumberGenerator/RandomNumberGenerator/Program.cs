using System;
using System.Collections.Generic;
using System.Data;
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

            UserOption(connString);

            conn.Close();

        }

        #endregion

        #region View

        /// <summary>
        /// This is my GUI
        /// </summary>
        static void MainView()
        {
            Console.WriteLine("\nHello and Welcome to Our SQL and C# Combine Program!\n\n" +
                "you have two options here\n\n" +
                "1.\tFind the RandomNumber using an ID Number\n\n" +
                "2.\tFind All the ID's using a RandomNummber\n\n");
        }

        #endregion

        #region Controller


        /// <summary>
        /// This is my mainController method that will controll all the other method before they reach My main method
        /// </summary>
        static void MainController()
        {

            while(true)
            {
                MainView();
                DBPerformance();

            }
        }

        /// <summary>
        /// This method will tell program which option user have choosen
        /// </summary>
        /// <param name="connectionstring"></param>
        static void UserOption(string connectionstring)
        {
            int choice = int.Parse(Console.ReadLine());

            switch (choice)
            {
                case 1:
                    GetRandomNumberByID(connectionstring);
                    break;

                case 2:
                    GetIDsByRandomNumber(connectionstring);
                    break;

                default:
                    Console.WriteLine("Invalid choice.");
                    break;
            }
        }

        /// <summary>
        /// This will return the RandomNumber For the user input ID number
        /// </summary>
        /// <param name="connectionstring"></param>
        static void GetRandomNumberByID(string connectionstring)
        {

            string connString = connectionstring;

            Console.Write("Enter the ID: ");
            int id = int.Parse(Console.ReadLine());

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("GetRandomNumberByID", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@sp_ID", id));

                    int randomNumber = (int)cmd.ExecuteScalar();

                    Console.WriteLine($"RandomNumber for ID {id} is: {randomNumber}");
                }
            }
        }

        /// <summary>
        /// This method will return all the ID that have the RandomNumber same as User input
        /// </summary>
        /// <param name="connectionstring"></param>
        static void GetIDsByRandomNumber(string connectionstring)
        {

            string connString = connectionstring;

            Console.Write("Enter the RandomNumber: ");
            int randomNumber = int.Parse(Console.ReadLine());

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("GetIDsByRandomNumber", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@sp_RandomNumber", randomNumber));

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int returnedID = reader.GetInt32(0);
                            Console.WriteLine($"ID for RandomNumber {randomNumber} is: {returnedID}");
                        }
                    }
                }
            }
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
