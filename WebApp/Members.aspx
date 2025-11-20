<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="WebApp.Members" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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
        }

        .btn-back:hover {
            background-color: #d35400;
        }

        .btn-add {
            background-color: #d35400;
            color: white;
            font-weight: bold;
        }

        .btn-add:hover {
            background-color: #e67e22;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
            font-size: 0.85rem;
            padding: 2px 8px;
            border-radius: 4px;
            margin-right: 5px;
        }

        .btn-edit:hover {
            background-color: #2980b9;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            font-size: 0.85rem;
            padding: 2px 8px;
            border-radius: 4px;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .card-table {
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 20px;
            background-color: #fff9f2;
        }

        .table th {
            background-color: #d35400;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #fce5d0;
        }
    </style>

    <div class="page-header">
        <h3> Members Management</h3>
        <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard" CssClass="btn btn-back" OnClick="btnBack_Click" />
    </div>

    <div class="card-table">
        <asp:Button ID="btnAddMember" runat="server" CssClass="btn btn-add mb-3" Text=" Add Member" OnClick="btnAddMember_Click" />

        <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID"
            OnRowEditing="gvMembers_RowEditing"
            OnRowUpdating="gvMembers_RowUpdating"
            OnRowCancelingEdit="gvMembers_RowCancelingEdit"
            OnRowDeleting="gvMembers_RowDeleting"
            CssClass="table table-striped table-bordered table-hover">
            
            <Columns>
                <asp:BoundField DataField="MemberID" HeaderText="ID" ReadOnly="True" />

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("FullName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("FullName") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("Email") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate>
                        <%# Eval("Phone") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="BooksBorrowed" HeaderText="Books Borrowed" ReadOnly="True" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn btn-edit btn-sm">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="btn btn-delete btn-sm" OnClientClick="return confirm('Are you sure you want to delete this member?');">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CssClass="btn btn-edit btn-sm">Update</asp:LinkButton>
                        <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CssClass="btn btn-delete btn-sm">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
