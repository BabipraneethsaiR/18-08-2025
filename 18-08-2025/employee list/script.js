document.querySelector('.EmployeeForm form').addEventListener('submit', function (event) {
    event.preventDefault(); 
    const name = document.getElementById('empName').value;
    const age = document.getElementById('empAge').value;
    const position = document.getElementById('empPosition').value;
    const tr = document.createElement('tr');
    tr.innerHTML =
        `<td>${name}</td>
        <td>${age}</td>
        <td>${position}</td>`;
    document.getElementById('employeeTable').appendChild(tr);
    document.querySelector('.EmployeeForm form').reset();
});