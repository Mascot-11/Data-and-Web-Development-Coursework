<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DataWebDev.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home Page</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0U5sR7L4pV3moC1L4G5v6hJYwQhJmkn6BQYpF7g+Qx8lP4ql" crossorigin="anonymous">
    <!-- Custom CSS for modern style -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            color: #333;
            padding-top: 50px;
            margin: 0;
        }

        header h1 {
            font-size: 3rem;
            color: #9b4dff;
            margin-bottom: 20px;
            text-align: center;
        }

        header p {
            font-size: 1.2rem;
            color: #777;
            text-align: center;
        }

        .home-page {
            margin-top: 40px;
        }

        .btn-lg {
            font-size: 1rem;
            padding: 15px;
            width: 100%;
            margin: 10px 0;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn {
            text-transform: uppercase;
            font-weight: bold;
        }

        .btn:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Button Colors */
        .btn-primary {
            background-color: #9b4dff;
            border-color: #9b4dff;
        }

        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-dark {
            background-color: #343a40;
            border-color: #343a40;
        }

        /* Box Shadow */
        .btn, .container {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        /* Clean Button Layout */
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .col-md-4 {
            max-width: 250px;
            flex: 1 1 auto;
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">
            <header>
                <h1>Welcome </h1>
                <p>Select a web form to access from the options below:</p>
            </header>

            <div class="row justify-content-center home-page">
                <!-- Button that links to Web Form 1 -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm1" runat="server" Text="Milestone Form" OnClick="btnForm1_Click" CssClass="btn btn-primary btn-lg" />
                </div>
                <!-- Button that links to Web Form 2 -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm2" runat="server" Text="Project Form" OnClick="btnForm2_Click" CssClass="btn btn-info btn-lg" />
                </div>
                <!-- Button that links to Web Form 3 -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm3" runat="server" Text="SubTask Form" OnClick="btnForm3_Click" CssClass="btn btn-warning btn-lg" />
                </div>
                <!-- Button that links to Web Form 4 -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm4" runat="server" Text="Task Form" OnClick="btnForm4_Click" CssClass="btn btn-success btn-lg" />
                </div>
                <!-- Button that links to Web Form 5 -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm5" runat="server" Text="Users Form" OnClick="btnForm5_Click" CssClass="btn btn-danger btn-lg" />
                </div>
                <!-- Button that links to Project Milestone Form -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm6" runat="server" Text="Project Milestone Form" OnClick="btnForm6_Click" CssClass="btn btn-dark btn-lg" />
                </div>
                <!-- Button that links to Top Performer Form -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm7" runat="server" Text="Top Performer Form" OnClick="btnForm7_Click" CssClass="btn btn-primary btn-lg" />
                </div>
                <!-- Button that links to Users Project Form -->
                <div class="col-md-4">
                    <asp:Button ID="btnForm8" runat="server" Text="Users Project Form" OnClick="btnForm8_Click" CssClass="btn btn-info btn-lg" />
                </div>
            </div>
        </div>
    </form>

    <!-- Add Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyKh58x2XXkHukF0YYoRo3t2YbQJ1Jjc7vxxp9uZ" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0U5sR7L4pV3moC1L4G5v6hJYwQhJmkn6BQYpF7g+Qx8lP4ql" crossorigin="anonymous"></script>
</body>
</html>
