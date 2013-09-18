using System;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class baseinfo_addtenderuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddUserButton_Click(object sender, EventArgs e)
    {
        string tenderusername = TtenderLoginName.Text.Trim();
        string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword.Text, "MD5");

        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        string searchsqlstr = "select * from ob_Tenderinfo where UserLoginName='" + tenderusername + "'";
        SqlCommand searchcmd = new SqlCommand(searchsqlstr, conn);
        try
        {
            conn.Open();
        }
        catch (System.Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            SqlDataReader sdr = searchcmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Write("<script>alert('用户名已经存在，请修改后再添加！');history.back();</script>");
                sdr.Close();
                conn.Close();
            }
            else
            {
                sdr.Close();
                conn.Close();

                string sqlstr = "insert into ob_Tenderinfo(UserLoginName,UserLoginPassword,AddDate) values('" +
                    tenderusername + "','" + md5password + "',getdate())";
                SqlCommand cmd = new SqlCommand(sqlstr, conn);
                try
                {
                    conn.Open();
                }
                catch (System.Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('创建新用户成功！');</script>");
                        Response.Redirect("edittenderuser.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('由于未知原因创建新用户没有成功！');history.back();</script>");
                    }
                    conn.Close();
                }
            }

        }
    }
}