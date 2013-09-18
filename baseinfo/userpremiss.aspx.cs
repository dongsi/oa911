using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class userpremiss : System.Web.UI.Page
{
    private System.Data.DataView dv = null;
    private int MenuItemCount = 100;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSourceSelectArguments arg = new DataSourceSelectArguments();  
        dv = (System.Data.DataView)SqlDataSource2.Select(arg); 
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (dv!=null)
        {
            setPremissCheck(dv.Table.Rows[ListBox1.SelectedIndex]["UserPremiss"].ToString());
        }
    }
    private void setPremissCheck(string userpre)
    {
        //根据权限设置checkbox组的状态
        bool checkvalue = false;
        for(int i=0;i<MenuItemCount;i++)
        {
           
            if (userpre.Substring(i,1)=="1")
            {
                checkvalue = true;              
            }
            else
            {
                checkvalue = false;
            }
            string checkboxname = "CheckBox" + i.ToString();
            CheckBox cb = (CheckBox)this.Panel1.FindControl(checkboxname);
            if (cb != null)
            {
                cb.Checked = checkvalue;
            }
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string userpre = "";
        if (ListBox1.SelectedIndex >= 0)
        {

            for (int i = 0; i < MenuItemCount; i++)
            {

                string checkboxname = "CheckBox" + i.ToString();
                CheckBox cb = (CheckBox)this.Panel1.FindControl(checkboxname);
                if (cb != null)
                {
                    if (cb.Checked)
                    {
                        userpre += "1";
                    }
                    else
                    {
                        userpre += "0";
                    }
                }

            }
            userpre += label23.Text .ToString();
            string sql = "update ob_userinfo set UserPremiss='" + userpre + "' where UserId=" + ListBox1.SelectedValue;
            label22.Text = sql + "成功！";
            
            SqlDataSource2.UpdateCommand = sql;
            SqlDataSource2.Update();
        }
        
    }
}