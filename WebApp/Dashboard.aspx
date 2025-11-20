<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApp.Dashboard" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-dark mb-4">Dashboard Home</h3>

    <!-- First Row: Dashboard Cards -->
    <div class="row g-4 d-flex align-items-stretch">
        <div class="col-md-3">
            <div class="card-dashboard text-center bg-orange h-100">
                <i class="bi bi-book fs-1"></i>
                <h5 class="mt-2">Total Books</h5>
                <asp:Label ID="lblBooks" runat="server" CssClass="fs-3 fw-bold"></asp:Label>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-dashboard text-center bg-orange h-100">
                <i class="bi bi-people fs-1"></i>
                <h5 class="mt-2">Total Members</h5>
                <asp:Label ID="lblMembers" runat="server" CssClass="fs-3 fw-bold"></asp:Label>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-dashboard text-center bg-orange h-100">
                <i class="bi bi-journal-check fs-1"></i>
                <h5 class="mt-2">Issued Books</h5>
                <asp:Label ID="lblIssued" runat="server" CssClass="fs-3 fw-bold"></asp:Label>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card-dashboard text-center bg-orange h-100">
                <i class="bi bi-tags fs-1"></i>
                <h5 class="mt-2">Category-wise Books</h5>
                <asp:BulletedList ID="blCategoryBooks" runat="server" CssClass="blCategoryBooks mt-2"></asp:BulletedList>
            </div>
        </div>
    </div>

    <hr class="my-4" />

    <!-- Second Row: Charts -->
    <div class="row g-4">
        <div class="col-md-6">
            <div class="card p-3 shadow-sm h-100">
                <h5>Books per Category (Bar Chart)</h5>
                <canvas id="booksCategoryChart"></canvas>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card p-3 shadow-sm h-100">
                <h5>Issued Books per Category (Pie Chart)</h5>
                <canvas id="issuedCategoryChart"></canvas>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-3">
        <div class="col-md-6">
            <div class="card p-3 shadow-sm h-100">
                <h5>Monthly Books Added (Line Chart)</h5>
                <canvas id="monthlyBooksChart"></canvas>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card p-3 shadow-sm h-100">
                <h5>Monthly Members Joined (Line Chart)</h5>
                <canvas id="monthlyMembersChart"></canvas>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const categoryLabels = [<%= GetCategoryLabels() %>];
        const booksPerCategory = [<%= GetBooksPerCategory() %>];
        const issuedPerCategory = [<%= GetIssuedPerCategory() %>];
        const monthlyBooks = [<%= GetMonthlyBooks() %>];
        const monthlyMembers = [<%= GetMonthlyMembers() %>];

        new Chart(document.getElementById('booksCategoryChart').getContext('2d'), {
            type: 'bar',
            data: { labels: categoryLabels, datasets: [{ label: 'Books', data: booksPerCategory, backgroundColor: '#f97316' }] },
            options: { responsive: true }
        });

        new Chart(document.getElementById('issuedCategoryChart').getContext('2d'), {
            type: 'pie',
            data: { labels: categoryLabels, datasets: [{ label: 'Issued Books', data: issuedPerCategory, backgroundColor: ['#f97316', '#fb923c', '#fbbf24', '#facc15', '#fcd34d', '#fde68a'] }] },
            options: { responsive: true }
        });

        new Chart(document.getElementById('monthlyBooksChart').getContext('2d'), {
            type: 'line',
            data: { labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], datasets: [{ label: 'Books Added', data: monthlyBooks, borderColor: '#f97316', backgroundColor: 'rgba(249,115,22,0.2)', fill: true, tension: 0.4 }] },
            options: { responsive: true }
        });

        new Chart(document.getElementById('monthlyMembersChart').getContext('2d'), {
            type: 'line',
            data: { labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], datasets: [{ label: 'Members Joined', data: monthlyMembers, borderColor: '#fb923c', backgroundColor: 'rgba(251,146,60,0.2)', fill: true, tension: 0.4 }] },
            options: { responsive: true }
        });
    </script>

    <style>
        .bg-orange { background-color: #ffedd5 !important; color: #c2410c; }
        .card-dashboard { padding: 20px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); display: flex; flex-direction: column; justify-content: center; }
        h5 { font-weight: 600; }

        /* Category list in 3 columns */
        .blCategoryBooks {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 5px 15px;
            padding-left: 0;
            list-style: none;
            text-align: left;
        }

        .blCategoryBooks li { font-size: 0.95rem; padding: 3px 0; }

        @media (max-width: 768px) { .blCategoryBooks { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 576px) { .blCategoryBooks { grid-template-columns: 1fr; } }
    </style>
</asp:Content>
