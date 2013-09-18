using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCalls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //SELECT TOP 1000 [callsId],[FullName],[PhoneNumber],[DuringCalls],[ActualCalls],[ExcessCharges] ,[Remark],[submitTime],[UserFullName]
 //  FROM [u911110oa].[dbo].[v_CallsPublicity]
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}