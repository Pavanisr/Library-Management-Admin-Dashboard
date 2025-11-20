<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuedBooks.aspx.cs" Inherits="WebApp.IssuedBooks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issued Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #fff7ed; /* light orange dashboard background */
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
            background-color: #fcd34d; /* amber-ish back button */
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

        .btn-success {
            background-color: #f97316; /* orange issue button */
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
        }

        .btn-success:hover {
            background-color: #ea580c;
        }

        .btn-warning {
            background-color: #f59e0b; /* yellow-orange return button */
            border: none;
            color: #1e1e1e;
            font-weight: 600;
        }

        .btn-warning:hover {
            background-color: #d97706;
        }

        .card-custom {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(8px);
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        }

        .table {
            background: #fff3e0; /* very light orange table background */
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .table th {
            background-color: #fb923c; /* table header orange */
            color: #fff;
        }

        .table td, .table th {
            vertical-align: middle;
            padding: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="page-header">
                <h3> Issued Books List</h3>
                <div>
                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-back" Text="← Back to Dashboard" OnClick="btnBack_Click" />
                    <asp:Button ID="btnAddIssued" runat="server" CssClass="btn btn-success ms-2" Text="Issue New Book" OnClick="btnAddIssued_Click" />
                </div>
            </div>

            <div class="card card-custom">
                <asp:GridView ID="gvIssued" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                    OnRowCommand="gvIssued_RowCommand" DataKeyNames="IssueID,BookID">
                    <Columns>
                        <asp:BoundField DataField="IssueID" HeaderText="Issue ID" ReadOnly="True" />
                        <asp:BoundField DataField="BookTitle" HeaderText="Book Name" ReadOnly="True" />
                        <asp:BoundField DataField="MemberName" HeaderText="Member Name" ReadOnly="True" />
                        <asp:BoundField DataField="Phone" HeaderText="Member Phone" ReadOnly="True" />
                        <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnReturn" runat="server" Text="✅ Return Book" CommandName="ReturnBook"
                                    CommandArgument='<%# Eval("IssueID") %>' 
                                    Enabled='<%# Eval("Status").ToString() != "Returned" %>' CssClass="btn btn-sm btn-warning" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
