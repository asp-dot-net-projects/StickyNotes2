using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signup : System.Web.UI.Page
{
    const string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Harshal\Desktop\ASP_Project\ASP_Project\App_Data\ASP_Project_Database.mdf;Integrated Security=True";

    string fname;
    string lname;
    string uname;
    string email_id;
    string passwd;
    
    public Signup()
    {
         fname = null;
         lname = null;
         uname = null;
         passwd = null;
         email_id = null;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Signup_submit(object sender, EventArgs e)
    {
        int update = 0;
        fname = firstname.Text;
        lname = lastname.Text;
        uname = username.Text;
        email_id = email.Text;
        passwd = password.Text;

        using (SqlConnection ConObj = new SqlConnection(constr))
        {
            ConObj.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("Insert_User_Info", ConObj);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fname", SqlDbType.VarChar).Value = fname.Trim();
                cmd.Parameters.AddWithValue("@lname", SqlDbType.VarChar).Value = lname.Trim();
                cmd.Parameters.AddWithValue("@uname", SqlDbType.VarChar).Value = uname.Trim();
                cmd.Parameters.AddWithValue("@passwd", SqlDbType.VarChar).Value = passwd.Trim();
                cmd.Parameters.AddWithValue("@email", SqlDbType.VarChar).Value = email_id.Trim();
                update = cmd.ExecuteNonQuery();

            }
            catch (Exception exp)
            {
                firstname.Text = exp.Message;
            }
            
        }
        if (update > 0)
        {
            Response.Redirect("~/Login.aspx");
        }
        
    }


}