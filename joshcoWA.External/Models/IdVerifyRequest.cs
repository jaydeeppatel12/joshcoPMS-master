using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class IdVerifyRequest
  {
    public string SecurityCode { get; set; }
    public string Token { get; set; }
    public string IdNumber { get; set; }
    public string FirstName { get; set; }
    public string Surname { get; set; }
  }
}
