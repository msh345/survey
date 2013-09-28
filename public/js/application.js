$(document).ready(function() {

  $('#add_question').on('submit', function(event){
    event.preventDefault();
    var question = $('#question').find("input[name='question[]']").last()
    $(question).after('<br> <label for="question">Question</label> <input type="text" name="question[]">')
})
  var addMultipleChoiceQuestion = function() {
    console.log("MCQuestion");
  };

  var addShortAnswerQuestion = function() {
    console.log("SAQuestion");  
  };
  //bind to add short question button
  var shortAnswerButton = $('#btn_short_question');
  shortAnswerButton.on("click", addShortAnswerQuestion);

  var multipleChoiceButton = $('#btn_mult_question');
  multipleChoiceButton.on("click", addMultipleChoiceQuestion);

});

