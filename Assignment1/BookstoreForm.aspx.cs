using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace User_Registration
{
    public partial class Index : System.Web.UI.Page
    {

        String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                result.Visible = false;
              
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
               if (txtbookTitle.Text == "" || txtAuthorList.Text == "" || txtISBNNumber.Text == "" || txtPrice.Text == "" || txtPublishingDate.Text == "" || txtPageCount.Text == "")
                 lblErrorMessage.Text = "Please Fill Mandatory Fields";
            // else if (txtPassword.Text != txtConfirmPassword.Text)
            //   lblErrorMessage.Text = "Password do not match";
                else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("UserAddOrEdit", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@Id", Convert.ToInt32(hfUserID.Value == "" ? "0" : hfUserID.Value));
                    sqlCmd.Parameters.AddWithValue("book_title", txtbookTitle.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@author_list", txtAuthorList.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@isbn_number", txtISBNNumber.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("publishing_date", txtPublishingDate.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@price", txtPrice.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@category", ddlCategory.SelectedValue);
                    sqlCmd.Parameters.AddWithValue("@publisher", ddlPublisher.SelectedValue);
                    sqlCmd.Parameters.AddWithValue("@page_count", txtPageCount.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    Clear();
                    lblSuccessMessage.Text = "Submitted Successfully";
                }
            }
        }

        void Clear()
        {
            //  txtFirstName.Text = txtLastName.Text = txtContact.Text = txtAddress.Text = txtUsername.Text = txtPassword.Text = txtConfirmPassword.Text = "";
            hfUserID.Value = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                String query = "select * from Bookstore where book_title='"+TextBox1.Text + "' ";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                bool recordfound = dr.Read();
                if (recordfound)
                {
                    result.Visible = true;
                    Label1.Text = "Record Found ...";
                    Label1.ForeColor = System.Drawing.Color.Green;
                    lblBookTitle.Text = dr["book_title"].ToString();
                    lblAuthorList.Text = dr["author_list"].ToString();
                    lblISBNNumber.Text = dr["isbn_number"].ToString();
                    lblCategory.Text = dr["category"].ToString();
                    lblPublisher.Text = dr["publisher"].ToString();
                    lblPublishingDate.Text = dr["publishing_date"].ToString();
                    lblPageCount.Text = dr["page_count"].ToString();
                    lblPrice.Text = dr["price"].ToString();

                }
                else
                {
                    result.Visible = false;
                    Label1.Text = "Record Not Found ...";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }


            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            result.Visible = false;
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                String query = "select * from Bookstore where category='" + DropDownList3.SelectedValue + "' ";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView3.DataSource = rdr;
                GridView3.DataBind();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                String query = "select * from Bookstore where price='" + TextBox3.Text + "' ";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                bool recordfound = dr.Read();
                if (recordfound)
                {
                    result.Visible = true;
                    Label6.Text = "Record Found ...";
                    Label6.ForeColor = System.Drawing.Color.Green;
                    lblBookTitle.Text = dr["book_title"].ToString();
                    lblAuthorList.Text = dr["author_list"].ToString();
                    lblISBNNumber.Text = dr["isbn_number"].ToString();
                    lblCategory.Text = dr["category"].ToString();
                    lblPublisher.Text = dr["publisher"].ToString();
                    lblPublishingDate.Text = dr["publishing_date"].ToString();
                    lblPageCount.Text = dr["page_count"].ToString();
                    lblPrice.Text = dr["price"].ToString();

                }
                else
                {
                    result.Visible = false;
                    Label6.Text = "Record Not Found ...";
                    Label6.ForeColor = System.Drawing.Color.Red;
                }


            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }
    }

}