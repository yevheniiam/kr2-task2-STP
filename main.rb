require 'concurrent-ruby'

# Метод, що обробляє масив
def process_element(element)
  # збільшимо кожен елемент на 2
  element + 2
end

# Основна програма
def process_array_parallel(array)
  # Створимо "ізольовані" потоки, які будуть обробляти елементи масиву
  futures = array.map do |element|
    # Запускаємо потік для кожного елемента
    Concurrent::Future.execute do
      process_element(element)
    end
  end

  # Чекаємо на виконання всіх потоків і збираємо результати
  results = futures.map(&:value)
  results
end

# Приклад масиву
array = [1, 2, 3, 4, 5]

# Викликаємо обробку масиву
processed_array = process_array_parallel(array)

# Виводимо результат
puts "Оброблений масив: #{processed_array}"
