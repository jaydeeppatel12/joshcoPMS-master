using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class CredexSummaryRequest
  {
    public string SecurityCode { get; set; }
    public string LoginCode { get; set; }
    public string Password { get; set; }
    public Guid EnquiryId { get; set; }
  }
}
