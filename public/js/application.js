$(document).ready(function() {

  var shortAnswerTemplate = $('.question-short-template');

  var multipleChoiceTemplate = $('.question-multiple-template');

  var questionSandbox = $('#question-sandbox');

  var addmultiplechoiceAnswerOption = $('.multiple-choice-question-template');

  var submitQuestions = function(event) {
    event.preventDefault();
  };

  var addMultipleChoiceQuestion = function() {
    questionSandbox.append(multipleChoiceTemplate.clone());
  }; //we're using clone here to try to append the same element over again
  //http://stackoverflow.com/questions/4114655/jquery-append-only-working-first-time

  var addShortAnswerQuestion = function() { 
    questionSandbox.append(shortAnswerTemplate.clone());
  }; //we're using clone here to try to append the same element over again
  //http://stackoverflow.com/questions/4114655/jquery-append-only-working-first-time

  var addMultipleChoiceOption = function(event) {
    // find enclosing container.
    var enclosingContainer = $(event.toElement).closest('.question-multiple-template');
    var multiChoiceSandbox = enclosingContainer.children('.multiple-choice-answer-sandbox');
      multiChoiceSandbox.append(addmultiplechoiceAnswerOption.clone());
    // get the single multiple choice answer template.




  };


  var bindButtons = function()
  {
    $('#question').submit(submitQuestions);

    //bind to add short question button
    var shortAnswerButton = $('#btn_short_question');
    shortAnswerButton.on("click", addShortAnswerQuestion);

    var multipleChoiceButton = $('#btn_mult_question');
    multipleChoiceButton.on("click", addMultipleChoiceQuestion);

    questionSandbox.on("click", ".addchoice", addMultipleChoiceOption);


  }

  bindButtons(); //calling bindButtons

});

    // var question = $('#question').find("input[name='question[]']").last()
    // $(question).after('<br> <label for="question">Question</label> <input type="text" name="question[]">')
