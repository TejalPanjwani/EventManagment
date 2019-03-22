var currentTab = 0; // Current tab is set to be the first tab (0)

$(document).ready(function () {
  showTab(currentTab);
});

function showTab(n) 
{
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  console.log("in demo js x: ", document.getElementsByClassName(".tab"), x[n]);
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) 
  {
    //var service_id = document.getElementById("serviceId").value
    //console.log("service id is: ",service_id);
    document.getElementById("prevBtn").style.display = "none";
  } 
  else 
  {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) 
  {
    //var service_id = document.getElementById("service_id").value; 
    
    document.getElementById("nextBtn").innerHTML = "Submit";
  } 
  else 
  {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) 
{
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) 
  {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function myFunctionGuest(guestdata) 
{
  console.log(guestdata)
  document.getElementById("result").value = guestdata;
}

function myFunctionDays(daysdata) 
{
  console.log(daysdata)
  document.getElementById("result").value = daysdata;
}

function myFunctionBuget(bugetdata) 
{
  console.log(bugetdata)
  document.getElementById("result").value = bugetdata;
}

function myFunctionCall(calldata) 
{
  console.log(calldata)
  document.getElementById("result").value = calldata;
}

function myFunctionRequir(requirData) 
{
  console.log(requirData)
  document.getElementById("result").value = requirData;
}

function validateForm() 
{
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  console.log("x and x.length is : ",x,x.length);
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  console.log("hey")
  console.log("hey")
  console.log("y", y[0].checked)
  console.log("y value", y.value)
  for (i = 0; i < y.length; i++) 
  {
    // If a field is empty...
    if (y[i].checked) 
    {
      valid = true;
      break;
    }
    else 
    {
      // add an "invalid" class to the field:
      y.className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }

  // If the valid status is true, mark the step as finished and valid:
  if (valid) 
  {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) 
{
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) 
  {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}