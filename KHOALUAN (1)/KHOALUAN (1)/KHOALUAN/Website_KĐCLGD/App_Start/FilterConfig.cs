﻿using System.Web;
using System.Web.Mvc;

namespace Website_KĐCLGD
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}