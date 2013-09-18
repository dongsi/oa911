using System;
using System.Web.UI;
using System.Data;
using Microsoft.Reporting.WebForms;

public partial class attend_attendreport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = this.RadioButtonList1.SelectedIndex;

        switch (this.RadioButtonList1.SelectedIndex)
        {
            case 0:
                ReportViewer1.LocalReport.DataSources.Clear();
                DataView dvatt = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
                ReportDataSource rdsatt = new ReportDataSource("DataSetattendance", dvatt.Table);
                ReportViewer1.LocalReport.DataSources.Add(rdsatt);
                ReportViewer1.LocalReport.Refresh();
                break;
            case 1:
                ReportViewer4.LocalReport.DataSources.Clear();
                DataView dv = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());
                ReportDataSource rds = new ReportDataSource("DataSetleave", dv);
                ReportViewer4.LocalReport.DataSources.Add(rds);
                ReportViewer4.LocalReport.Refresh();
                break;
            case 2:
                ReportViewer3.LocalReport.DataSources.Clear();
                DataView dvspecial = (DataView)SqlDataSource3.Select(new DataSourceSelectArguments());
                ReportDataSource rdsspecial = new ReportDataSource("DataSetspecial", dvspecial.Table);
                ReportViewer3.LocalReport.DataSources.Add(rdsspecial);
                ReportViewer3.LocalReport.Refresh();
                break;
        }
    }
}