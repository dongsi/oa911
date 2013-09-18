using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class caiwu_inputstamp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string stampnotesstr;
        if (StampNotes.Text.Trim().Length == 0)
        {
            stampnotesstr = " ";
        }
        else
        {
            stampnotesstr = StampNotes.Text.Trim();
        }

        string inssql = "INSERT INTO [ob_Stamp] ([UserId],[StampContent], [StampUser], [UserAddress], [UserName], [UserTel], [UserPhone], [UseDate], [Operator], [StampNotes], [StampDate]) VALUES ("
            + Session["userid"].ToString() + ",'"
            + StampContent.Text.Trim() + "','"
            + StampUser.Text.Trim() + "','"
            + UserAddress.Text.Trim() + "','"
            + UserName.Text.Trim() + "','"
            + UserTel.Text.Trim() + "','"
            + UserPhone.Text.Trim() + "','"
            + UseDate.Text.Trim() + "','"
            + Operator.Text.Trim() + "','"
            + stampnotesstr + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        SqlDataSource1.Insert();
        Button1.Enabled = false;
        Label1.Text = "提交成功！";
    }
}