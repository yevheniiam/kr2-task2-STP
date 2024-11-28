require 'rspec'

require_relative '../main'

RSpec.describe 'process_array_parallel' do
  it 'обробляє елементи масиву, збільшуючи кожен на 2' do
    array = [1, 2, 3, 4, 5]

    result = process_array_parallel(array)

    expect(result).to eq([3, 4, 5, 6, 7]) # Перевіряємо, чи кожен елемент збільшився на 2
  end

  it 'не змінює порядок елементів у масиві' do
    array = [10, 20, 30, 40]

    result = process_array_parallel(array)

    expect(result).to eq([12, 22, 32, 42]) # Порядок елементів має зберігатися
  end

  it 'повертає правильні значення при порожньому масиві' do
    array = []

    result = process_array_parallel(array)

    expect(result).to eq([]) # Порожній масив має повертати порожній масив
  end
end
