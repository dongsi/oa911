using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class caiwu_inputcheque : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cheqenotesstr;
        if (ChequeNotes.Text.Trim().Length == 0)
        {
            cheqenotesstr = " ";
        }
        else
        {
            cheqenotesstr = ChequeNotes.Text.Trim();
        }

        string inssql = "INSERT INTO [ob_ChequeManager] ([UserId], [ChequeContent], [ChequeCom], [ComAddress], [ContactName], [ContactTel], [ContactPhone], [WriteCom], [ChequeNumber], [ChequePrice], [WriteDate], [Operator], [ChequeNotes], [ChequeDate]) VALUES ("
            + Session["userid"].ToString() + ",'"
            + ChequeContent.Text.Trim() + "','"
            + ChequeCom.Text.Trim() + "','"
            + ComAddress.Text.Trim() + "','"
            + ContactName.Text.Trim() + "','"
            + ContactTel.Text.Trim() + "','"
            + ContactPhone.Text.Trim() + "','"
            + WriteCom.Text.Trim() + "','"
            + ChequeNumber.Text.Trim() + "','"
            + ChequePrice.Text.Trim() + "','"
            + WriteDate.Text.Trim() + "','"
            + Operator.Text.Trim() + "','"
            + cheqenotesstr + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        SqlDataSource1.Insert();
        Label1.Text = "提交登记成功！";
        Button1.Enabled = false;
    }
}