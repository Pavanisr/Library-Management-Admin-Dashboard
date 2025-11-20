<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="WebApp.AddCategory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #fff9f2;
            font-family: 'Segoe UI', sans-serif;
            position: relative;
            min-height: 100vh;
            overflow-x: hidden;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .page-header h3 {
            color: #d35400; 
            font-weight: bold;
        }

        .btn-back {
            background-color: #e67e22;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            padding: 6px 16px;
            transition: 0.3s;
        }

        .btn-back:hover {
            background-color: #d35400;
        }

        .card-custom {
            background-color: #fff9f2;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 25px;
            position: relative;
            z-index: 2;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid #e0cfc1;
            padding: 10px;
        }

        .form-control:focus {
            border-color: #d35400;
            box-shadow: 0 0 5px rgba(211, 84, 0, 0.3);
        }

        .btn-primary {
            background-color: #d35400;
            border-radius: 10px;
            font-weight: 600;
            border: none;
            padding: 12px 20px;
        }

        .btn-primary:hover {
            background-color: #e67e22;
        }

        .text-success {
            font-size: 15px;
            color: #27ae60 !important;
            font-weight: 600;
        }

        
        .wave-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            overflow: hidden;
            line-height: 0;
            z-index: 1;
        }

        .wave {
            position: absolute;
            bottom: 0;
            width: 200%;
            height: 150px;
            background-repeat: repeat no-repeat;
            background-size: 50% 100px;
            border-radius: 100%;
            animation: waveMove 10s linear infinite;
            opacity: 0.4;
        }

        .wave1 {
            background: linear-gradient(135deg, #d35400, #e67e22);
            animation-delay: 0s;
            z-index: 1;
        }

        .wave2 {
            background: linear-gradient(135deg, #e67e22, #f39c12);
            animation-delay: -3s;
            opacity: 0.5;
            z-index: 2;
        }

        .wave3 {
            background: linear-gradient(135deg, #f39c12, #f5b041);
            animation-delay: -6s;
            opacity: 0.6;
            z-index: 3;
        }

        @keyframes waveMove {
            0% { transform: translateX(0) translateY(0); }
            50% { transform: translateX(-25%) translateY(10px); }
            100% { transform: translateX(-50%) translateY(0); }
        }

        .container {
            position: relative;
            z-index: 2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="page-header">
                <h3> Add New Category</h3>
                <asp:Button ID="btnBack" runat="server"
                    Text="← Back to Dashboard"
                    CssClass="btn btn-back"
                    OnClick="btnBack_Click" />
            </div>

            <div class="card card-custom">
                <asp:TextBox ID="txtCategoryName" runat="server"
                    CssClass="form-control mb-3"
                    placeholder="Category Name"></asp:TextBox>

                <asp:Button ID="btnSave" runat="server"
                    Text="Save Category"
                    CssClass="btn btn-primary mt-3 w-100"
                    OnClick="btnSave_Click" />

                <asp:Label ID="lblMsg" runat="server"
                    CssClass="text-success mt-3 fw-bold"></asp:Label>
            </div>
        </div>

        <div class="wave-container">
            <div class="wave wave1"></div>
            <div class="wave wave2"></div>
            <div class="wave wave3"></div>
        </div>
    </form>
</body>
</html>
