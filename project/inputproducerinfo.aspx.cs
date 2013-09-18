using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project_inputproducerinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string producernotesstr;
        if (producerNotes.Text.Trim().Length == 0)
        {
            producernotesstr = " ";
        }
        else
        {
            producernotesstr = producerNotes.Text.Trim();
        }
        string inssql = "INSERT INTO [ob_MetaProducerinfo] ([UserId], [ProducerName], [ProductName], [HomePage], [ProducerAddress], [ProducerContact], [ContactTel], [ContactPhone], [TechContact], [TechTel], [TechPhone], [producerNotes], [MetaProducerDate]) VALUES ("
            + Session["userid"].ToString() + ",'"
            + ProducerName.Text.Trim() + "','"
            + ProductName.Text.Trim() + "','"
            + HomePage.Text.Trim() + "','"
            + ProducerAddress.Text.Trim() + "','"
            + ProducerContact.Text.Trim() + "','"
            + ContactTel.Text.Trim() + "','"
            + ContactPhone.Text.Trim() + "','"
            + TechContact.Text.Trim() + "','"
            + TechTel.Text.Trim() + "','"
            + TechPhone.Text.Trim() + "','"
            + producernotesstr + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        SqlDataSource1.Insert();
        Label1.Text = "提交成功，请勿重复提交！";
        Button1.Enabled = false;
    }
}