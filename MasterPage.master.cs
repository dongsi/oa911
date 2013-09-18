using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string ipaddress;


    protected void Page_Load(object sender, EventArgs e)
    {

      Label1.Text = DateTime.Now.ToString();
        
        Label2.Text = (string)Session["userfullname"];
        
        if (!IsPostBack)
        {
            checkatt();//判断当前登录用户在今天是否考勤过，如有考勤，设置相应按钮为禁止
            if ((bool)Session["Resignation"])
            {
                Menu1.Visible = false;
            }
            else
            {
                CreateMenu();//根据当前登录用户的权限构造菜单栏
            }
            displaybeginendtime();//如果当前用户是管理员，则显示修改考勤时间 
            changeHomePageUrl();//根据当前用户修改返回主页的Url
           
        }

    }
    private void CreateMenu()
    {
        DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
        foreach (DataRow row in dv.Table.Rows)
        {
            if (row["ParentMenuId"].ToString() == "0")
            {
                if (checkuserpremiss(Int32.Parse(row["Itempremiss"].ToString())))
                {
                    MenuItem rootitem = new MenuItem(row["ItemName"].ToString(), row["MenuId"].ToString());
                    if (row["ItemUrl"].ToString().Length > 0)
                    {
                        rootitem.NavigateUrl = row["ItemUrl"].ToString();
                    }
                    this.Menu1.Items.Add(rootitem);
                }
                
            }
        }
        foreach (DataRow row in dv.Table.Rows)
                {
                    foreach (MenuItem item in Menu1.Items)
                    {
                        if (row["ParentMenuId"].ToString()==item.Value&&item.Value!="0")
                        {
                            if (checkuserpremiss(Int32.Parse(row["Itempremiss"].ToString())))
                            {
                                MenuItem childitem = new MenuItem(row["ItemName"].ToString(), row["MenuId"].ToString());
                                if (row["ItemUrl"].ToString().Length > 0)
                                {
                                    childitem.NavigateUrl = row["ItemUrl"].ToString();
                                }
                                item.ChildItems.Add(childitem);
                            }
                            
                        }
                    }
                }
                
            
        
    }

    private static SqlConnection CreateConn()
    {
        //根据系统配置的连接字符串创建一个数据库连接
        string connectionString;
        SqlConnection conn;
        connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        conn = new SqlConnection(connectionString);
        return conn;
    }

    private void checkatt()
    {
        
 
        SqlConnection conn;
        conn = CreateConn();
        if (Context.Request.ServerVariables["HTTP_VIA"] != null)
        {
            ipaddress = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else
        {
            ipaddress = Context.Request.ServerVariables["REMOTE_ADDR"].ToString();
        }
        Session["ipaddress"] = ipaddress;
        if (Bbegin.Enabled)
        {
            string beginsqlstr = "select * from ob_Attend where UserId=" + Session["userid"] + " and  datediff(day,'1900-01-01',BeginDate)=datediff(day,'1900-01-01','" + DateTime.Now.ToShortDateString() + "')";
            SqlCommand begincmd = new SqlCommand(beginsqlstr, conn);
            try
            {
                conn.Open();
            }
            catch (System.Exception ex)
            {

            }
            finally
            {
                SqlDataReader beginreader = begincmd.ExecuteReader();
                if (beginreader.Read())
                    Bbegin.Enabled = false;
                beginreader.Close();
                conn.Close();
            }

        }
        if (Bend.Enabled)
        {
            string endsqlstr = "select * from ob_Attend where UserId=" + Session["userid"] + " and datediff(day,'1900-01-01',EndDate)=datediff(day,'1900-01-01','" + DateTime.Now.ToShortDateString() + "')";
            SqlCommand endcmd = new SqlCommand(endsqlstr, conn);
            try
            {
                conn.Open();
            }
            catch (System.Exception ex)
            {

            }
            finally
            {
                SqlDataReader endreader = endcmd.ExecuteReader();
                if (endreader.Read())
                    Bend.Enabled = false;
                endreader.Close();
                conn.Close();
            }
        }
    }
    protected void Bend_Click(object sender, EventArgs e)
    {
        
        SqlConnection conn;
        conn = CreateConn();
        string selectstr="select * from ob_Attend where UserId="+Session["userid"].ToString().Trim()+" and datediff(day,'1900-01-01',BeginDate)=datediff(day,'1900-01-01',GETDATE())";
        SqlCommand selectcmd = new SqlCommand(selectstr, conn);
        string insertsqlstr;
        try
        {
            conn.Open();
        }
        catch (System.Exception ex)
        {

        }
        finally
        {
            SqlDataReader beginreader = selectcmd.ExecuteReader();
            if (beginreader.Read())
            {
                insertsqlstr = "update ob_Attend set EndDate=GETDATE(),EndIp='" + Session["ipaddress"] + "' where UserId=" + Session["userid"].ToString().Trim() + " and datediff(day,'1900-01-01',BeginDate)=datediff(day,'1900-01-01',GETDATE())";
                
            }
            else
            {
                insertsqlstr = "insert into ob_Attend(UserId,EndDate,EndIp) values (" + Session["userid"] + ",GETDATE(),'" + ipaddress + "')";
            }
            beginreader.Close();
            conn.Close();
        }
        
        SqlCommand cmd = new SqlCommand(insertsqlstr, conn);
        try
        {
            conn.Open();
        }
        catch (System.Exception ex)
        {

        }
        finally
        {
            if (cmd.ExecuteNonQuery() > 0)
            {
                Bend.Enabled = false;

            }
            conn.Close();
        }
    }
    protected void Bbegin_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        conn = CreateConn();
        string insertsqlstr = "insert into ob_Attend(UserId,BeginDate,beginIp) values (" + Session["userid"] + ",GETDATE(),'" + Session["ipaddress"] + "')";
        SqlCommand cmd = new SqlCommand(insertsqlstr, conn);
        try
        {
            conn.Open();
        }
        catch (System.Exception ex)
        {
        	
        }
        finally
        {
            if (cmd.ExecuteNonQuery() > 0)
            {
                Bbegin.Enabled = false;

            }
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string updatestr = "UPDATE [ob_time] SET [begintime] = '" + TBeginTime.Text.Trim() + "', [endtime] = '" + TEndTime.Text.Trim() + "' WHERE [timeId] = 1";
        SqlDataSource2.UpdateCommand = updatestr;
        SqlDataSource2.Update();
      
    }
    private void displaybeginendtime()
    {
        if ((bool)Session["admin"])
       {
           //读取上下班的考勤时间设计
            DataView dv = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());
           TBeginTime.Text = dv.Table.Rows[0]["begintime"].ToString();
           TEndTime.Text = dv.Table.Rows[0]["endtime"].ToString();
       } 
       else
       {
           Panel1.Visible = false;
           
           Button1.Visible = false;
       }
       
    }
    private bool checkuserpremiss(int premissbit)
    {
        string userpre=Session["userpremiss"].ToString();
        bool result = false;
        if (premissbit < 0)
            return true;
        if (userpre.Substring(premissbit,1)=="1")
        {
            result = true;
        } 
        else
        {
            result = false;
        }
        return result;
    }
    private void changeHomePageUrl()
    {
        string urlstr = "";
        MenuItemCollection menuitems = Menu1.Items;
      
            if ((bool)Session["admin"])
            {
                urlstr = "~/home/AdminDefault.aspx";
            }
            else
            {
                urlstr = "~/home/userDefault.aspx";
            }
            foreach (MenuItem mi in menuitems)
            {
                if (mi.Value == "38")//返回首页菜单
                {
                    mi.NavigateUrl = urlstr;
                }
           
            }
      
    }
  
}
