
<!DOCTYPE html>
<html>
    <head>
        <title>IIST management system</title>
        <link rel="icon" href="download.png" >
        <link href="maxresdefault.jpg" rel="stylesheet">
        <link rel="stylesheet" href="style.css" type="text/css"/>

    </head>

    <body>
        <div class="backgroundImage">
            <div class="header">
                <h1>INDORE INSTITUTE OF SCIENCE AND TECHNOLOGY</h1>
            </div>
            <div class="navbar">
                <a class="active" href="login1.jsp">Bus</a>
                <a href="Selflogin.jsp">Self</a>
                <a href="adminlogin.html">Admin</a>
            </div>
            <div class="marquee">
                <p style="font-size: 20px">From the academic year 2022-23, the bus facility will be on annual basis and the bus card will be valid till the academic year 2022-23. From Students admitted in the year 2019 can get new bus card students section of bus by depositing semester fees. Use of bus without bus card is not allowed. It is mandatory for the students availing bus facility to have bus card during the journey. without bus card Rs.200/- fine will be imposed for traveling. Students who have not availed the bus facility are advised not to use the bus, otherwise a fine of 500 Rs. If found using the bus for the third time, the bus fee for the entire year will have to be paid.</p>
            </div>
            <br>
            <div class="center">
                <form action="TestServlet" method="post">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h2 style="color: blue">STUDENT LOGIN</h2>
                            </td>
                        </tr>
                        <tr>
                            <td><label class="enrollement" for="studentid">Enter enrollment here:</label></td>
                            <td><input type ="text" name="studentid" maxlength="13" placeholder="Enter the student id here"></td>
                        </tr>
                        <tr>
                            <td  colspan="2" align="left">
                                <input class="sumbit" type="submit" name="SelfLogin"  value="Self Login">
                            </td >
                        </tr>
                    </table>
                </form>

                <%  String message = (String) request.getAttribute("message");
                    if (message != null) {
                %>
                <p style="
                   background-color: #87F5FB;
                   text-align: center;
                   text-decoration: blink;
                   color: #E75A7C;
                   font-size: 25px;
                   font-weight: bold"><%= message%></p>
                <%
                    }
                %>                   
            </div>
        </div>
    </body>
    <style>
     .navbar {
        background-color: #333;
        overflow: hidden;
      }

      .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
      }

      .navbar a:hover {
        background-color: #ddd;
        color: black;
      }

      .navbar a.active {
        background-color: #4CAF50;
        color: white;
      }
      
      /* Login form styles */
      body {
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
      }
      
      .login-container {
        width: 400px;
        margin: auto;
        background-color: #ffffff;
        border-radius: 5px;
        box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.2);
        padding: 20px;
        text-align: center;
      }
      
      h1 {
        font-size: 36px;
        margin-bottom: 20px;
      }
      
      .login-options {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
      }
      
      .login-option {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
      }
      
      .login-option:hover {
        background-color: #3e8e41;
      }
        .marquee {
            background-color: whitesmoke;
            color: red;
            overflow: hidden;
            white-space: nowrap;
            margin: 0;
            padding: 0;
        }

        .marquee p {
            display: inline-block;
            padding-left: 100%;
            animation: marquee 60s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(-100%, 0);
            }
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .backgroundImage {
            background-image: url('maxresdefault.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .header {
            background-color: indigo;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        h1 {
            padding: 0;
            font-size: 25px;
            color: khaki;
            margin: 0;
        }

        .center {
            margin-top: 150px;
            margin-left: auto;
            margin-right: auto;
            max-width: 500px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            font-size: 25px;
            font-weight: bold;
            padding: 10px 20px;
            background-color: indigo;
            color: whitesmoke;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }


    </style>
</html>