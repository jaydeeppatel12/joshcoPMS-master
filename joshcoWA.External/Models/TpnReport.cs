using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class TpnReport
  {
    public int ApplicationID { get;set;}
    public string RequestType { get;set;}
    public bool IsSuccessful { get;set;}
    public string TpnResponse { get;set;}
  }
}
