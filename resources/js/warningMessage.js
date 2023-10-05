// window.addEventListener('beforeunload', function(e) {
//     if (document.getElementById('checkbox').checked) {
//       // Display a warning message to the user
//         e.returnValue = 'Are you sure you want to leave the page with the checkbox checked?';
//     }
// });


// window.onload = function() {
//     // Get the checkboxes
//     const checkboxes = document.querySelectorAll('input[type="checkbox"]');
//     // Get the button
//     const deleteUserbutton = document.getElementById('submitDeleteUserRecords');
//     const createUserbutton = document.getElementById('saveCreateUser');
//     const EditRecordbutton = document.getElementById('saveButton');
//     const createRecordbutton = document.getElementById('saveEditUser');
//     function beforeUnloadHandler(event) {
//         // Check if any checkboxes are clicked
//         for (let checkbox of checkboxes) {
//             if (checkbox.checked) {
//                 console.log("checked");
//                 event.preventDefault();
//                 event.returnValue = 'Are you sure you want to leave this page?';
//             }
//         }
//     }
  
//     // Attach the event listener to the window object
//     window.addEventListener('beforeunload', beforeUnloadHandler);
  
//     // Attach click event to the button
//     deleteUserbutton.addEventListener('click', function() {
//         // Remove the beforeunload event listener
//         window.removeEventListener('beforeunload', beforeUnloadHandler);
//         location.reload();
//     });
//     createUserbutton.addEventListener('click', function() {
//         // Remove the beforeunload event listener
//         window.removeEventListener('beforeunload', beforeUnloadHandler);
//         location.reload();
//     });
//     EditRecordbutton.addEventListener('click', function() {
//         // Remove the beforeunload event listener
//         window.removeEventListener('beforeunload', beforeUnloadHandler);
//         location.reload();
//     });
//     createRecordbutton.addEventListener('click', function() {
//         // Remove the beforeunload event listener
//         window.removeEventListener('beforeunload', beforeUnloadHandler);
//         location.reload();
//     });
// }
