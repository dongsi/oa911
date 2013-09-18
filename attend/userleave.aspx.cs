using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class attend_userleave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bsave_Click(object sender, EventArgs e)
    {
        string inssqlstr = "INSERT INTO [ob_UserLeave]([UserId],[LeaveContent],[LeaveDays],[leaveDuration],[TransferContent],[TransferPeople],[LeaveDate]) values(";
        inssqlstr += Session["UserId"].ToString().Trim() + ",'";
        inssqlstr += LeaveContent.Text.Trim() + "','";
        inssqlstr += LeaveDays.Text.Trim() + "','";
        inssqlstr += leaveDuration.Text.Trim() + "','";
        inssqlstr += TransferContent.Text.Trim() + "','";
        inssqlstr += TransferPeople.Text.Trim() + "',GETDATE())";

        SqlDataSource1.InsertCommand = inssqlstr;
        SqlDataSource1.Insert();


    }
}