### Минимальнейший пример генератора на экосистеме дарта.

Тут 2 модуля:
1) *model_generator* - если у класса есть поле id, то генерируется комментарий "class $className has the id field"
2) *model_generated_to* - пример использования. Нужен build_runner, заклинание в `build.yaml` и запуск терминале: `pub run build_runner watch`


*model_generator* состоит из 
- функции возвращающей LibraryBuilder
- путь до этой функции в `build.yaml` (где найти полную схему этого файла?)
- теста, который позволяет дебажить этот генератор


