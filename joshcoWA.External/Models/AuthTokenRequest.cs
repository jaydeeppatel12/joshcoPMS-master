using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class AuthTokenRequest
  {
    public string SecurityCode { get; set; }
    public string Token { get; set; }
    public string LoginCode { get; set; }
    public string Password { get; set; }
  }
}
