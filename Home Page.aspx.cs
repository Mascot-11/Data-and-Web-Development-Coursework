using System;
using System.Web;
using System.Web.UI;

namespace DataWebDev
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic (if needed)
        }

        // Redirect to Milestone Form
        protected void btnForm1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Simple Web Forms/Milestone.aspx");
        }

        // Redirect to Project Form
        protected void btnForm2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Simple Web Forms/Project.aspx");
        }

        // Redirect to SubTask Form
        protected void btnForm3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Simple Web Forms/SubTask.aspx");
        }

        // Redirect to Task Form
        protected void btnForm4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Simple Web Forms/Task.aspx");
        }

        // Redirect to Users Form
        protected void btnForm5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Simple Web Forms/Users.aspx");
        }

        // Redirect to Project Milestone Form
        protected void btnForm6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Complex Web Forms/Project Milestone.aspx");
        }

        // Redirect to Top Performer Form
        protected void btnForm7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Complex Web Forms/Top Performer.aspx");
        }

        // Redirect to Users Project Form
        protected void btnForm8_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Complex Web Forms/User Project.aspx");
        }
    }
}
