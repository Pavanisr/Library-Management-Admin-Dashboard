<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddIssuedBook.aspx.cs" Inherits="WebApp.AddIssuedBook" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #fff7ed; /* Orange-themed dashboard background */
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .container {
            padding-top: 60px;
            padding-bottom: 60px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .page-header h3 {
            font-weight: 700;
            color: #b45309; /* dark orange heading */
        }

        .btn-back {
            background-color: #fcd34d; /* amber back button */
            color: #78350f;
            font-weight: bold;
            border-radius: 8px;
            padding: 6px 16px;
            border: 1px solid #fbbf24;
            transition: 0.3s;
        }

        .btn-back:hover {
            background-color: #fbbf24;
        }

        .btn-primary {
            background-color: #f97316; /* orange primary button */
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            width: 100%;
            padding: 12px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #ea580c;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid rgba(0,0,0,0.1);
            padding: 10px;
        }

        .card-custom {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(8px);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            max-width: 500px;
            margin: 0 auto;
        }

        .text-success {
            font-size: 15px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <div class="page-header">
                <h3> Issue Book to Member</h3>
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-back" Text="← Back to Dashboard" OnClick="btnBack_Click" />
            </div>

            <div class="card card-custom">
                <asp:DropDownList ID="ddlBook" runat="server" CssClass="form-control mb-3"></asp:DropDownList>
                <asp:DropDownList ID="ddlMember" runat="server" CssClass="form-control mb-3"></asp:DropDownList>
                <asp:TextBox ID="txtReturnDate" runat="server" CssClass="form-control mb-3" placeholder="Return Date (optional, YYYY-MM-DD)"></asp:TextBox>

                <asp:Button ID="btnIssue" runat="server" Text="Issue Book" CssClass="btn btn-primary" OnClick="btnIssue_Click" />

                <asp:Label ID="lblMsg" runat="server" CssClass="text-success mt-3 fw-bold"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
