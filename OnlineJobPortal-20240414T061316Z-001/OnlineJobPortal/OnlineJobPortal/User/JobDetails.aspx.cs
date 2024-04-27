using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;

namespace OnlineJobPortal.User
{
    public partial class JobDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        SqlCommand cmd;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string jobTitle = string.Empty;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showJobDetails();
                DataBind();
            }
            else
            {
                Response.Redirect("JobListing.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void showJobDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * From Jobs where JobId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            jobTitle = dt.Rows[0]["Title"].ToString();
        }
        //check xem có vào tài khoản chưa với applied
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Apply")
            {
                if (Session["User"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedJobs values (@JobId, @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("JobId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Job applied successfull!";
                            lblMsg.CssClass = "alert alert-success";

                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot apply the job please try again!";
                            lblMsg.CssClass = "alert alert-danger";
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
                else
                {
                    //chuyển đổi trang
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["User"] != null)
            {
                // Lấy đối tượng lbApplyJob
                LinkButton btnApplyJob = e.Item.FindControl("lbApplyJob") as LinkButton;

                // Kiểm tra trạng thái đã applied
                if (isApplied())
                {
                    // Đã applied
                    btnApplyJob.Enabled = false;
                    btnApplyJob.Text = "Applied";
                }
                else
                {
                    // Chưa applied
                    btnApplyJob.Enabled = true;
                    btnApplyJob.Text = "Apply now!";
                  
                }
            }
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * From AppliedJobs where UserId = @UserId and JobId = @JobId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("JobId", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("UserId", Session["userId"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if (dt1.Rows.Count == 1) 
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Setting default images
        protected string GetImageUrl(Object url)
        {
            string url1 = " ";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }

    }
}