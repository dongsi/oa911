using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        string md5password=FormsAuthentication.HashPasswordForStoringInConfigFile(Login1.Password,"MD5");
        string sqlstr = "select * from v_userdepartment where UserSimpName='" + Login1.UserName + "' and UserPassword='" + md5password + "'";
        SqlCommand cmd = new SqlCommand(sqlstr, conn);
        try
        {
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                e.Authenticated = true;
                Session["userid"] = reader["UserId"];
                Session["usersimpname"] = reader["UserSimpName"];
                Session["userfullname"] = reader["UserFullName"];
                Session["admin"] = reader["Admin"];
                Session["currentpassword"] = reader["UserPassword"];
                Session["departmentid"] = reader["DepartmentId"];
                Session["departmentrole"] = reader["DepartmentRole"];
                Session["userrole"] = reader["UserRole"];
                Session["userpremiss"] = reader["UserPremiss"];
                Session["resignation"] = reader["Resignation"];
            }

            else
            {
                e.Authenticated = false;
            }

            reader.Close();
        }
        catch (System.Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            conn.Close();
        }

       
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        if ((bool)Session["Resignation"])
        {
            Response.Redirect("~/home/ResignationDefault.aspx");
        }
        else
        {
            if ((bool)Session["Admin"])
            {
                Response.Redirect("~/home/AdminDefault.aspx");
            }
            else
            {
                Response.Redirect("~/home/userDefault.aspx");
            }
        }
    }
    protected void Bexit_Click(object sender, EventArgs e)
    {
        Response.Write("<script>history.back();</script>");
    }
}