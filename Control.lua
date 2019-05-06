-----------[Systems control panel]-----------
component = require("component");
sides = require("sides");
colors = require("colors");
rs = component.redstone;
-----------[Functions]-----------
function coal_generator()
    if status_1 == OFF then
        rs.setBundledOutput(sides.right, colors.green,15);
        status_1 = ON
    else rs.setBundledOutput(sides.left, colors.green,0);
        status_1 = OFF
    end
    os.execute('clear');
    check();
end
--
function reactor()
    if status_2 == OFF then
        rs.setBundledOutput(sides.right, colors.green,15);
        status_2 = ON
    else rs.setBundledOutput(sides.left, colors.green,0);
        status_2 = OFF
    end
    os.execute('clear');
    check();
end
--
function materia()
    if status_3 == OFF then
        rs.setBundledOutput(sides.right, colors.red,15);
        status_3 = ON
    else rs.setBundledOutput(sides.left, colors.red,0);
        status_3 = OFF
    end
    os.execute('clear');
    check();
end
--
--
function _carier()
    if status_4 == OFF then
        rs.setBundledOutput(sides.right, colors.red,15);
        status_4 = ON
    else rs.setBundledOutput(sides.left, colors.red,0);
        status_4 = OFF
    end
    os.execute('clear');
    check();
end
--
function hlp()
    os.execute('clear');
    check();
    print('\n-------------------------------------------------',
        '\ncoal) ON|OFF Coal generator;',
        '\nreact) ON|OFF Reactor;',
        '\nmater) ON|OFF Materia generation;',
        '\ncarier) ON|OFF Cerier;',
        '\nhelp) This menu;',
        '\nexit) Exit;',
        '\n-------------------------------------------------\n');
end
--
function check()
    print('\nSystems control panel')
    if status_1 == OFF then
        print('Coal generator: OFF')
    else 
        print('Coal generator: ON')
    end
    if status_2 == OFF then
        print('Reactor: OFF')
    else 
        print('Reactor: ON')
    end
    if status_3 == OFF then
        print('Carier: OFF')
    else 
        print('Carier: ON')
    end
    if status_4 == OFF then
        print('Materia generation: OFF')
    else 
        print('Materia generation: ON')
    end
end
--
function shutdown()
    local computer = require("computer")
    computer.shutdown()
end
-----------[Main menu]-----------
status = {
    status_1 = OFF,
    status_2 = OFF,
    status_3 = OFF,
    status_4 = OFF
}
os.execute('clear');
 
print('\nSystems control panel');
print('Enter \'help\'');
 
local cmds = {
    coal = coal_generator,
    react = reactor,
    mater = materia,
    carier = _carier,
    help = hlp,
    exit = shutdown
}
local term = require("term");
 
while true do
    term.write('> ');
    cmd = term.read();
 
    if cmd == false then
      print("Exiting!")
      os.exit()
    end
    cmd, _ = cmd:gsub("\n","");
    if type(cmds[cmd]) == "function" then
      cmds[cmd]();
    else
      print("No such command: " .. cmd);
    end
end
