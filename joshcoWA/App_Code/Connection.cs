using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace joshcoWA
{
    class Connection
    {
        public static string GetConnection()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString;
        }

    }
}
