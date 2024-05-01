using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataReader srd;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string username, password = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if(ddlLoginType.SelectedValue == "Admin")
                {
                    username = ConfigurationManager.AppSettings["Username"];
                    password = ConfigurationManager.AppSettings["Password"];
                    if(username == txtUserName.Text.Trim() && password == txtPassword.Text.Trim())
                    {
                        Session["admin"] = username;
                        Response.Redirect("../Admin/Dashboard.aspx", false);
                    }
                    else
                    {
                        showErrorMsg("Admin");
                    }
                 }
                 else
                 {
                    con = new SqlConnection(str);
                    string query = @"SELECT * FROM [User] WHERE UserName = @UserName AND Password = @Password";
                    cmd = new SqlCommand(query, con);
                    // trim() loại bỏ khoảng trắng
                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    con.Open();
                    srd = cmd.ExecuteReader();
                    if (srd.Read())
                    {
                        Session["user"] = srd["UserName"].ToString();
                        Session["userId"] = srd["UserId"].ToString();
                        Response.Redirect("Default.aspx", false);
                    }
                    //đăng nhập thất bại
                    else
                    {
                        showErrorMsg("User");
                    }
                    con.Close();
                 }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                con.Close();
            }
        }
        //thông báo xuất hiện lỗi
        private void showErrorMsg(string userType)
        {
            lbMsg.Visible = true;
            lbMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> wrong! please try agian";
            lbMsg.CssClass = "alert alert-danger";
        }
    }
}