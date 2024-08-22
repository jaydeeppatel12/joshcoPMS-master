using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class IDVerifyReport
  {
    public int ApplicationID { get; set; }
    public bool IDVerified { get; set; }
    public string XmlResponse { get; set; }
  }
}
