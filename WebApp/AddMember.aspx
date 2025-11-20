<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="WebApp.AddMember" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Member</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #fff7ed; /* light orange background */
            font-family: 'Segoe UI', sans-serif;
        }

        .page-header h3 {
            font-weight: 700;
            color: #c2410c; /* dark orange text */
        }

        .btn-back {
            background-color: #fed7aa; /* soft orange */
            color: #c2410c;
            border: 1px solid #fb923c;
            border-radius: 8px;
            padding: 6px 16px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-back:hover {
            background-color: #fdba74;
        }

        .card-custom {
            background: #fff7ed; /* light orange card */
            border-radius: 16px;
            border: 1px solid #fdba74;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 30px;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid #fdba74;
        }

        .btn-primary {
            background-color: #f97316;
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background-color: #c2410c;
        }

        .text-success {
            color: #c2410c !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">

            <div class="d-flex justify-content-between align-items-center mb-3 page-header">
                <h3>Add New Member</h3>

                <asp:Button ID="btnBack" runat="server"
                    Text="← Back to Dashboard"
                    CssClass="btn btn-back"
                    OnClick="btnBack_Click" />
            </div>

            <div class="card card-custom">

                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control mb-3" placeholder="Full Name"></asp:TextBox>

                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-3" placeholder="Email"></asp:TextBox>

                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-3" placeholder="Phone"></asp:TextBox>

                <asp:Button ID="btnSave" runat="server" Text="Save Member" CssClass="btn btn-primary" OnClick="btnSave_Click" />

                <asp:Label ID="lblMsg" runat="server" CssClass="text-success mt-3 fw-bold"></asp:Label>

            </div>
        </div>
    </form>
</body>
</html>
