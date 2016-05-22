//----------------------------------------------------------
//This Source Code Form is subject to the terms of the
//Mozilla Public License, v.2.0. If a copy of the MPL
//was not distributed with this file, You can obtain one
//at http://mozilla.org/MPL/2.0/.
//----------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////////////////////
//
// Тест для генератора BDD-шагов сценария в формате OneScript на базе файлов Gherkin
//
/////////////////////////////////////////////////////////////////////////////////////////////////

#Использовать logos
#Использовать asserts
#Использовать tempfiles

Перем юТест;
Перем Лог;
Перем ГенераторШагов;
Перем ИсполнительБДД;
Перем ЧитательГеркин;

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	юТест = ЮнитТестирование;

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("Тест_ДолженСоздатьФайлРеализацииПростойФайлФичи");
	МассивТестов.Добавить("Тест_ДолженСоздатьФайлРеализацииФайлФичиСПараметрами");

	Возврат МассивТестов;

КонецФункции

Процедура ПослеЗапускаТеста() Экспорт
	ВключитьОтладкуГенератора(УровниЛога.Информация);
КонецПроцедуры

Процедура Тест_ДолженСоздатьФайлРеализацииПростойФайлФичи() Экспорт

	// ВключитьОтладкуГенератора(УровниЛога.Отладка);

	ИмяФичи = "НичегоНеДелаю";
	ФайлФичи = ПолучитьФайлФичи(ИмяФичи);
	Лог.Отладка("Использую файл "+ФайлФичи.ПолноеИмя);

	ФайлШагов = ГенераторШагов.СоздатьФайлРеализацииШагов(ФайлФичи);

	Ожидаем.Что(ФайлШагов.Существует(), "ФайлШагов.Существует()").Равно(Истина);
	Ожидаем.Что(ФайлШагов.Имя, "ФайлШагов.Имя").Равно(ИмяФичи+".os");

	КаталогШагов = Новый Файл(ФайлШагов.Путь);
	Ожидаем.Что(КаталогШагов.Имя, "КаталогШагов.Имя").Равно("step_definitions");

	ЧтениеТекста = Новый ЧтениеТекста(ФайлШагов.ПолноеИмя, "UTF-8");
	ТекстФайлаШагов = ЧтениеТекста.Прочитать();
	Лог.Отладка("ТекстФайлаШагов "+Символы.ПС + ТекстФайлаШагов);
	Ожидаем.Что(ТекстФайлаШагов, "ТекстФайлаШагов заполнен").Заполнено();

	ЧтениеТекста.Закрыть();

	СтатусВыполненияПройден = ИсполнительБДД.ВозможныеСтатусыВыполнения().Пройден;
	СтатусВыполненияНеРеализован = ИсполнительБДД.ВозможныеСтатусыВыполнения().НеРеализован;

	РезультатыВыполнения = ИсполнительБДД.ВыполнитьФичу(ФайлФичи);

	Ожидаем.Что(РезультатыВыполнения, "Ожидали, что дерево фич будет получено как дерево значений, а это не так").ИмеетТип("ДеревоЗначений");

	Функциональность0 = РезультатыВыполнения.Строки[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Функциональность0 будет Не реализован, а это не так").Равно(СтатусВыполненияНеРеализован);

КонецПроцедуры

Процедура Тест_ДолженСоздатьФайлРеализацииФайлФичиСПараметрами() Экспорт

	//ВключитьОтладкуГенератора(УровниЛога.Отладка);

	ИмяФичи = "ПередачаПараметров";
	ФайлФичи = ПолучитьФайлФичи(ИмяФичи);
	Лог.Отладка("Использую файл "+ФайлФичи.ПолноеИмя);

	ФайлШагов = ГенераторШагов.СоздатьФайлРеализацииШагов(ФайлФичи);

	Ожидаем.Что(ФайлШагов.Существует(), "ФайлШагов.Существует()").Равно(Истина);
	Ожидаем.Что(ФайлШагов.Имя, "ФайлШагов.Имя").Равно(ИмяФичи+".os");

	КаталогШагов = Новый Файл(ФайлШагов.Путь);
	Ожидаем.Что(КаталогШагов.Имя, "КаталогШагов.Имя").Равно("step_definitions");

	ЧтениеТекста = Новый ЧтениеТекста(ФайлШагов.ПолноеИмя, "UTF-8");
	ТекстФайлаШагов = ЧтениеТекста.Прочитать();
	Лог.Отладка("ТекстФайлаШагов "+Символы.ПС + ТекстФайлаШагов);
	Ожидаем.Что(ТекстФайлаШагов, "ТекстФайлаШагов заполнен").Заполнено();

	ЧтениеТекста.Закрыть();

	СтатусВыполненияПройден = ИсполнительБДД.ВозможныеСтатусыВыполнения().Пройден;
	СтатусВыполненияНеРеализован = ИсполнительБДД.ВозможныеСтатусыВыполнения().НеРеализован;

	РезультатыВыполнения = ИсполнительБДД.ВыполнитьФичу(ФайлФичи);

	Ожидаем.Что(РезультатыВыполнения, "Ожидали, что дерево фич будет получено как дерево значений, а это не так").ИмеетТип("ДеревоЗначений");

	Функциональность0 = РезультатыВыполнения.Строки[0];
	Ожидаем.Что(Функциональность0.СтатусВыполнения, "Ожидали, что статус выполнения Функциональность0 будет Не реализован, а это не так").Равно(СтатусВыполненияНеРеализован);

КонецПроцедуры

// TODO дубль метода с соседним тестовым файлом
Функция ПолучитьФайлФичи(ИмяФичи)
	ФайлФичи = Новый Файл(ОбъединитьПути(ПолучитьПутьФич(), ИмяФичи+".feature"));
	ВременныйКаталогФичи = ПодготовитьТестовыйКаталогСФичей(ФайлФичи);

	ФайлФичи = Новый Файл(ОбъединитьПути(ВременныйКаталогФичи.ПолноеИмя, ИмяФичи+".feature"));
	Возврат ФайлФичи;
КонецФункции

Функция ПолучитьПутьФич()
	Возврат ОбъединитьПути(ТекущийСценарий().Каталог, "..", "features", "core");
КонецФункции // ПолучитьПутьФич()

// TODO дубль метода с соседним тестовым файлом
Функция ПодготовитьТестовыйКаталогСФичей(ФайлФичи)
	КаталогФичи = ВременныеФайлы.СоздатьКаталог();
	Лог.Отладка("Использую временный каталог "+КаталогФичи);
	КопироватьФайл(ФайлФичи.ПолноеИмя, ОбъединитьПути(КаталогФичи, ФайлФичи.Имя ));

	ИмяИсполнителяШагов = ФайлФичи.ИмяБезРасширения+ ".os";
	КаталогИсполнителяШагов = ОбъединитьПути(КаталогФичи, "step_definitions" );
	СоздатьКаталог(КаталогИсполнителяШагов);

	ФайлИсполнителяШагов = Новый Файл(ОбъединитьПути(КаталогИсполнителяШагов, ИмяИсполнителяШагов ));

	Ожидаем.Что(ФайлИсполнителяШагов.Существует(), "Ожидаем, что файл исполнителя шагов не существует, а он есть").Равно(Ложь);
	Возврат Новый Файл(КаталогФичи);
КонецФункции

Процедура ВключитьОтладкуГенератора(НовыйУровеньЛога)
	ДопЛог = Логирование.ПолучитьЛог(ГенераторШагов.ИмяЛога());
	ДопЛог.УстановитьУровень(НовыйУровеньЛога);

	ДопЛог = Логирование.ПолучитьЛог(ИсполнительБДД.ИмяЛога());
	ДопЛог.УстановитьУровень(НовыйУровеньЛога);

	ДопЛог = Логирование.ПолучитьЛог(ЧитательГеркин.ИмяЛога());
	ДопЛог.УстановитьУровень(НовыйУровеньЛога);

КонецПроцедуры

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция Инициализация()
	Лог = Логирование.ПолучитьЛог("bdd-gen-tests");
	Лог.УстановитьУровень(УровниЛога.Отладка);

	ЧитательГеркин = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "../src/gherkin-read.os"));

	ГенераторШагов = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "../src/bdd-generate.os"));

	Контекст = Новый Структура("Контекст", Новый Структура("Журнал", Новый Структура));
	ИсполнительБДД = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "../src/bdd-exec.os"), Контекст);

КонецФункции

///////////////////////////////////////////////////////////////////
// Точка входа

Инициализация();
