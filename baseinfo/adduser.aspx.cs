using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class baseinfo_adduser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddUserButton_Click(object sender, EventArgs e)
    {
        string simpname = UserName.Text;
        string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5");
        string userfullname = FullName.Text;


        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        string searchsqlstr = "select * from ob_userinfo where UserSimpName='" + simpname + "'";

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
                string userrole = DDUserRole.SelectedItem.ToString().Trim();
                string departmentid = DropDownList1.SelectedValue.ToString().Trim();
                string sqlstr = "insert into ob_userinfo(UserSimpName,UserPassword,UserFullName,DepartmentId,UserRole,JoinDate,Admin,UserPremiss,Resignation) values('" +
                    simpname + "','" + md5password + "','" + userfullname + "'," + departmentid + ",'" + userrole + "',getdate(),0,'0010000000000000011111111111111101110111100000000100000000000000000000000000000000000000000000000000',0)";

                SqlCommand cmd = new SqlCommand(sqlstr, conn);
                try
                {
                    conn.Open();
                    Response.Write(sqlstr);
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
                        Response.Redirect("edituser.aspx");
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