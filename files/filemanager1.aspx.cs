using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Configuration;
using System.Data;

public partial class files_filemanager1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //报价文件
        if (!IsPostBack)
        {
            switch (Request.QueryString["type"].ToString())
            {
                case "0":
                    Label3.Text = "常用文件";
                    break;
                case "1":
                    Label3.Text = "常用格式";
                    break;
                case "2":
                    Label3.Text = "公司制度";
                    break;
                case "3":
                    Label3.Text = "初步配置 （根据项目现场勘测做出的准确、不漏项的配置清单）";
                    nextStep.Visible = true;
                    break;
                case "4":
                    Label3.Text = "配置成本 （依据“初步配置”咨询厂家后做出的是否含税价格）";
                    nextStep.Visible = true;
                    break;
                case "5":
                    Label3.Text = "报价草案（是依据“配置成本”加上适当利润后对外报价，经理审核时可能扩大数量）";//原来的“对外报价”
                    nextStep.Visible = true;
                    break;
                case "6":
                    Label3.Text = "最终报价（是经用户同意后的成交价格）";//原来的“报价文件”
                    nextStep.Visible = true;
                    break;
                case "7":
                    Label3.Text = "学习园地";
                    GridView1.Columns[5].Visible = true;
                    break;
                case "8":
                    Label3.Text = "下单采购（最终报价得出后，根据配置成本配置进行采购）";
                    Label4.Visible = false;
                    GridView1.Columns[3].Visible=false;
                    break;
                case "9":
                    Label3.Text = "采购合同";
                    break;
                case "10":
                    Label3.Text = "项目合同";
                    break;
                case "11":
                    Label3.Text = "资质证件";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
                case "12":
                    Label3.Text = "考勤考核";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
                case "13":
                    Label3.Text = "外包报价";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
                case "14":
                    Label3.Text = "文件草案";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
                case "15":
                    Label3.Text = "文件定稿";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
                case "16":
                    Label3.Text = "开票结算";
                    GridView1.Columns[3].Visible = false;
                    Label4.Visible = false;
                    nextStep.Visible = false;
                    break;
            }
            //①常用文件，②常用格式，③公司制度，④初步配置，⑤配置成本，⑥对外报价，⑦最终报价，⑧学习园地，⑨合同汇总，⑩项目合同
           
                
            //if ((bool)Session["admin"])
            //{
            //    Panel2.Visible = true;
            //}
            //else
            //{
            //    Panel2.Visible = false;
            //}
        } 
       
       
    }
    protected void Upload_Click(object sender, EventArgs e)
    {
        RemoteUpload uploadClient = null;
        string localfile;
        string remotefile;
        string filesize;
        string uploaduserid = Session["UserId"].ToString();
        String path = Server.MapPath("~/UploadedImages/");
        string nextstep;
        string remarks;
        if (FileUpload1.HasFile)
        {

            localfile = FileUpload1.FileName;
            nextstep = nextStep.SelectedValue;
            filesize = FileUpload1.FileBytes.Length.ToString();
            uploadClient = new HttpRemoteUpload(FileUpload1.FileBytes, localfile, path);
            remotefile = uploadClient.NewFileName;
            remarks = remark.Text;
            if (uploadClient.UploadFile())
            {

                Label2.Text = "上传成功";
                String inssql = "INSERT INTO [ob_UploadFile] ([UploadUserId], [LocalFileName], [RemoteFileName], [FileSize], [UploadDate],[Filetype],[nextStep],[remark]) VALUES ("
                    + uploaduserid + ",'" + localfile + "','" + remotefile + "'," + filesize + ",getdate(),'" + Request.QueryString["type"].ToString() + "','"+ nextstep +"','"+ remarks +"')";
                SqlDataSource1.InsertCommand = inssql;
                SqlDataSource1.Insert();
                GridView1.DataBind();
            }
            else
            {
                Label2.Text = "上传失败";
            }


        }
        else
        {
            Label2.Text = "没有文件需要上传";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Todo::下载选中的文件
        string conn = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;
        string com = "select * from ob_UploadFile where UploadFileId=" + GridView1.SelectedDataKey.Value.ToString();
        SqlDataSource sds = new SqlDataSource(conn, com);
        DataView dv = (DataView)sds.Select(new DataSourceSelectArguments());
        string localfile = dv.Table.Rows[0][2].ToString();
        string remotefile = dv.Table.Rows[0][3].ToString();
        sds.Dispose();
        dv.Dispose();
        string path = Server.MapPath("~/UploadedImages/");

        RemoteDownload downloadClient = null;
        downloadClient = new HttpRemoteDownload(path + remotefile, "c:/temp/");
        if (downloadClient.DownloadFile())
        {
            Label2.Text = "下载完成！";

        }
        else
        {
            Label2.Text = "下载失败！";

        }


    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Todo::删除选中的文件后再删除记录
        string conn = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; ;
        string com = "select * from ob_UploadFile where UploadFileId=" + e.Keys[0].ToString();
        SqlDataSource sds = new SqlDataSource(conn, com);
        DataView dv = (DataView)sds.Select(new DataSourceSelectArguments());
        string localfile = dv.Table.Rows[0][2].ToString();
        string remotefile = dv.Table.Rows[0][3].ToString();
        sds.Dispose();
        dv.Dispose();
        string path = Server.MapPath("~/UploadedImages/");
        try
        {
            File.Delete(path + remotefile);
        }
        catch (System.Exception ex)
        {
            Label2.Text = "删除失败" + ex.Message;
            e.Cancel = true;
        }
        finally
        {
            Label2.Text = "删除成功";
            e.Cancel = false;
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[1].Text = indexID.ToString();
        }
    }

   
}