using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.Admin
{
    public partial class NewJobs : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
            if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from jobs where JobId = '" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);   
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if(sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtJobTitle.Text = sdr["Title"].ToString();
                        txtNoOfPost.Text = sdr["Position"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();
                        txtQualification.Text = sdr["Qualification"].ToString();
                        txtExperience.Text = sdr["Experience"].ToString();
                        txtSalary.Text = sdr["Salary"].ToString();
                        txtLastDate.Text = Convert.ToDateTime( sdr["LastDate"]).ToString("yyyy-MM-dd");
                        txtCompany.Text = sdr["CompanyName"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        ddlJobType.SelectedValue = sdr["JobType"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        btnAdd.Text = "Update";
                    }
                }
                else
                {
                    lblMsg.Text = "Job not found!";
                    lblMsg.CssClass = "alert alter-danger"; 
                }
                sdr.Close();    
                con.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValidToExcute = false;
                con = new SqlConnection(str);
                if (Request.QueryString["id"] != null)
                {
                    if (fuCompanyLogo.HasFile)
                    {
                        if (utils. IsValidExtension(fuCompanyLogo.FileName))
                        {
                            concatQuery = "CompanyImage = @CompanyImage";
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
                    query = @"Update Jobs set Title=@Title, Position=@Position, Description=@Description, Qualification=@Qualification, Experience=@Experience, Salary=@Salary, LastDate=@LastDate, CompanyName=@CompanyName,"+ concatQuery + @"Email=@Email, JobType=@JobType, Address=@Address where JobId=@id";
                    type = "updated";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Position", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDate", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    if (fuCompanyLogo.HasFile)
                    {
                        if (utils. IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExcute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValidToExcute = true;
                    }
                }
                else
                {
                    query = @"Insert into Jobs values(@Title, @Position, @Description, @Qualification, @Experience, @Salary, @LastDate, @CompanyName, @CompanyImage, @Email, @JobType, @Address)";
                    type = "saved";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Position", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDate", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    if (fuCompanyLogo.HasFile)
                    {
                        if (utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExcute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, .jpeg, .png";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExcute = true;
                    }
                }
                if (isValidToExcute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "success!";
                        lblMsg.CssClass = "alert alert-success";
                        Clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot saved!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void Clear()
        {
            txtJobTitle.Text = string.Empty;
            txtNoOfPost.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtLastDate.Text = string.Empty;
            txtCompany.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlJobType.ClearSelection();
            txtAddress.Text = string.Empty;
        }

        //private bool utils. IsValidExtension(string fileName)
        //{
        //    bool isValid = false;
        //    string[] fileExtension = { ".jpg", ".png", ".jpeg" };
        //    for(int i = 0; i <= fileExtension.Length - 1; i++)
        //    {
        //        if (fileName.Contains(fileExtension[i]))
        //        {
        //            isValid = true;
        //            break;
        //        }
        //    }
        //    return isValid;
        //}
    }
}