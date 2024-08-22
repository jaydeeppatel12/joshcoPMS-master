using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace joshcoWA.student
{
    public class clStudentUnitType
    {
        private long _StudentUnitTypeID;
        public long StudentUnitTypeID
        {
            get { return _StudentUnitTypeID; }
            set { _StudentUnitTypeID = value; }
        }

        private string _StudentUnitTypeDescription;
        public string StudentUnitTypeDescription
        {
            get { return _StudentUnitTypeDescription; }
            set { _StudentUnitTypeDescription = value; }
        }


       
    }
}