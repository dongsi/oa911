using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class meeting_EditMinutes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[2].Text = indexID.ToString();
        }
    }
    protected bool isDepartmentHeader()
    {
        if (Session["userrole"].ToString() == "经理" || (bool)Session["admin"])
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}