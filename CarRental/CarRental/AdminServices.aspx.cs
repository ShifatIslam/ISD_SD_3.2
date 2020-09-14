using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class routesetter : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkModelID())
            {
                Response.Write("<script>alert('This Name already exists!');</script>");
            }
            else
            {
                addnewService();
            }
        }
        //Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkModelID())
            {
                updateModel();

            }
            else
            {
                Response.Write("<script>alert('Incorrect ModelID!');</script>");
            }
        }
        //Delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkModelID())
            {
                deleteModel();

            }
            else
            {
                Response.Write("<script>alert('Incorrect ModelID!');</script>");
            }
        }
        //Go
        protected void Button2_Click(object sender, EventArgs e)
        {
            addnewService();
        }
        void addnewService()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Services(ServiceID,ServiceName)values(@ServiceID,@ServiceName)", conn);
                cmd.Parameters.AddWithValue("@ServiceID", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@ServiceName", TextBox4.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Service Name added successfully!');</script>");
                cleartable();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateModel()
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("UPDATE  Services SET serviceName=@ServiceName WHERE ServiceID='" + TextBox3.Text.Trim() + "'", conn);

                cmd.Parameters.AddWithValue("@ServiceName", TextBox4.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Service Name Updated successfully!');</script>");
                cleartable();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void deleteModel()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM Services WHERE ServiceID='" + TextBox3.Text.Trim() + "'", conn);


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Service Name deleted successfully!');</script>");
                cleartable();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        bool checkModelID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Services where ServiceID='" + TextBox3.Text.Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                if (da.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }




            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }
        }
        void cleartable()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}