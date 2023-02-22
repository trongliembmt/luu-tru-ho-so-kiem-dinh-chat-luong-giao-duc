using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website_KĐCLGD.Models
{
    public class DuongDan
    {
        public string duongdan { get; set; }
        public string tenduongdan { get; set; }

        public DuongDan(string duongdan, string tenduongdan)
        {
            this.duongdan = duongdan;
            this.tenduongdan = tenduongdan;
        }
    }
}