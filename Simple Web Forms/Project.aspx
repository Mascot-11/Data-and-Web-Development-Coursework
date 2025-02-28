<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="DataWebDev.Simple_Web_Forms.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTSTATUS&quot;, &quot;PROJECTENDDATE&quot;) VALUES (:PROJECTID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTSTATUS, :PROJECTENDDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTSTATUS&quot;, &quot;PROJECTENDDATE&quot; FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS, &quot;PROJECTENDDATE&quot; = :PROJECTENDDATE WHERE &quot;PROJECTID&quot; = :PROJECTID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
            <EditItemTemplate>
                PROJECTID:
                <asp:Label ID="PROJECTIDLabel1" runat="server" Text='<%# Eval("PROJECTID") %>' />
                <br />
                PROJECTNAME:
                <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                <br />
                PROJECTSTARTDATE:
                <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' />
                <br />
                PROJECTSTATUS:
                <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' />
                <br />
                PROJECTENDDATE:
                <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                PROJECTID:
                <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' />
                <br />
                PROJECTNAME:
                <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                <br />
                PROJECTSTARTDATE:
                <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' />
                <br />
                PROJECTSTATUS:
                <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' />
                <br />
                PROJECTENDDATE:
                <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PROJECTID:
                <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Eval("PROJECTID") %>' />
                <br />
                PROJECTNAME:
                <asp:Label ID="PROJECTNAMELabel" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                <br />
                PROJECTSTARTDATE:
                <asp:Label ID="PROJECTSTARTDATELabel" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' />
                <br />
                PROJECTSTATUS:
                <asp:Label ID="PROJECTSTATUSLabel" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' />
                <br />
                PROJECTENDDATE:
                <asp:Label ID="PROJECTENDDATELabel" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:FormView>
    </form>
</body>
</html>
