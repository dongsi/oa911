using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class caiwu_searchinvoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        string updatesql = "UPDATE [ob_InvoiceManager] SET  [InMoney] = '" + e.NewValues[0].ToString() + "' WHERE [InvoiceId] = " + e.Keys[0].ToString();
        SqlDataSource1.UpdateCommand = updatesql;
        SqlDataSource1.Update();

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[2].Text = indexID.ToString();
        }
    }
}