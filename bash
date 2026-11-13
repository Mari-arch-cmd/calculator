mkdir calculator && cd calculator
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Интерактивный калькулятор</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="calculator">
        <h1>Калькулятор</h1>

        <div class="inputs">
            <input type="text" id="num1" placeholder="Первое число">
            <input type="text" id="num2" placeholder="Второе число">
        </div>

        <div class="buttons">
            <button data-operation="sum" class="btn">Сумма</button>
            <button data-operation="sub" class="btn">Разность</button>
            <button data-operation="mul" class="btn">Произведение</button>
            <button data-operation="div" class="btn">Деление</button>
        </div>

        <div class="result-box">
            <span class="result-label">Результат:</span>
            <span id="result"></span>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Roboto, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.calculator {
    background: #ffffff;
    padding: 40px;
    border-radius: 16px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.35);
    width: 100%;
    max-width: 420px;
    text-align: center;
}

h1 {
    color: #1e3c72;
    margin-bottom: 24px;
}

.inputs {
    display: flex;
    gap: 12px;
    margin-bottom: 24px;
}

input {
    width: 100%;
    padding: 12px;
    border: 2px solid #e0e6ef;
    border-radius: 8px;
    font-size: 16px;
    transition: border-color 0.2s;
}

input:focus {
    outline: none;
    border-color: #2a5298;
}

.buttons {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
    margin-bottom: 24px;
}

.btn {
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 14px 0;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.15s, box-shadow 0.15s;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(30, 60, 114, 0.35);
}

.btn:active {
    transform: translateY(0);
}

.result-box {
    background: #f2f6fc;
    border: 2px solid #d8e3f3;
    border-radius: 10px;
    padding: 16px;
    font-size: 22px;
    min-height: 64px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.result-label {
    color: #5a6b85;
    font-size: 16px;
}

#result {
    font-weight: 700;
    color: #1e3c72;
    word-break: break-all;
}

#result.error {
    color: #d93025;
    font-size: 17px;
    font-weight: 500;
}
3. script.js
javascript
// --- Четыре функции математических операций ---

function sum(a, b) {
    return a + b;
}

function sub(a, b) {
    return a - b;
}

function mul(a, b) {
    return a * b;
}

function div(a, b) {
    return a / b;
}

// --- Обработчики событий ---

const num1Input = document.getElementById('num1');
const num2Input = document.getElementById('num2');
const resultBox = document.getElementById('result');

function calculate(operation) {
    // Очистка от предыдущей ошибки
    resultBox.classList.remove('error');

    const first = num1Input.value.trim();
    const second = num2Input.value.trim();

    // Проверка: введены ли числа
    // Пустая строка или нечисловое значение -> ошибка
    if (first === '' || second === '' ||
        isNaN(Number(first)) || isNaN(Number(second))) {
        resultBox.textContent = 'Ошибка: введите корректные числа';
        resultBox.classList.add('error');
        return;
    }

    // Отдельная проверка деления на ноль
    if (operation === 'div' && Number(second) === 0) {
        resultBox.textContent = 'Ошибка: деление на ноль невозможно';
        resultBox.classList.add('error');
        return;
    }

    const a = Number(first);
    const b = Number(second);

    const operations = { sum, sub, mul, div };
    const result = operations[operation](a, b);

    // Округление до 10 знаков, чтобы убрать хвосты вида 0.30000000000000004
    resultBox.textContent = Math.round(result * 1e10) / 1e10;
}

// Каждая кнопка получает свой обработчик по data-operation
document.querySelectorAll('.btn').forEach(button => {
    button.addEventListener('click', () => calculate(button.dataset.operation));
});

// Бонус: вычисление по клавише Enter
[num1Input, num2Input].forEach(input => {
    input.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') calculate(document.querySelector('.btn').dataset.operation);
    });
});
# Интерактивный калькулятор

Простое веб-приложение на HTML, CSS и JavaScript.

## Возможности
- Два поля ввода для произвольных чисел
- Кнопки: «Сумма», «Разность», «Произведение», «Деление»
- Вывод результата в отдельное окно
- Обработка ошибок: нечисловой ввод, пустые поля, деление на ноль

## Запуск
Открыть файл `index.html` в любом браузере — сборка не требуется.

git init
git add .
git commit -m "Интерактивный калькулятор: 4 операции, валидация ввода"
git branch -M main
git remote add origin https://github.com/ВАШ_ЛОГИН/calculator.git
git push -u origin main
