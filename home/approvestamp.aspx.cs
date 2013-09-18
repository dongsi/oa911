using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approvestamp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView5_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string updatesql = "UPDATE [ob_Stamp] SET [Approver] = '" + e.NewValues[0].ToString() + "' WHERE [Stampid] = " + e.Keys[0].ToString();
        SqlDataSource5.UpdateCommand = updatesql;
        SqlDataSource5.Update();
        GridView5.DataBind();
    }
    protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView5.PageIndex * this.GridView5.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}