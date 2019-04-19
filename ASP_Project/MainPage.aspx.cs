using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    const string constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Harshal\Desktop\ASP_Project\ASP_Project\App_Data\ASP_Project_Database.mdf;Integrated Security=True";
   // SqlConnection ConObj;
    string uname;
    string pwd;
    string notes;
    public MainPage()
    {
        

        //ConObj = new SqlConnection(constr);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void ActionListener(object sender, EventArgs e)
    {
        uname = Session["username"].ToString();
        pwd = Session["password"].ToString();
        notes = note.Text;

        Button btn = (Button)sender;

        switch (btn.ID)
        {
            case "addnote":
                if (notes.Equals(String.Empty))
                {
                    return;
                }
                note.Text = String.Empty;
                AddNotes();
                display();
                break;

            case "deletenote":
                DeleteNotes();
                display();
                break;

            case "shownote":
                display();
                break;
            case "Logout":
                Response.Redirect("~/Login.aspx");
                break;

            case "updatenote":
                if (notes.Equals(String.Empty))
                {
                    return;
                }
                note.Text = String.Empty;
                UpdateNotes();
                display();
                break;


        }
    }

    public void AddNotes()
    {

        using (SqlConnection ConObj = new SqlConnection(constr))
        {
            ConObj.Open();
            int update = 0;
            try
            {
                using (SqlCommand cmd = new SqlCommand("Add_Stickey_Notes", ConObj))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@uname", SqlDbType.VarChar).Value = uname.Trim();
                    cmd.Parameters.AddWithValue("@passwd", SqlDbType.VarChar).Value = pwd.Trim();
                    cmd.Parameters.AddWithValue("@note", SqlDbType.VarChar).Value = notes.Trim();
                    cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = DateTime.Now.Date;

                    update = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception exp)
            {
                note.Text = exp.Message;
            }
            
        }
    }

    public void display()
    {
        using (SqlConnection ConObj = new SqlConnection(constr))
        {
            ConObj.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("Display_StickyNotes", ConObj);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uname", SqlDbType.VarChar).Value = uname.Trim();

                SqlDataReader reader = null;
                reader = cmd.ExecuteReader();
                
                NoteGrid.DataSource = reader;
                NoteGrid.DataBind();

            }
            catch (Exception exp)
            {
                note.Text += exp.Message;
            }
            
        }
    }

    public void DeleteNotes()
    {
        using (SqlConnection ConObj = new SqlConnection(constr))
        {
            
            int update = 0;
            try
            {
                foreach (GridViewRow row in NoteGrid.Rows)
                {
                    var checkbox = row.FindControl("CheckBox1") as CheckBox;

                    if (checkbox.Checked)
                    {
                        var note = row.FindControl("lb2") as TextBox;


                        using (SqlCommand cmd = new SqlCommand("Delete_Notes", ConObj))
                        {

                            cmd.CommandType = System.Data.CommandType.StoredProcedure;                           
                            cmd.Parameters.AddWithValue("@note", SqlDbType.VarChar).Value = note.Text;

                            ConObj.Open();
                            update = cmd.ExecuteNonQuery();
                            ConObj.Close();
                        }
                    }
                }
            }
            catch (Exception exp)
            {
                note.Text = exp.Message;
            }

        }
       
    }

    public void UpdateNotes()
    {
        using (SqlConnection ConObj = new SqlConnection(constr))
        {

            int update = 0;
            try
            {
                foreach (GridViewRow row in NoteGrid.Rows)
                {
                    var checkbox = row.FindControl("CheckBox1") as CheckBox;

                    if (checkbox.Checked)
                    {
                        var note = row.FindControl("lb2") as TextBox;

                        using (SqlCommand cmd = new SqlCommand("Update_Notes", ConObj))
                        {

                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@oldnote", SqlDbType.VarChar).Value = note.Text;
                            cmd.Parameters.AddWithValue("@newnote", SqlDbType.VarChar).Value = notes.Trim();

                            ConObj.Open();
                            update = cmd.ExecuteNonQuery();
                            ConObj.Close();
                        }
                    }
                }
            }
            catch (Exception exp)
            {
                note.Text = exp.Message;
            }

        }
    }
}