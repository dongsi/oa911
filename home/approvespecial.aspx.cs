using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approvespecial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string approveideastr = e.NewValues[0].ToString();
        string approvepeoplestr = e.NewValues[1].ToString();

        string specialstr = e.Keys[0].ToString();
        SqlDataSource3.UpdateCommand = "UPDATE v_special SET ApprovePeople = '" + approvepeoplestr + "',ApproveIdea='" + approveideastr + "' WHERE (SpecialAttId = " + specialstr + ")";
        SqlDataSource3.Update();
        GridView3.DataBind();
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView3.PageIndex * this.GridView3.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}