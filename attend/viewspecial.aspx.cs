using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class attend_viewspecial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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