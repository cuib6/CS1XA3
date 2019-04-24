 (function() {
  function buildQuiz() {
    const output = [];
    quizList.forEach((currentQuestion, number) => {
      const answers = [];
      for (letter in currentQuestion.answers) {
        answers.push(
          `<label>
            <input type="radio" name="question${number}" value="${letter}">
            ${letter} :
            ${currentQuestion.answers[letter]}
          </label>`
        );
      }
      output.push(
        `<div class="question"> ${currentQuestion.question} </div>
        <div class="answers"> ${answers.join("")} </div>`
      );
    });
    quizContainer.innerHTML = output.join("");
  }

  function showResults() {
    const answerContainers = quizContainer.querySelectorAll(".answers");
    let numCorrect = 0;
    quizList.forEach((currentQuestion, number) => {
      const answerContainer = answerContainers[number];
      const selector = `input[name=question${number}]:checked`;
      const userAnswer = (answerContainer.querySelector(selector) || {}).value;
      if (userAnswer === currentQuestion.correctAnswer) {
        numCorrect++;
        answerContainers[number].style.color = "green";
      } else {
        answerContainers[number].style.color = "red";
      }
    });
			
		
    resultsContainer.innerHTML = `${numCorrect} out of ${quizList.length}`;
  }
  
	  

  const quizContainer = document.getElementById("quiz");
  const resultsContainer = document.getElementById("results");
  const submitButton = document.getElementById("submit");
  const quizList = [
    {
      question: "1. What's our CS1XA3 instructor?",
      answers: {
        A: "Curtis",
        B: "tmm",
        C: "NOTAPROFCURTIS"
      },
      correctAnswer: "C"
    },
	{
      question: "2. Solve x for (x-1)(x-3)x=0?",
      answers: {
        A: "0",
        B: "1",
        C: "3",
		D: "0,1,3"
      },
      correctAnswer: "D"
    },
    {
      question: "3. When was Hamilton Hall @ McMaster University built?",
      answers: {
        A: "1933",
        B: "1934",
        C: "1926",
		D: "1920"
      },
      correctAnswer: "C"
    },
    {
      question: "4. Who's the best FPS player?",
      answers: {
        A: "John Wick",
        B: "Shr0nd",
        C: "Obama",
        D: "ITS SHRONDDDD!!!!"
      },
      correctAnswer: "D"
    }
  ];

  buildQuiz();

  submitButton.addEventListener("click", showResults);
})();