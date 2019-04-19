using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    const string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Harshal\Desktop\ASP_Project\ASP_Project\App_Data\ASP_Project_Database.mdf;Integrated Security=True";
    string Username;
    string Password;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void connection(object sender, EventArgs e)
    {
        Username = username.Text;
        Password = password.Text;

        using (SqlConnection ConObj = new SqlConnection(constr))
        {
            ConObj.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("Get_Login_Info", ConObj);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", SqlDbType.VarChar).Value = Username.Trim();
                cmd.Parameters.AddWithValue("@passwd", SqlDbType.VarChar).Value = Password.Trim();
                SqlDataReader reader = null;
                reader = cmd.ExecuteReader();

                reader.Read();

                Username = reader["UserName"].ToString();
                Password = reader["Password"].ToString();

                if (Username.Equals(username.Text) && Password.Equals(password.Text))
                {
                    Session["username"] = Username;
                    Session["password"] = Password;
                    Response.Redirect("~/MainPage.aspx");
                }
                else
                {
                   
                }


            }
            catch (Exception exp)
            {
                errlb.Text = "Username or Password is invalid !";
            }
            
        }
    }  
}