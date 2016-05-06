//----------------------------------------------------------
//This Source Code Form is subject to the terms of the
//Mozilla Public License, v.2.0. If a copy of the MPL
//was not distributed with this file, You can obtain one
//at http://mozilla.org/MPL/2.0/.
//----------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////////
//
// Тест для генератора BDD-шагов сценария в формате OneScript на базе файлов Gherkin
//
/////////////////////////////////////////////////////////////////////////////////////////////////

#Использовать logos
#Использовать asserts
#Использовать tempfiles

Перем юТест;
Перем Лог;
Перем ЧитательГеркин;
Перем ИсполнительБДД;

Перем Контекст;

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	юТест = ЮнитТестирование;

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("Тест_ВыполнитьФичуСПодготовленнымИсполнителемШагов");
	МассивТестов.Добавить("Тест_ВыполнитьФичуСоСтроковымиПараметрамиСПодготовленнымИсполнителемШагов");
	МассивТестов.Добавить("Тест_ВыполнитьФичуСКлючевымиСловамиШаговСоСтроковымиПараметрамиСПодготовленнымИсполнителемШагов");

	Возврат МассивТестов;

КонецФункции

Процедура ПослеЗапускаТеста() Экспорт
	ВременныеФайлы.Удалить();
КонецПроцедуры

