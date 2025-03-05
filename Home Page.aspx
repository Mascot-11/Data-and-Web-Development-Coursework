<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home Page.aspx.cs" Inherits="DataWebDev.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Project Management Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
            line-height: 1.6;
            perspective: 1000px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
            flex-grow: 1;
        }
        .header {
            text-align: center;
            margin-bottom: 3rem;
            opacity: 0;
            animation: fadeInDown 0.8s ease forwards;
        }
        .header h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            font-weight: 500;
            margin-bottom: 0.5rem;
            transform: translateY(-20px);
            opacity: 0;
            animation: fadeInUp 0.8s ease 0.3s forwards;
        }
        .header p {
            color: #6c757d;
            max-width: 600px;
            margin: 0 auto;
            transform: translateY(20px);
            opacity: 0;
            animation: fadeInUp 0.8s ease 0.5s forwards;
        }
        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            opacity: 0;
            animation: fadeInUp 0.8s ease 0.7s forwards;
        }
        .btn {
            display: inline-block;
            width: 100%;
            padding: 1rem;
            border: 1px solid #e9ecef;
            border-radius: 4px;
            background-color: white;
            color: #495057;
            font-size: 0.95rem;
            font-weight: 500;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transform: rotateX(15deg);
            transform-origin: bottom;
            backface-visibility: hidden;
        }
        .btn:hover {
            background-color: #f1f3f5;
            border-color: #dee2e6;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transform: rotateX(0) translateY(-5px);
        }
        .footer {
            background-color: #f1f3f5;
            padding: 1.5rem 0;
            text-align: center;
            margin-top: 2rem;
            color: #6c757d;
        }
        .footer-content {
            max-width: 600px;
            margin: 0 auto;
            font-size: 0.9rem;
        }
        .footer-content p {
            margin: 0.25rem 0;
        }
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @media (max-width: 768px) {
            .button-grid {
                grid-template-columns: 1fr;
            }
            .header h1 {
                font-size: 2rem;
            }
            .btn {
                transform: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div class="header">
            <h1>Project Management</h1>
            <p>Select a tool to manage your projects efficiently</p>
        </div>

        <div class="button-grid">
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
            
            <asp:Button ID="btnForm6" runat="server" Text="Project Milestone Form" OnClick="btnForm6_Click" 
                CssClass="btn" />
            
            <asp:Button ID="btnForm7" runat="server" Text="Top Performer Form" OnClick="btnForm7_Click" 
                CssClass="btn" />
            
            <asp:Button ID="btnForm8" runat="server" Text="Users Project Form" OnClick="btnForm8_Click" 
                CssClass="btn" />
        </div>
    </form>

    <footer class="footer">
        <div class="footer-content">
            <p><strong>CC6012NI Data and Web Development</strong></p>
            <p>Name: Shreeyush Dhungana</p>
            <p>London Met ID: 22067552</p>
            <p>College ID: np01cp4a220049</p>
            <p>Milestone: 3</p>
        </div>
    </footer>
</body>
</html>