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
            try
            {
                con = new SqlConnection(str);
                // Sử dụng tên stored procedure
                cmd = new SqlCommand("GetUserProfile", con);
                // Đặt CommandType là StoredProcedure
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.Parameters.AddWithValue("@UserName", Session["user"]);
                con.Open();
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                dlProfile.DataSource = dt;
                dlProfile.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
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