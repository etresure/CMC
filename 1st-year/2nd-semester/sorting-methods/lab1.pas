program Hello(input, output);

type 
    arr = array[1..100] of integer;
var
    n, comp, move, typeM: integer;
    x, y: arr;

procedure inp(n: integer; var x: arr); 
var 
    i: integer;
begin
    for i := 1 to n do
        read(x[i])
end;

procedure copy(n: integer; var y, x: arr);  {процедура копирования массива x в массив y}
var
    i: integer;
begin
    for i := 1 to n do
        y[i] := x[i]
end;    

procedure print(n: integer; var x: arr); {процедура вывода массива}
var 
    i: integer;
begin
    for i := 1 to n do
        write(x[i], ' ')
end;

procedure create(n, typeM: integer; var x: arr);  {процедура создания выбранного типа массива}
var 
    pos, i, j: integer;
begin
    for i := 1 to n do    {случайная расстановка элементов в массиве}
        x[i] := random(1000);
    if typeM = 1 then    {упорядоченный массив}
        begin 
            for i := 1 to n - 1 do     
                for j := 1 to n - i do    
                    if x[j] > x[j + 1] then     
                        begin                       
                            pos := x[j];                         
                            x[j] := x[j + 1];      
                            x[j + 1] := pos
                        end
        end
    else if typeM = 2 then    {упорядоченный в обратном порядке массив}
        begin 
            for i := 1 to n - 1 do     
                for j := 1 to n - i do    
                    if x[j] < x[j + 1] then     
                        begin                       
                            pos := x[j];                         
                            x[j] := x[j + 1];      
                            x[j + 1] := pos
                        end
        end
end;

procedure bubbleSort(n: integer; var x: arr);   {сортировка пузырьком} 
var 
    pos, i, j: integer;
begin
    for i := 1 to n - 1 do     {повторяем внутренний цикл n-1 раз, т.к. последний эл-т сам по себе будет отсортирован}
        for j := 1 to n - i do    {перебираем эл-ты массива до n-i, так как остальные эл-ты уже упорядочены}
            begin
                inc(comp);
                if x[j] > x[j + 1] then      {сравниваем два соседних элемента массива}
                    begin                       
                        pos := x[j];                         
                        x[j] := x[j + 1];      {если текущий эл-т > следующего, то меняем местами}
                        x[j + 1] := pos;
                        inc(move)
                    end
            end
end;    

procedure heapSort(n: integer; var x: arr);
var 
    pos, i, head, b: integer;
begin       {необходимо преобразовать массив в двочиное дерево(пирамиду), в котором каждый эл-т опирается на два меньших}
    for i := (n div 2) downto 1 do {эл-ты с ((n div 2) + 1) по n - основание пирамиды => они не учавствуют в преобразовании}
        begin  {двигаясь от конца массива к началу необходимо проверять эл-ты x[i](родитель), x[2 * i] и x[2 * i + 1](потомки) и перемещать максимум в эл-т x[i]}
            head := i;   {в результате перемещения могут нарушится условия пирамидальности в нижней тройке эл-тов => это нужно проверить и повторить процесс при необходимости}
            while head <= (n div 2) do {пока у head есть потомки}{head - индекс родителя в текущей тройки, pos - его потомки}
                begin
                    pos := 2 * head; {находим индекс одного потомка}
                    inc(comp);
                    if (pos + 1 <= n) and (x[pos] < x[pos + 1]) then {проверяем, не выходит ли потомок за пределы массива, затем находим максимального из двух потомков}
                        inc(pos); {если потомок существует и 2-ой > 1-го, то выбираем его для сравнения с родителем}
                    inc(comp);
                    if x[pos] > x[head] then {если найденный потомок > родителя, то меняем их местами}
                        begin
                            b := x[head];
                            x[head] := x[pos];
                            x[pos] := b;
                            head := pos; {запоминаем индекс нового родителя в данной тройке, чтобы проверить, не нарушилась ли пирамидальность в нижней тройке}
                            inc(move)
                        end
                    else
                        break {если произошел выход за пределы массива(т.е. у текущего родителя нет потомков), то выходим из цикла while} 
                end
        end; {конец построения основной пирамиды}
    
for i := n downto 2 do    {начало сортировки; после построения пирамиды максимальный эл-т имеет индекс 1}
    begin                   
        b := x[1];
        x[1] := x[i];  {меняем местами 1-ый и n-ый эл-ты, т.е. максимальный с последним}
        x[i] := b;
        head := 1;      {просеиваем новый первый эл-т, не затрагивая уже отсортированный конец последовательности(эл-ты с i–го по n–й)}
        inc(move);
        while head <= ((i - 1) div 2) do     {повторяем алгоритм просеивания для нового эл-та, чтобы переместить очередной максимальный эл-т нового массива на последнее место}    
            begin
                pos := 2 * head;    {таким образом сортируем массив}
                inc(comp);
                if (pos + 1 <= i - 1) and (x[pos] < x[pos + 1]) then
                    inc(pos);
                inc(comp);
                if x[pos] > x[head] then
                    begin
                        b := x[head];
                        x[head] := x[pos];
                        x[pos] := b;
                        head := pos;
                        inc(move)
                    end
                else
                    break
            end
    end                                      
end;                                                

begin
  write('Введите n(кол-во эл-тов массива): ');
  readln(n);
  write('Выберите тип массива: ');  {1)упорядоченный; 2)упорядоченный в обратном порядке; 3)случайная расстановка эл-тов}
  readln(typeM);
  randomize;
  create(N, typeM, x);
  write('Исходный массив: ');
  writeln;
  print(n, x);
  writeln;
  writeln('Сортировка пузырьком:');
  comp := 0;
  move := 0;
  copy(n, y, x);
  bubbleSort(n, x);
  print(n, x);
  writeln;
  writeln('Кол-во сравнений: ', comp);
  writeln('Кол-во перестановок: ', move);
  writeln;
  write('Исходный массив: ');
  writeln;
  copy(n, x, y);
  print(n, x);
  writeln;
  writeln('Пирамидальная сортировка:');
  comp := 0;
  move := 0;
  {inp(n, x);}
  heapSort(n, x);
  print(n, x);
  writeln;
  writeln('Кол-во сравнений: ', comp);
  writeln('Кол-во перестановок: ', move)
end. 


