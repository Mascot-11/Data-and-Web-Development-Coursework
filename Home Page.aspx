<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home Page.aspx.cs" Inherits="DataWebDev.Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Project Management Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --secondary: #3f37c9;
            --dark: #2b2d42;
            --light: #f8f9fa;
            --gray: #6c757d;
            --success: #4cc9f0;
            --warning: #ffbe0b;
            --danger: #ef476f;
            --light-gray: #e9ecef;
            --border-radius: 12px;
            --shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
            --transition: all 0.3s ease;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        .navbar {
            background: white;
            padding: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            position: sticky;
            top: 0;
            z-index: 100;
            border-bottom: 1px solid var(--light-gray);
        }
        
        .navbar-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 12px;
        }
        
        .btn {
            background-color: white;
            color: var(--dark);
            font-weight: 500;
            padding: 0.75rem 1rem;
            border: 1px solid var(--light-gray);
            border-radius: var(--border-radius);
            font-size: 0.9rem;
            transition: var(--transition);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .btn:hover {
            background-color: var(--primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn i {
            margin-right: 0.5rem;
            font-size: 1rem;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            flex-grow: 1;
        }
        
        .header {
            text-align: center;
            margin-bottom: 3rem;
            padding: 3rem 1rem;
            background: linear-gradient(135deg, var(--primary-light), var(--secondary));
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .header:before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            background: rgba(255,255,255,0.1);
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }
        
        .header:after {
            content: '';
            position: absolute;
            bottom: -80px;
            left: -80px;
            background: rgba(255,255,255,0.08);
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }
        
        .header h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
            z-index: 1;
        }
        
        .header p {
            max-width: 600px;
            margin: 0 auto;
            font-size: 1.2rem;
            font-weight: 300;
            z-index: 1;
            position: relative;
        }
        
        .dashboard-section {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-top: 2rem;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--light-gray);
        }
        
        .section-header i {
            font-size: 1.8rem;
            color: var(--primary);
            margin-right: 1rem;
            background: rgba(67, 97, 238, 0.1);
            padding: 12px;
            border-radius: 10px;
        }
        
        .section-header h2 {
            font-weight: 600;
            color: var(--dark);
            margin: 0;
            font-size: 1.5rem;
        }
        
        .section-content p {
            color: var(--gray);
            margin-bottom: 2rem;
            font-size: 1.05rem;
        }
        
        .chart-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
        }
        
        .chart-card {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: var(--transition);
            border: 1px solid var(--light-gray);
            position: relative;
        }
        
        .chart-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border-color: var(--primary-light);
        }
        
        .chart-icon {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--primary);
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
        }
        
        .chart-header {
            margin-bottom: 1.5rem;
            padding-right: 50px;
        }
        
        .chart-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.25rem;
        }
        
        .chart-subtitle {
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .chart-container {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1rem;
        }
        
        .dropdown-container {
            margin: 1rem 0;
            width: 100%;
            max-width: 300px;
        }
        
        .custom-dropdown {
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius);
            border: 1px solid var(--light-gray);
            background-color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 0.9rem;
            color: var(--dark);
            cursor: pointer;
            transition: var(--transition);
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            width: 100%;
        }
        
        .custom-dropdown:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .chart-description {
            margin-top: 1rem;
            color: var(--gray);
            font-size: 0.9rem;
            text-align: center;
        }
        
        .footer {
            background-color: white;
            padding: 2rem 0;
            text-align: center;
            color: var(--gray);
            box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.05);
            margin-top: 3rem;
            border-top: 1px solid var(--light-gray);
        }
        
        .footer-content {
            max-width: 600px;
            margin: 0 auto;
            font-size: 0.9rem;
            padding: 0 1rem;
        }
        
        .footer-content p {
            margin: 0.5rem 0;
            transition: var(--transition);
        }
        
        .footer-content strong {
            color: var(--primary);
            font-weight: 600;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            transition: var(--transition);
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        .stat-icon {
            padding: 12px;
            border-radius: 10px;
            margin-right: 1rem;
            font-size: 1.5rem;
        }
        
        .stat-info h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }
        
        .stat-info p {
            color: var(--gray);
            font-size: 0.85rem;
            margin: 0;
        }
        
        .bg-primary {
            background: rgba(67, 97, 238, 0.1);
            color: var(--primary);
        }
        
        .bg-success {
            background: rgba(76, 201, 240, 0.1);
            color: var(--success);
        }
        
        .bg-warning {
            background: rgba(255, 190, 11, 0.1);
            color: var(--warning);
        }
        
        .bg-danger {
            background: rgba(239, 71, 111, 0.1);
            color: var(--danger);
        }
        
        @media (max-width: 768px) {
            .chart-grid {
                grid-template-columns: 1fr;
            }
            
            .navbar-container {
                grid-template-columns: 1fr 1fr;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .container {
                padding: 1rem;
            }
            
            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="navbar-container">
                <asp:Button ID="btnForm1" runat="server" Text="Milestone Form" OnClick="btnForm1_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm2" runat="server" Text="Project Form" OnClick="btnForm2_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm3" runat="server" Text="SubTask Form" OnClick="btnForm3_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm4" runat="server" Text="Task Form" OnClick="btnForm4_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm5" runat="server" Text="Users Form" OnClick="btnForm5_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm6" runat="server" Text="Project Milestone" OnClick="btnForm6_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm7" runat="server" Text="Top Performer" OnClick="btnForm7_Click" 
                    CssClass="btn" />
                
                <asp:Button ID="btnForm8" runat="server" Text="Users Project" OnClick="btnForm8_Click" 
                    CssClass="btn" />
            </div>
        </div>

        <div class="container">
            <div class="header">
                <h1><i class="fas fa-project-diagram"></i> Project Management Dashboard</h1>
                <p>Your comprehensive command center for efficient project tracking and team management</p>
            </div>
            
            <div class="chart-grid">
                <div class="chart-card">
                    <div class="chart-icon">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <div class="chart-header">
                        <div class="chart-title">Projects Per User</div>
                        <div class="chart-subtitle">Distribution of projects assigned to each user</div>
                    </div>
                    
                    <div class="chart-container">
                        <div class="dropdown-container">
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;">
                            </asp:SqlDataSource>
                            
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID"
                                CssClass="custom-dropdown">
                            </asp:DropDownList>
                        </div>
                        
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                            SelectCommand="SELECT p.ProjectName, COUNT(p.ProjectID) AS ProjectCount
                                FROM Users u
                                JOIN UserProject up ON u.UserID = up.Users_UserID
                                JOIN Project p ON up.Projects_ProjectID = p.ProjectID
                                WHERE u.UserID = :UserID
                                GROUP BY p.ProjectName
                                ORDER BY p.ProjectName">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="450px" Height="350px" 
                            BackColor="Transparent" BorderlineColor="Transparent" PaletteCustomColors="67, 97, 238; 72, 149, 239; 76, 201, 240; 66, 133, 244; 103, 58, 183">
                            <Titles>
                                <asp:Title Text="Projects Distribution" Font="Poppins, 14pt, style=Bold" ForeColor="#2b2d42"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series1" ChartType="Bar" XValueMember="PROJECTNAME" YValueMembers="PROJECTCOUNT" 
                                    IsValueShownAsLabel="true" Font="Poppins, 10pt" LabelBackColor="Transparent" LabelForeColor="#2b2d42">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <AxisX LineColor="#e9ecef" MajorGrid-LineColor="#e9ecef" Title="Project Name" TitleFont="Poppins, 11pt" TitleForeColor="#2b2d42">
                                        <LabelStyle Font="Poppins, 9pt" ForeColor="#6c757d" />
                                    </AxisX>
                                    <AxisY LineColor="#e9ecef" MajorGrid-LineColor="#e9ecef" Title="Count" TitleFont="Poppins, 11pt" TitleForeColor="#2b2d42">
                                        <LabelStyle Font="Poppins, 9pt" ForeColor="#6c757d" />
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Title="Projects" Docking="Bottom" Alignment="Center" 
                                    Font="Poppins, 10pt" TitleFont="Poppins, 11pt, style=Bold" BackColor="Transparent" ForeColor="#2b2d42">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                        
                        <div class="chart-description">
                            <i class="fas fa-info-circle"></i> Select a user from the dropdown to view their project distribution
                        </div>
                    </div>
                </div>
                
                <div class="chart-card">
                    <div class="chart-icon">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    <div class="chart-header">
                        <div class="chart-title">Project Status Distribution</div>
                        <div class="chart-subtitle">Overview of all projects by current status</div>
                    </div>
                    
                    <div class="chart-container">
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                            SelectCommand="SELECT p.ProjectStatus, COUNT(p.ProjectID) AS TotalProjects
                                FROM Project p
                                GROUP BY p.ProjectStatus
                                ORDER BY p.ProjectStatus">
                        </asp:SqlDataSource>
                        
                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource4" Width="450px" Height="350px" 
                            BackColor="Transparent" BorderlineColor="Transparent" PaletteCustomColors="67, 97, 238; 72, 149, 239; 76, 201, 240; 66, 133, 244; 103, 58, 183">
                            <Titles>
                                <asp:Title Text="Project Status" Font="Poppins, 14pt, style=Bold" ForeColor="#2b2d42"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="PROJECTSTATUS" YValueMembers="TOTALPROJECTS" 
                                    IsValueShownAsLabel="true" Font="Poppins, 10pt" LabelFormat="{0}" LabelBackColor="Transparent" LabelForeColor="#2b2d42">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Title="Status" Docking="Bottom" Alignment="Center" 
                                    Font="Poppins, 10pt" TitleFont="Poppins, 11pt, style=Bold" BackColor="Transparent" ForeColor="#2b2d42">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                        
                        <div class="chart-description">
                            <i class="fas fa-info-circle"></i> Visual representation of project status distribution
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="chart-grid" style="margin-top: 2rem;">
                <div class="chart-card">
                    <div class="chart-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="chart-header">
                        <div class="chart-title">User Role Distribution</div>
                        <div class="chart-subtitle">Team composition by role categories</div>
                    </div>
                    
                    <div class="chart-container">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                            SelectCommand="SELECT UserRole, COUNT(UserID) AS UserCount
                                FROM Users
                                GROUP BY UserRole">
                        </asp:SqlDataSource>
                        
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="450px" Height="350px" 
                            BackColor="Transparent" BorderlineColor="Transparent" PaletteCustomColors="67, 97, 238; 72, 149, 239; 76, 201, 240; 66, 133, 244; 103, 58, 183">
                            <Titles>
                                <asp:Title Text="User Roles" Font="Poppins, 14pt, style=Bold" ForeColor="#2b2d42"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="USERROLE" YValueMembers="USERCOUNT" 
                                    IsValueShownAsLabel="true" Font="Poppins, 10pt" LabelFormat="{0}" LabelBackColor="Transparent" LabelForeColor="#2b2d42">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                    <Area3DStyle Enable3D="false" />
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Title="Roles" Docking="Bottom" Alignment="Center" 
                                    Font="Poppins, 10pt" TitleFont="Poppins, 11pt, style=Bold" BackColor="Transparent" ForeColor="#2b2d42">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                        
                        <div class="chart-description">
                            <i class="fas fa-info-circle"></i> Breakdown of team members by role classification
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <footer class="footer">
        <div class="footer-content">
            <p><strong>CC6012NI Data and Web Development</strong></p>
            <p>Name: Shreeyush Dhungana</p>
            <p>London Met ID: 22067552</p>
            <p>College ID: np01cp4a220049</p>
        </div>
    </footer>

    <script>
        // Add icons to the buttons
        document.addEventListener('DOMContentLoaded', function () {
            const btnMapping = {
                'btnForm1': 'fa-flag',
                'btnForm2': 'fa-project-diagram',
                'btnForm3': 'fa-tasks',
                'btnForm4': 'fa-clipboard-list',
                'btnForm5': 'fa-users',
                'btnForm6': 'fa-chart-bar',
                'btnForm7': 'fa-trophy',
                'btnForm8': 'fa-user-check'
            };

            for (const [btnId, iconClass] of Object.entries(btnMapping)) {
                const btn = document.getElementById(btnId);
                if (btn) {
                    const text = btn.value;
                    btn.innerHTML = `<i class="fas ${iconClass}"></i> ${text}`;
                }
            }

            // Add hover animation to chart cards
            const cards = document.querySelectorAll('.chart-card');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function () {
                    const icon = this.querySelector('.chart-icon i');
                    if (icon) {
                        icon.style.transform = 'scale(1.2) rotate(5deg)';
                        icon.style.transition = 'transform 0.3s ease';
                    }
                });

                card.addEventListener('mouseleave', function () {
                    const icon = this.querySelector('.chart-icon i');
                    if (icon) {
                        icon.style.transform = 'scale(1) rotate(0deg)';
                    }
                });
            });

            // Add animation to stat cards
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach(card => {
                card.addEventListener('mouseenter', function () {
                    this.style.transform = 'translateY(-5px)';
                });

                card.addEventListener('mouseleave', function () {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>