<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Details</title>
                <link rel="icon" href="download.png" >

        <style>
            button {
                display: block;
                margin: auto;
                overflow: auto;
                background-color: indigo;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            h1{
                padding: 0;
                margin:0;
                background-color: indigo ;
                color: white;
                text-align: center;
            }
            body{
                background-image: url('f1.png');
                background-size: cover;
                background-repeat: no-repeat;
                height: 100vh;

            }
            table {
                height: 1000px;
                width: 300px;
                margin-top: 40px;
                margin-left: auto;
                margin-right: auto;
                max-width: 700px;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.8);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                border-bottom-color: black;
            }

            th, td {
                text-align: left;
                padding: 25px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color:indigo;
                color: white;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

        </style>
    </head>
    <body>
        <h1>Student Details</h1>
        <br>
        <div style="max-height: 700px; overflow: auto;">
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Bus Fees</th>
                        <th>Bus Fine</th>
                            <%
                                // Create a date formatter with the dd/mm/yyyy format
                                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

                                // Get the current date
                                Date currentDate = new Date();

                                // Get the column names for the past 7 days
                                for (int i = 0; i < 7; i++) {
                                    // Calculate the date for this column
                                    Date columnDate = new Date(currentDate.getTime() - i * 24 * 60 * 60 * 1000);
                                    String columnName = dateFormat.format(columnDate);

                                    // Print the column name
                                    out.println("<th>" + columnName + "</th>");
                                }
                            %>

                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // Load the JDBC driver
                            Class.forName("com.mysql.jdbc.Driver");

                            // Establish a connection
                            String url = "jdbc:mysql://localhost:3306/db25";
                            String user = "root";
                            String password = "root";
                            Connection conn = DriverManager.getConnection(url, user, password);

                            // Create a statement
                            Statement stmt = conn.createStatement();

                            // Execute the query
                            String query = "SELECT * FROM student";
                            ResultSet rs = stmt.executeQuery(query);

                            // Iterate over the result set and print the data
                            while (rs.next()) {
                                String stdId = rs.getString("stdid");
                                String stdName = rs.getString("stdname");
                                Boolean busFees = rs.getBoolean("bus_fees");
                                String bus_fine = rs.getString("bus_fine");
                                // Get the past 7 days of time values
                                out.println("<td>" + stdId + "</td>");
                                out.println("<td>" + stdName + "</td>");
                                if (busFees == true) {
                                    out.println("<td>" + "paid" + "</td>");
                                } else {
                                    out.println("<td>" + "not paid" + "</td>");

                                }
                                out.println("<td>" + bus_fine + "</td>");
                                SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy_MM_dd");
                                for (int i = 0; i < 7; i++) {
                                    // Calculate the date for this column
                                    Date columnDate = new Date(currentDate.getTime() - i * 24 * 60 * 60 * 1000);
                                    String columnName = dateFormat2.format(columnDate);
                                    Time time = rs.getTime(columnName);

                                    out.println("<td>" + time + "</td>");
                                }

                                out.println("</tr>");
                            }

                            // Clean up
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }
                    %>
                </tbody>

            </table>
        </dv>      
</body>
<br>
<button onclick="exportTableToCSV('student-details.csv')">Download whole data</button>
<br>
<button onclick="exportTableToCSV('student-details.csv')">Download last 7days</button>


<!-- add this button below the table -->
<script>
    function exportTableToCSV(filename) {
        var csv = [];
        var rows = document.querySelectorAll('table tr');
        for (var i = 0; i < rows.length; i++) {
            var row = [], cols = rows[i].querySelectorAll('td, th');
            for (var j = 0; j < cols.length; j++) {
                row.push(cols[j].innerText);
            }
            csv.push(row.join(','));
        }
        var blob = new Blob([csv.join('\n')], {type: 'text/csv;charset=utf-8;'});
        if (navigator.msSaveBlob) { // IE 10+
            navigator.msSaveBlob(blob, filename);
        } else {
            var link = document.createElement('a');
            if (link.download !== undefined) { // feature detection
                // Browsers that support HTML5 download attribute
                var url = URL.createObjectURL(blob);
                link.setAttribute('href', url);
                link.setAttribute('download', filename);
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            } else {
                // fallback solution for unsupported browsers
                alert('Your browser does not support downloading files.');
            }
        }
    }

    // function to export table as CSV file
    function exportTableToCSV(filename) {
        var csv = [];
        var rows = document.querySelectorAll('table tr');
        for (var i = 0; i < rows.length; i++) {
            var row = [], cols = rows[i].querySelectorAll('td, th');
            for (var j = 0; j < cols.length; j++) {
                row.push(cols[j].innerText);
            }
            csv.push(row.join(','));
        }
        // download the CSV file
        downloadCSV(csv.join('\n'), filename);
    }

    // function to download CSV file
    function downloadCSV(csv, filename) {
        var csvFile;
        var downloadLink;

        // create the CSV file
        csvFile = new Blob([csv], {type: "text/csv"});

        // create download link
        downloadLink = document.createElement("a");
        downloadLink.download = filename;
        downloadLink.href = window.URL.createObjectURL(csvFile);
        downloadLink.style.display = "none";

        // add the download link to the document body
        document.body.appendChild(downloadLink);

        // click the download link
        downloadLink.click();
    }
</script>

</html>