Процедура Тест_ВыполнитьФичуСПодготовленнымИсполнителемШагов() Экспорт
	// ВключитьОтладкуИсполнителя(УровниЛога.Отладка);
	ИмяФичи = "НичегоНеДелаю";
	ФайлФичи = ПолучитьФайлФичи(ИмяФичи);

	ВозможныеСтатусыВыполнения = ИсполнительБДД.ВозможныеСтатусыВыполнения();

	РезультатыВыполнения = ИсполнительБДД.ВыполнитьФичу(ФайлФичи);

	Ожидаем.Что(РезультатыВыполнения, "Ожидали, что дерево фич будет получено как дерево значений, а это не так").ИмеетТип("ДеревоЗначений");

	Журнал = Контекст.Контекст.Журнал[ИмяФичи];
	Ожидаем.Что(Журнал, "Ожидали, что журнал выполнения будет правильным, а это не так").Равно("ЯНичегоНеДелаю;НичегоНеПроисходит;");

	Функциональность0 = РезультатыВыполнения.Строки[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Функциональность0 будет пройден, а это не так").Равно(ВозможныеСтатусыВыполнения.Пройден);

	Сценарии = Функциональность0.Строки;
	Ожидаем.Что(Сценарии, "Ожидали, что найдем правильное число сценариев").ИмеетДлину(1);

	Сценарий0 = Сценарии[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Сценарий0 будет пройден, а это не так").Равно(ВозможныеСтатусыВыполнения.Пройден);
	Ожидаем.Что(Сценарий0.Тело, "Ожидали, что найдем правильное тело сценария 0, а это не так").Равно("Ничего не делаем");

	Шаги = Сценарий0.Строки;
	Ожидаем.Что(Шаги, "Ожидали, что найдем правильное число шагов").ИмеетДлину(2);

	Шаг0 = Шаги[0];
	Ожидаем.Что(Шаг0.СтатусВыполнения, "Ожидали, что статус выполнения Шаг0 будет пройден, а это не так").Равно(ВозможныеСтатусыВыполнения.Пройден);
	Ожидаем.Что(Шаг0.Тело, "Ожидали, что найдем правильное тело шага 0, а это не так").Равно("я ничего не делаю");

	Шаг1 = Шаги[1];
	Ожидаем.Что(Шаг1.СтатусВыполнения, "Ожидали, что статус выполнения Шаг1 будет пройден, а это не так").Равно(ВозможныеСтатусыВыполнения.Пройден);
	Ожидаем.Что(Шаг1.Тело, "Ожидали, что найдем правильное тело шага 1, а это не так").Равно("ничего не происходит");
КонецПроцедуры

Процедура Тест_ВыполнитьФичуСоСтроковымиПараметрамиСПодготовленнымИсполнителемШагов() Экспорт
	ИмяФичи = "СтроковыеПараметры";
	ФайлФичи = ПолучитьФайлФичи(ИмяФичи);

	СтатусВыполненияПройден = ИсполнительБДД.ВозможныеСтатусыВыполнения().Пройден;

	РезультатыВыполнения = ИсполнительБДД.ВыполнитьФичу(ФайлФичи);

	Ожидаем.Что(РезультатыВыполнения, "Ожидали, что дерево фич будет получено как дерево значений, а это не так").ИмеетТип("ДеревоЗначений");

	Журнал = Контекст.Контекст.Журнал[ИмяФичи];
	Ожидаем.Что(Журнал, "Ожидали, что журнал выполнения будет правильным, а это не так").Равно("ЯНичегоНеДелаю<ПарамСтрока>;НичегоНеПроисходит<ДругойПарамСтрока>;");

	Функциональность0 = РезультатыВыполнения.Строки[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Функциональность0 будет пройден, а это не так").Равно(СтатусВыполненияПройден);

	Сценарии = Функциональность0.Строки;
	Ожидаем.Что(Сценарии, "Ожидали, что найдем правильное число сценариев").ИмеетДлину(1);

	Сценарий0 = Сценарии[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Сценарий0 будет пройден, а это не так").Равно(СтатусВыполненияПройден);
	Ожидаем.Что(Сценарий0.Тело, "Ожидали, что найдем правильное тело сценария 0, а это не так").Равно("Использование параметров Строка");

	Шаги = Сценарий0.Строки;
	ПроверитьСтатусВыполненияШагов(Шаги, 2, СтатусВыполненияПройден);
КонецПроцедуры

Процедура Тест_ВыполнитьФичуСКлючевымиСловамиШаговСоСтроковымиПараметрамиСПодготовленнымИсполнителемШагов() Экспорт
	ИмяФичи = "СтроковыеПараметры_ВсеКлючевыеПоля";
	ФайлФичи = ПолучитьФайлФичи(ИмяФичи);

	СтатусВыполненияПройден = ИсполнительБДД.ВозможныеСтатусыВыполнения().Пройден;

	РезультатыВыполнения = ИсполнительБДД.ВыполнитьФичу(ФайлФичи);

	Журнал = Контекст.Контекст.Журнал[ИмяФичи];
	Ожидаем.Что(Журнал, "Ожидали, что журнал выполнения будет правильным, а это не так").Равно("ВсеПутемИ<ПарамДано><ПарамНеДано>;ЯНичегоНеДелаю<ПарамКогда>;НиктоНичегоНеДелает<ПарамИ>;НичегоНеПроисходит<ПарамТогда>;");

	Функциональность0 = РезультатыВыполнения.Строки[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Функциональность0 будет пройден, а это не так").Равно(СтатусВыполненияПройден);

	Сценарии = Функциональность0.Строки;
	Сценарий0 = Сценарии[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Сценарий0 будет пройден, а это не так").Равно(СтатусВыполненияПройден);

	Шаги = Сценарий0.Строки;
	ПроверитьСтатусВыполненияШагов(Шаги, 4, СтатусВыполненияПройден);
КонецПроцедуры

Функция ПолучитьФайлФичи(ИмяФичи)
	ФайлФичи = Новый Файл(ОбъединитьПути(ПолучитьПутьФич(), ИмяФичи+".feature"));
	ВременныйКаталогФичи = ПодготовитьТестовыйКаталогСФичей(ФайлФичи);

	ФайлФичи = Новый Файл(ОбъединитьПути(ВременныйКаталогФичи.ПолноеИмя, ИмяФичи+".feature"));
	Возврат ФайлФичи;
КонецФункции

Функция ПолучитьПутьФич()
	Возврат ОбъединитьПути(ТекущийСценарий().Каталог, "..", "features", "core");
КонецФункции // ПолучитьПутьФич()

Функция ПодготовитьТестовыйКаталогСФичей(ФайлФичи)
	КаталогФичи = ВременныеФайлы.СоздатьКаталог();
	Лог.Отладка("Использую временный каталог "+КаталогФичи);
	КопироватьФайл(ФайлФичи.ПолноеИмя, ОбъединитьПути(КаталогФичи, ФайлФичи.Имя ));

	ИмяИсполнителяШагов = ФайлФичи.ИмяБезРасширения+ ".os";
	КаталогИсполнителяШагов = ОбъединитьПути(КаталогФичи, "step_definitions" );
	СоздатьКаталог(КаталогИсполнителяШагов);

	ФайлИсполнителяШагов = Новый Файл(ОбъединитьПути(КаталогИсполнителяШагов, ИмяИсполнителяШагов ));
	КопироватьФайл(ОбъединитьПути(ФайлФичи.Путь, "step_definitions", ИмяИсполнителяШагов), ФайлИсполнителяШагов.ПолноеИмя);

	Ожидаем.Что(ФайлИсполнителяШагов.Существует(), "Ожидаем, что файл исполнителя шагов существует, а его нет").Равно(Истина);
	Возврат Новый Файл(КаталогФичи);
КонецФункции

Процедура ПроверитьСтатусВыполненияШагов(Шаги, Количество, СтатусВыполнения)
	Ожидаем.Что(Шаги, "Ожидали, что найдем правильное число шагов").ИмеетДлину(Количество);

	Индекс = 0;
	Для Каждого Шаг Из Шаги Цикл
		Ожидаем.Что(Шаг.СтатусВыполнения, "Ожидали, что статус выполнения Шаг"+Индекс+" будет пройден, а это не так").Равно(СтатусВыполнения);
		Индекс = Индекс + 1;
	КонецЦикла;
КонецПроцедуры

Процедура ВключитьОтладкуИсполнителя(НовыйУровеньЛога)
	ДопЛог = Логирование.ПолучитьЛог(ИсполнительБДД.ИмяЛога());
	ДопЛог.УстановитьУровень(НовыйУровеньЛога);
КонецПроцедуры

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция Инициализация()
	Лог = Логирование.ПолучитьЛог("oscript.app.bdd-tests");

	Контекст = Новый Структура("Контекст", Новый Структура("Журнал", Новый Структура));

	ИсполнительБДД = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "../src/bdd-exec.os"), Контекст);

	ЧитательГеркин = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "../src/gherkin-read.os"), Контекст);

КонецФункции

///////////////////////////////////////////////////////////////////
// Точка входа

Инициализация();
