using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlWatch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = e.Row.RowIndex + 1;
            e.Row.Cells[2].Text = indexID.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string inssql = "INSERT INTO [ob_Watch] ("
           + "[WatchTime], [ControlName], [ControlPhone], [WatchName], [WatchPhone], "
           + "[CheckName], [CheckPhone], [Notes], [WatchDate]) VALUES ('"
           + WatchTime.Text.Trim() + "','"
           + ControlName.Text.Trim() + "','"
           + ControlPhone.Text.Trim() + "','"
           + WatchName.Text.Trim() + "','"
           + WatchPhone.Text.Trim() + "','"
           + CheckName.Text.Trim() + "','"
           + CheckPhone.Text.Trim() + "','"
           + Notes.Text.Trim() + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        if (SqlDataSource1.Insert() > 0)
        {
            Button1.Enabled = false;
            Label2.Text = @"提交成功！";
            GridView1.DataBind();
        }
        else
        {
            Label2.Text = @"提交失败！";
        }
    }
}