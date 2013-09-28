$(document).ready(function() {
  $('#add_question').on('submit', function(event){
    event.preventDefault();
    var question = $('#question').find("input[name='question[]']").last()
    $(question).after('<br> <label for="question">Question</label> <input type="text" name="question[]">')
  })

});

