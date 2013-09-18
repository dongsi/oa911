using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class caiwu_inputinvoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string notes;
        if (InvoiceNotes.Text.Length == 0)
        {
            notes = " ";
        }
        else
        {
            notes = InvoiceNotes.Text.Trim();
        }

        string inssql = "INSERT INTO [ob_InvoiceManager] ([UserId], [InvoiceName], [InvoiceContent], [WriteDate], [InvoiceMaker], [ContactName], [ContactTel], [ContactPhone], [InvoiceCom], [InvoicePrice], [InMoney], [InvoiceNotes], [InvoiceDate]) VALUES ("
            + Session["userid"].ToString() + ",'" + InvoiceName.Text.Trim() + "','"
            + InvoiceContent.Text.Trim() + "','"
            + WriteDate.Text.Trim() + "','"
            + InvoiceMaker.Text.Trim() + "','"
            + ContactName.Text.Trim() + "','"
            + ContactTel.Text.Trim() + "','"
            + ContactPhone.Text.Trim() + "','"
            + InvoiceCom.Text.Trim() + "','"
            + InvoicePrice.Text.Trim() + "','"
            + InMoney.Text.Trim() + "','"
            + notes + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        SqlDataSource1.Insert();
        Label1.Text = "提交登记成功！";
        Button1.Enabled = false;
    }
}