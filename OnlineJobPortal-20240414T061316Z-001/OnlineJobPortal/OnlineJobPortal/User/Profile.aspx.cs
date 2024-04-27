using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                showUserProfile();

            }
        }

        private void showUserProfile()
        {
            con = new SqlConnection(str);
            string query = "select UserId, UserName,Name, Email, Mobile, Country, Address,Resume from [User] where UserName=@userName";
            cmd = new SqlCommand(query, con);   
            cmd.Parameters.AddWithValue("@UserName", Session["user"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            dlProfile.DataSource = dt;
            dlProfile.DataBind();
        }

        protected void dlProfile_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "EditUserProfile")
            {
                Response.Redirect("Resume.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}