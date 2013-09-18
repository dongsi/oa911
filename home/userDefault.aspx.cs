using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Extensions;


public partial class home_userDefault : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (Session["userrole"].ToString() == "经理")
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Lusername.Text = GridView1.SelectedRow.Cells[3].Text;
        Lleavecontent.Text = GridView1.SelectedRow.Cells[4].Text;


    }
    protected void Bsave_Click(object sender, EventArgs e)
    {
        string sqlstr = "UPDATE ob_UserLeave SET DepartmentIdea='" + TBdepartmentidea.Text.Trim()
            + "' , ApproveUserId=" + Session["userid"].ToString().Trim()
            + " WHERE LeaveId=" + GridView1.SelectedRow.Cells[1].Text.Trim();
        SqlDataSource2.UpdateCommand = sqlstr;
        SqlDataSource2.Update();
        Panel2.Visible = false;
        GridView1.DataBind();
    }
    protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView4.PageIndex * this.GridView4.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}