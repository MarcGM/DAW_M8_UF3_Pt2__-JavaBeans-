<html>
    <head>
        <style type="text/css">
        .mouseOut {
            background: #7A8AFF;
            color: #FFFAFA;
        }

        .mouseOver {
            background: #FFFAFA;
            color: #000000;
        }
        </style>
        <script type="text/javascript">
            var isIE;
            var req;
            var names;
            var target1;
            var target2;

            function getElementY(element) {
                var targetTop = 0;
                if (element.offsetParent) {
                    while (element.offsetParent) {
                        targetTop += element.offsetTop;
                        element = element.offsetParent;
                    }
                } else if (element.y) {
                    targetTop += element.y;
                }
                return targetTop;
            }

            function init() {
                target1 = document.getElementById("nomICognom");
                target2 = document.getElementById("telefon");
                var menu = document.getElementById("auto-row");
                var autorow = document.getElementById("menu-popup");
                autorow.style.top = getElementY(menu) + "px";

            }

            function initRequest(url) {
                if (window.XMLHttpRequest) {
                    req = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    isIE = true;
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }

            function doCompletion(accio){
                if(accio === "nomICognom"){
                    var url = "autocomplete?action="+accio+"&id=" + escape(target1.value);
                }else if(accio === "telefon"){
                    var url = "autocomplete?action="+accio+"&id=" + escape(target2.value);
                }
                initRequest(url);
                req.onreadystatechange = processRequest;
                req.open("GET", url, true);
                req.send(null);
            }

            function processRequest() {
                if (req.readyState == 4) {
                    if (req.status == 200) {
                        parseMessages();
                    } else if (req.status == 204) {
                        clearTable();
                    }
                }
            }

//            function parseMessages() {
//                if (!names)
//                    names = document.getElementById("names");
//                clearTable();
//                var employees = req.responseXML.getElementsByTagName("employees")[0];
//                for (loop = 0; loop < employees.childNodes.length; loop++) {
//                    var employee = employees.childNodes[loop];
//                    var firstName = employee.getElementsByTagName("firstName")[0];
//                    var lastName = employee.getElementsByTagName("lastName")[0];
//                    var employeeId = employee.getElementsByTagName("id")[0];
//                    appendEmployee(firstName.childNodes[0].nodeValue,
//                            lastName.childNodes[0].nodeValue,
//                            employeeId.childNodes[0].nodeValue);
//                }
//            }
            function parseMessages() {
                if (!names)
                    names = document.getElementById("names");
                clearTable();
                var usuaris = req.responseXML.getElementsByTagName("usuaris")[0];
                afegirCapcalera();
                for (loop = 0; loop < usuaris.childNodes.length; loop++) {
                    var usuari = usuaris.childNodes[loop];
                    var nomICognom = usuari.getElementsByTagName("nomICognom")[0];
                    var telefon = usuari.getElementsByTagName("telefon")[0];
                    var correuE = usuari.getElementsByTagName("correuE")[0];
                    appendUsuari(nomICognom.childNodes[0].nodeValue, telefon.childNodes[0].nodeValue, correuE.childNodes[0].nodeValue);
                }
            }

            function clearTable() {
                if (names) {
                    for (loop = names.childNodes.length - 1; loop >= 0; loop--) {
                        names.removeChild(names.childNodes[loop]);
                    }
                }
            }
            
            function afegirCapcalera() {
                    row = document.createElement("tr");
                    nameCell = document.createElement("td");
                    row.appendChild(nameCell);
                    names.appendChild(row);
            }
            
            function appendUsuari(nomICognom, telefon, correuE) {
                var nomICognomCell;
                var correuECell;
                var telefonCell;
                if (isIE) {
                    row = names.insertRow(names.rows.length);
                    nameCell = row.insertCell(0);
                } else {
                    row = document.createElement("tr");
                    nameCell = document.createElement("td");
                    row.appendChild(nameCell);
                    names.appendChild(row);
                }
                row.setAttribute("border", "0");
                nameCell.setAttribute("onmouseout", "this.className='mouseOver';");
                nameCell.setAttribute("onmouseover", "this.className='mouseOut';");
                nameCell.setAttribute("bgcolor", "#FFFAFA");
                nameCell.setAttribute("border", "0");
                var linkElement = document.createElement("a");
                linkElement.setAttribute("style", "text-decoration: none ");
                linkElement.setAttribute("href", "autocomplete?action=nomICognom&id="
                        + nomICognom);
                var nameFontElement = document.createElement("font");
                nameFontElement.setAttribute("size", "+1");
                nameFontElement.setAttribute("color", "black");
                nameFontElement.appendChild(document.createTextNode(nomICognom + " "
                        + telefon + " " + correuE));
                linkElement.appendChild(nameFontElement);
                nameCell.appendChild(linkElement);
            }
        </script>
    <title>Auto-Completion using Asynchronous JavaScript and XML
        (AJAX)</title>
</head>
    <body onload="init()">

        <h1>Buscador amb AJAX</h1>
        <hr />

        <form name="autofillform" action="autocomplete" method="get">
            <input type="hidden" name="action" value="lookupbyname" />
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td><b>Nom i cognom:</b></td>
                    <td>
                        <input type="text" size="20" id="nomICognom" name="nomICognom" onkeyup="doCompletion('nomICognom');">
                    </td>
                    <td align="left">
                    </td>
                </tr>
                <tr>
                    <td><b>Número de teléfon:</b></td>
                    <td>
                        <input type="text" size="20" id="telefon" name="telefon" onkeyup="doCompletion('telefon');">
                    </td>
                    <td align="left">
                    </td>
                </tr>
                <tr>
                    <td id="auto-row" colspan="2">&nbsp;<td />
                </tr>
            </table>
        </form>
        <div style="position: absolute; top: 170px; left: 140px" id="menu-popup">
            <table id="names" bgcolor="#FFFAFA" border="1" bordercolor="black" cellspacing="0" cellpadding="0">
                <tr>
                    <td>Nom i cognom</td>
                    <td>Número de teléfon</td>
                    <td>Correu electrònic</td>
                </tr>
            </table>
        </div>
    </body>
</html>
