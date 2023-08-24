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

            RandomNumberGenerator();

        }

        #region Model

        #endregion

        #region View

        #endregion

        #region Controller

        /// <summary>
        /// This will generate 1 million numbers with random number between 0, 9999 and will create a txt file and add them there.
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
