using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class DrivingOptions : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        int grand_value = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Auto input driving license
            Checkdrivinglicense();
            //Visibility
            btnSubmits.Visible = false;
            btnSubmit.Visible = false;
            RetDate.Visible = true;
            RetTime.Visible = true;
            DriveReturn.Visible = true;
            DriveReturnTime.Visible = true;
            round_trip.Visible = false;
            round_trip1.Visible = false;
            count_hours_1.Visible = false;
            count_hours.Visible = false;
            AirportService(); //Page reworked


        }
        void Checkdrivinglicense() //driving license check if true show or else blur
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                //License checked according to user name
                SqlCommand cmd = new SqlCommand("SELECT DrivingLicense  FROM UserReg WHERE UserID ='" + Session["username"].ToString() + "';", conn);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    string LicenseNumber = Convert.ToString(rd["DrivingLicense"]);
                    if (LicenseNumber.Trim() == "")
                    {
                        selfDriving.Attributes["style"] = "opacity:0.5; pointer-events:none;"; //no click events for div
                    }
                    else
                    {
                        LicenseNo.Value = LicenseNumber.ToString().Trim(); //show license number
                    }

                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                

            }
        }

        protected int SubTotal(double days, int hours, int hours_rate)
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("SELECT Cost  FROM CarDetails WHERE CarID ='" + Session["carid"].ToString() + "'", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                int rows = da.Rows.Count;
                foreach(DataRow row in da.Rows)
                {
                    if(hours_rate == 1)
                        grand_value += Convert.ToInt32(row["Cost"].ToString().Trim()) * (int)days * hours;
                    else
                        grand_value += Convert.ToInt32(row["Cost"].ToString().Trim()) * (int)days + hours_rate;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return grand_value;
        }


        protected void btnSubmits_Click(object sender, EventArgs e)//save the cart of user in db
        {
            addsavedcart();
        }
        void addsavedcart()
        {
            if(checkDate() == true)
            {
                Response.Write("<script>alert('Invalid date given');</script>");
            }
            else
            {
                var PickupDate = Pickup.Value;
                var ReturnDate = "";
                double days = 1;
                int hours = 1;
                int hours_rate = 1;
                var pickuploc = location_self.Value.ToString();
                var total_price = Session["taka"];
                Session["tot_price"] = total_price;
                if (Session["services"].ToString() == "Airport Transfer")
                {

                }
                else if(Session["services"].ToString() == "Hourly Rate")
                {
                    if (count_hours_text.Text.ToString().Trim() == "")
                    {
                        string hours_str = count_hours_text_1.Text.ToString();
                        hours = Int32.Parse(hours_str);
                    }
                    else
                        hours = Convert.ToInt32(count_hours_text.Text.ToString().Trim());
                    if (hours > 4)
                        hours_rate = (hours - 4) * 250;
                    
                    total_price = SubTotal(days, hours,hours_rate);
                    Session["tot_price"] = total_price;
                }
                else
                {
                    ReturnDate = returndate.Value;
                    days = (Convert.ToDateTime(ReturnDate) - Convert.ToDateTime(PickupDate)).TotalDays;
                    total_price = SubTotal(days,hours,hours_rate);
                    Session["tot_price"] = total_price;
                }

                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open(); //connection open plz
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO SavedCart(UserID,Carid,Service,PickupDate,ReturnDate,RentalDays,CostPerValue,GrandTotal,CarImage,PickupLocation)" +
                        "values(@UserID,@Carid,@Service,@PickupDate,@ReturnDate,@RentalDays,@CostPerValue,@GrandTotal,@CarImage,@PickupLocation)", conn);
                    cmd.Parameters.AddWithValue("@UserID", Session["username"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@Carid", Session["carid"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@Service", Session["services"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@PickupDate", PickupDate.ToString().Trim());
                    if (Session["services"].ToString() == "Airport Transfer")
                    {
                        cmd.Parameters.AddWithValue("@ReturnDate", "");
                        cmd.Parameters.AddWithValue("@RentalDays", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ReturnDate", ReturnDate.ToString().Trim());
                        cmd.Parameters.AddWithValue("@RentalDays", days.ToString().Trim());
                    }
                    cmd.Parameters.AddWithValue("@CostPerValue", Session["taka"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@GrandTotal", total_price.ToString().Trim());
                    cmd.Parameters.AddWithValue("@CarImage", Session["imagepath"]);
                    cmd.Parameters.AddWithValue("@PickupLocation", pickuploc.ToString().Trim());

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("SavedCart.aspx");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
            
           
            
        }

        protected void check_CheckedChanged(object sender, EventArgs e) //checkbox changed to hide or show button
        {
            if (check.Checked)
            {
                btnSubmits.Visible = true;
                withDriver.Attributes["style"] = "opacity:0.5; pointer-events:none;";
            }
            else
            {
                btnSubmits.Visible = false;
                withDriver.Attributes["style"] = "opacity:1; pointer-events:auto;";
            }
        }
        protected void check1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckDriver.Checked)
            {
                btnSubmit.Visible = true;
                selfDriving.Attributes["style"] = "opacity:0.5; pointer-events:none;";
            }
            else
            {
                btnSubmit.Visible = false;
                selfDriving.Attributes["style"] = "opacity:1; pointer-events:auto;";
            }
        }
        protected void check2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckRound.Checked || CheckRound1.Checked)
            {
                Session["taka"] =  Convert.ToInt32(Session["taka"]) + 500;
            }
            
        }
        protected void AirportService()//airport service page reworked
        {
            if (Session["services"].ToString() == "Airport Transfer")
            {
                RetDate.Visible = false;
                RetTime.Visible = false;
                DriveReturn.Visible = false;
                DriveReturnTime.Visible = false;
                round_trip.Visible = true;
                round_trip1.Visible = true;
            }
            if (Session["services"].ToString() == "Hourly Rate")
            {
                RetDate.Visible = false;
                RetTime.Visible = false;
                DriveReturn.Visible = false;
                DriveReturnTime.Visible = false;
                count_hours.Visible = true;
                count_hours_1.Visible = true;
            }
        }
  

        bool checkDate()
        {
            var selfpick = Pickup.Value;
            var driverpick = DriverPickup.Value;
            DateTime currentDate = DateTime.Now;
            if (selfpick == "")
            {
                DateTime compareDate1 = Convert.ToDateTime(this.DriverPickup.Value.Trim());
                if (currentDate > compareDate1)
                    return true;
            }
            else
            {
                DateTime compareDate = Convert.ToDateTime(this.Pickup.Value.Trim());
                if (currentDate > compareDate)
                    return true;
            }
          
            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            addsavedcart();
        }
    }
}