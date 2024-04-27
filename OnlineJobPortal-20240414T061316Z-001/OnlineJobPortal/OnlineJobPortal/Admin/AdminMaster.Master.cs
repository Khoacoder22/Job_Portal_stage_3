using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogOut_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("../User/Login.aspx");
        }
    }
}