var productsTable = document.getElementById("products").getElementsByTagName('tbody')[0];
document.getElementById("add").addEventListener("click", addRow);

// Adding row to the table
var counter = 1;	

function addRow(){
    var tableLength  = productsTable.rows.length;
    var nameInput = document.getElementById("nameInput").value;
    var stockInput = document.getElementById("stockInput").value;
    if (!isNaN(stockInput)) {
        //create the new row
        var row = productsTable.insertRow();
        var cell1 = row.insertCell(0); //row number cell
        var cell2 = row.insertCell(1); // name cell
        var cell3 = row.insertCell(2); // stock cell 
        var cell4 = row.insertCell(3); //pending cell
        var cell5 = row.insertCell(4); //actions cell
        //getting the row number
        cell1.innerHTML = tableLength + 1;
        cell1.classList.toggle("font-weight-bold");
        //getting input in the new table row
        cell2.innerHTML = nameInput;
        //getting input in the new table row
        cell3.innerHTML = stockInput;
        //reset the form input elements
        document.getElementById("productInfo").reset();
        //putting zero in the pending column
        cell4.innerHTML = "0";
        //creating remove button
        var buttonR = document.createElement("button");
        buttonR.innerHTML = "remove";
        buttonR.classList.toggle("btn");
        buttonR.className += " btn-outline-danger";
        //(event listener)
        buttonR.setAttribute("onclick", "removeRow(this);");
        //creating the info button
        const buttonI = document.createElement("button");
        buttonI.innerHTML = "info";
        buttonI.classList.toggle("btn");
        buttonI.className += " btn-outline-info";
        buttonI.style.marginLeft = "5px";
        //show buttons on screen
        cell5.appendChild(buttonR);
        cell5.appendChild(buttonI);
        //make the row red when hovering on the remove button
        buttonR.addEventListener("mouseover", function () {
            row.classList.toggle("table-danger");
        });

        buttonR.addEventListener("mouseout", function () {
            row.classList.remove("table-danger");
        });
        counter++;
    } else {
        alert("Wrong Input");
    }
}

//removing rows from the table
function removeRow(button){
    const row = button.parentNode.parentNode;
    //gets the name of the product
    const name = row.getElementsByTagName("TD")[1].innerHTML;
    if (confirm("Do you want to delete: " + name)) {
        //Delete the Table row using it's Index.
        productsTable.deleteRow(row.rowIndex - 1);
    }
}
