using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class baseinfo_editdepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource1.DeleteCommand = "DELETE FROM [ob_Department] WHERE [DepartmentId] =" + GridView1.DataKeys[e.RowIndex].Values["DepartmentId"].ToString();
        try
        {
            SqlDataSource1.Delete();
        }
        catch (System.Exception ex)
        {
            Response.Write("<script>alert('该部门已经被使用，不能删除！" + ex.Message + "');history.back();</script>");
            e.Cancel = true;
        }

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string updatestr = "UPDATE [ob_Department] SET [DepartmentName] = '" + e.NewValues["DepartmentName"].ToString();
        updatestr += "' WHERE [DepartmentId] = " + GridView1.DataKeys[e.RowIndex].Values["DepartmentId"].ToString();
        SqlDataSource1.UpdateCommand = updatestr;
        try
        {
            SqlDataSource1.Update();
        }
        catch (System.Exception ex)
        {
            Response.Write("<script>alert('由于系统原因，不能更新，请稍候再试！" + ex.Message + "');history.back();</script>");
        }
    }
    protected void createdepartment_Click(object sender, EventArgs e)
    {
        string newname = newdepartment.Text.Trim();
        SqlDataSource1.FilterExpression = "[DepartmentName]='" + newname + "'";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        SqlDataSource1.FilterExpression = "";
        SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Count > 0)
        {
            Response.Write("<script>alert('部门名称重复了！');history.back();</script>");


        }
        else
        {
            SqlDataSource1.InsertCommand = "INSERT INTO [ob_Department] ([DepartmentName]) VALUES ('" + newdepartment.Text.Trim() + "')";
            SqlDataSource1.Insert();
        }
        GridView1.DataBind();


    }
}