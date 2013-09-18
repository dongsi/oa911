using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class worklog_worklog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSourceID = getsds();
    }
    public string getsds()
    {
        string sds="";
        if (!(bool)Session["admin"])
        {
            if (Session["userrole"].ToString() == "经理")
            {
                sds = "SqlDataSource2";
            }
            else
            {
                sds = "SqlDataSource3";
            }
        }
        else
        {
            sds = "SqlDataSource1";
        }
        return sds;
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
         if (e.Row.RowType == DataControlRowType.DataRow)//当前行是否是数据绑定行(过滤标题行和序号行等非数据绑定行)
         {
             for (int i = 0; i < e.Row.Cells.Count;i++ )
             {
             
                 e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;            
                 if (e.Row.Cells[i].Text.Length > 10)            
                 {                
                   e.Row.Cells[i].Text = e.Row.Cells[i].Text.Substring(0,10) + "...";            
                 }
                
             }
             Label lreview = (Label)e.Row.FindControl("label2");
             if (lreview != null)
             {
                 lreview.ToolTip = lreview.Text;
                 if (lreview.Text.Length > 10)
                 {
                     lreview.Text = lreview.Text.Substring(0, 10) + "...";
                 }
             }
         }
    }
}