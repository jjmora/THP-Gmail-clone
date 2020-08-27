el = document.getElementById("task-<%= @task.id %>").getElementsByTagName('input')[0]
if(el.checked = true){
  document.getElementById("task-<%= @task.id %>").classList.toggle("checked")
  el.checked = true
}

