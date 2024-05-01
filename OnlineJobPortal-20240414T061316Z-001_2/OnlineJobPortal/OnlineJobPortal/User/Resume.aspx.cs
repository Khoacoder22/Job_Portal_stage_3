using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

//bỏ resume
namespace OnlineJobPortal.User
{
    public partial class Resume : System.Web.UI.Page
    { 
        //Properties
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlDataReader sdr;
        DataTable dt;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    showUserProfile();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void showUserProfile()
        {
            try
            {
                con = new SqlConnection(str);
                string query = "select * from [User] where UserId=@userId";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                con.Open();
                sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        txtFullName.Text = sdr["Name"].ToString();
                        txtUserName.Text = sdr["UserName"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtMobile.Text = sdr["Mobile"].ToString();
                        txtExperience.Text = sdr["Experience"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        txtGPA.Text = sdr["GraduationGrade"].ToString();
                        txtPhd.Text = sdr["Phd"].ToString();
                        txtWork.Text = sdr["WordsOn"].ToString();
                        ddlCountry.SelectedValue = sdr["Country"].ToString();
                    }
                }
                else
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "User not found";
                    lbMsg.CssClass = "alert alert-danger";
                }
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string concatQuery = string.Empty; 
                    string filePath = string.Empty;
                    //bool isValidToExecute = false;
                    bool isValid = false;   
                    con = new SqlConnection(str);
                    if (fuResume.HasFile)
                    {
                        if (utils.IsValidExtensionResume(fuResume.FileName))
                        {
                            concatQuery = "Resume=@resume";
                            isValid = true;
                        }
                        else 
                        {
                            concatQuery = string.Empty;
                           
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                    query = @"Update [user] set UserName=@UserName, Name=@Name, Email=@Email, Mobile=@Mobile, GraduationGrade=@GraduationGrade, Phd=@Phd, WordsOn=@WordsOn,Experience=@Experience, Address=@Address, Country=@Country where UserId=@UserId";
                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@GraduationGrade", txtGPA.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phd", txtPhd.Text.Trim());
                    cmd.Parameters.AddWithValue("@WordsOn", txtWork.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
               
                    if (fuResume.HasFile)
                    {
                        if (utils.IsValidExtensionResume(fuResume.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            filePath = "Resume/" + obj.ToString() + fuResume.FileName;
                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resume/") + obj.ToString() + fuResume.FileName);

                            cmd.Parameters.AddWithValue("@resume", filePath);
                            isValid = true; 
                        }
                        else
                        {
                            lbMsg.Visible = true;
                            lbMsg.Text = "Please select file type!";
                            lbMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else 
                    {
                        isValid = true;
                    }
                    if (isValid) 
                    {
                        con.Open();
                        int r = cmd.ExecuteNonQuery(); 
                        if (r > 0) 
                        {
                            lbMsg.Visible = true;
                            lbMsg.Text = "Success!";
                            lbMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lbMsg.Visible = true;
                            lbMsg.Text = "Please try again!";
                            lbMsg.CssClass = "alert alert-danger";
                        }
                    }
                }
                else
                {
                    lbMsg.Visible = true;
                    lbMsg.Text = "Please try again!";
                    lbMsg.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY contraint"))
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
                Response.Write("<script>alert('" + ex.Message + "');</script");

            }
            finally
            {
                con.Close();
            }
        }

    }
}