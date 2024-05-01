using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using System.Xml.Linq;

namespace OnlineJobPortal.User 
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"INSERT INTO [User] (UserName, Password, Name, Email, Mobile, Address, Country) VALUES
                (@UserName, @Password, @Name, @Email, @Mobile ,@Address, @Country)";
                cmd = new SqlCommand(query, con);
                // trim() loại bỏ khoảng trắng
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "Yay !Registered Successfully!";
                    lbMsg.CssClass = "alert alert-success";
                    clear();
                }
                else
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "Cannot save record right now, please try again later.";
                    lbMsg.CssClass = "alert alert-danger";
                }
            }
            catch(SqlException ex) { 
                 if(ex.Message.Contains("Violation of UNIQUE KEY contraint"))
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b>Username already exist, please try the new one!";
                    lbMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alter('" + ex.Message + "');</script)");
            }
            finally
            {
                con.Close();
            }

        }
        private void clear()
        {
            txtUserName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            ddlCountry.ClearSelection();

        }
    }
}