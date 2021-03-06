-- Generated by Haxe 4.0.0-rc.1+1fc84df26
local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local Array = _hx_e()
local Math = _hx_e()
local String = _hx_e()
local Std = _hx_e()
__defold_GoMessages = _hx_e()
__defold_PhysicsMessages = _hx_e()
__defold_SpriteMessages = _hx_e()
__defold_support_GuiScript = _hx_e()
__defold_support_Script = _hx_e()
__warbattles_Player = _hx_e()
__warbattles_Rocket = _hx_e()
__warbattles_Ui = _hx_e()
__defold_support_Init = _hx_e()
__lua_Boot = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw
local _hx_pcall_default = {};
local _hx_pcall_break = {};

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self, 0);
end
Array.prototype = _hx_a();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local _g3 = 0;
  while (_g3 < a.length) do 
    local i1 = a[_g3];
    _g3 = _g3 + 1;
    _g:push(i1);
  end;
  do return _g end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _gthis = self;
  local cur_length = 0;
  local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end});
  while (i:hasNext()) do 
    _G.table.insert(tbl, Std.string(i:next()));
  end;
  do return _G.table.concat(tbl, sep) end
end
Array.prototype.pop = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[self.length - 1];
  self[self.length - 1] = nil;
  self.length = self.length - 1;
  do return ret end
end
Array.prototype.push = function(self,x) 
  self[self.length] = x;
  do return self.length end
end
Array.prototype.reverse = function(self) 
  local tmp;
  local i = 0;
  while (i < Std.int(self.length / 2)) do 
    tmp = self[i];
    self[i] = self[(self.length - i) - 1];
    self[(self.length - i) - 1] = tmp;
    i = i + 1;
  end;
end
Array.prototype.shift = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[0];
  if (self.length == 1) then 
    self[0] = nil;
  else
    if (self.length > 1) then 
      self[0] = self[1];
      _G.table.remove(self, 1);
    end;
  end;
  local tmp = self;
  tmp.length = tmp.length - 1;
  do return ret end
end
Array.prototype.slice = function(self,pos,_end) 
  if ((_end == nil) or (_end > self.length)) then 
    _end = self.length;
  else
    if (_end < 0) then 
      _end = _G.math.fmod((self.length - (_G.math.fmod(-_end, self.length))), self.length);
    end;
  end;
  if (pos < 0) then 
    pos = _G.math.fmod((self.length - (_G.math.fmod(-pos, self.length))), self.length);
  end;
  if ((pos > _end) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  end;
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    ret:push(self[_g - 1]);
  end;
  do return ret end
end
Array.prototype.sort = function(self,f) 
  local i = 0;
  local l = self.length;
  while (i < l) do 
    local swap = false;
    local j = 0;
    local max = (l - i) - 1;
    while (j < max) do 
      if (f(self[j], self[j + 1]) > 0) then 
        local tmp = self[j + 1];
        self[j + 1] = self[j];
        self[j] = tmp;
        swap = true;
      end;
      j = j + 1;
    end;
    if (not swap) then 
      break;
    end;
    i = i + 1;
  end;
end
Array.prototype.splice = function(self,pos,len) 
  if ((len < 0) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  else
    if (pos < 0) then 
      pos = self.length - (_G.math.fmod(-pos, self.length));
    end;
  end;
  len = Math.min(len, self.length - pos);
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = pos + len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
    self[i] = self[i + len];
  end;
  local _g2 = pos + len;
  local _g3 = self.length;
  while (_g2 < _g3) do 
    _g2 = _g2 + 1;
    local i1 = _g2 - 1;
    self[i1] = self[i1 + len];
  end;
  local tmp = self;
  tmp.length = tmp.length - len;
  do return ret end
end
Array.prototype.toString = function(self) 
  local tbl = ({});
  _G.table.insert(tbl, "[");
  _G.table.insert(tbl, self:join(","));
  _G.table.insert(tbl, "]");
  do return _G.table.concat(tbl, "") end
end
Array.prototype.unshift = function(self,x) 
  local len = self.length;
  local _g = 0;
  while (_g < len) do 
    _g = _g + 1;
    local i = _g - 1;
    self[len - i] = self[(len - i) - 1];
  end;
  self[0] = x;
end
Array.prototype.insert = function(self,pos,x) 
  if (pos > self.length) then 
    pos = self.length;
  end;
  if (pos < 0) then 
    pos = self.length + pos;
    if (pos < 0) then 
      pos = 0;
    end;
  end;
  local cur_len = self.length;
  while (cur_len > pos) do 
    self[cur_len] = self[cur_len - 1];
    cur_len = cur_len - 1;
  end;
  self[pos] = x;
end
Array.prototype.remove = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (self[i] == x) then 
      local _g2 = i;
      local _g11 = self.length - 1;
      while (_g2 < _g11) do 
        _g2 = _g2 + 1;
        local j = _g2 - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.indexOf = function(self,x,fromIndex) 
  local _end = self.length;
  if (fromIndex == nil) then 
    fromIndex = 0;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        fromIndex = 0;
      end;
    end;
  end;
  local _g = fromIndex;
  while (_g < _end) do 
    _g = _g + 1;
    local i = _g - 1;
    if (x == self[i]) then 
      do return i end;
    end;
  end;
  do return -1 end
end
Array.prototype.lastIndexOf = function(self,x,fromIndex) 
  if ((fromIndex == nil) or (fromIndex >= self.length)) then 
    fromIndex = self.length - 1;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        do return -1 end;
      end;
    end;
  end;
  local i = fromIndex;
  while (i >= 0) do 
    if (self[i] == x) then 
      do return i end;
    else
      i = i - 1;
    end;
  end;
  do return -1 end
end
Array.prototype.copy = function(self) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    if (f(i)) then 
      _g:push(i);
    end;
  end;
  do return _g end
end
Array.prototype.iterator = function(self) 
  local _gthis = self;
  local cur_length = 0;
  do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end}) end
end
Array.prototype.resize = function(self,len) 
  if (self.length < len) then 
    self.length = len;
  else
    if (self.length > len) then 
      local _g = len;
      local _g1 = self.length;
      while (_g < _g1) do 
        _g = _g + 1;
        self[_g - 1] = nil;
      end;
      self.length = len;
    end;
  end;
end

Math.new = {}
Math.isNaN = function(f) 
  do return f ~= f end;
end
Math.isFinite = function(f) 
  if (f > -_G.math.huge) then 
    do return f < _G.math.huge end;
  else
    do return false end;
  end;
end
Math.min = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.min(a, b) end;
  end;
end

String.new = function(string) 
  local self = _hx_new(String.prototype)
  String.super(self,string)
  self = string
  return self
end
String.super = function(self,string) 
end
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((_G.type(o) == "string") and ((String.prototype[field] ~= nil) or (field == "length"))) then 
      _hx_1 = true; elseif (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        if (_G.type(String.__oldindex) == "function") then 
          do return String.__oldindex(s, k) end;
        else
          if (_G.type(String.__oldindex) == "table") then 
            do return String.__oldindex[k] end;
          end;
        end;
        do return nil end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_a();
String.prototype.toUpperCase = function(self) 
  do return _G.string.upper(self) end
end
String.prototype.toLowerCase = function(self) 
  do return _G.string.lower(self) end
end
String.prototype.indexOf = function(self,str,startIndex) 
  if (startIndex == nil) then 
    startIndex = 1;
  else
    startIndex = startIndex + 1;
  end;
  local r = _G.string.find(self, str, startIndex, true);
  if ((r ~= nil) and (r > 0)) then 
    do return r - 1 end;
  else
    do return -1 end;
  end;
end
String.prototype.lastIndexOf = function(self,str,startIndex) 
  local ret = -1;
  if (startIndex == nil) then 
    startIndex = #self;
  end;
  while (true) do 
    local startIndex1 = ret + 1;
    if (startIndex1 == nil) then 
      startIndex1 = 1;
    else
      startIndex1 = startIndex1 + 1;
    end;
    local r = _G.string.find(self, str, startIndex1, true);
    local p = (function() 
      local _hx_1
      if ((r ~= nil) and (r > 0)) then 
      _hx_1 = r - 1; else 
      _hx_1 = -1; end
      return _hx_1
    end )();
    if ((p == -1) or (p > startIndex)) then 
      break;
    end;
    ret = p;
  end;
  do return ret end
end
String.prototype.split = function(self,delimiter) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (#delimiter > 0) then 
      newidx = _G.string.find(self, delimiter, idx, true);
    else
      if (idx >= #self) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      ret:push(_G.string.sub(self, idx, newidx - 1));
      idx = newidx + #delimiter;
    else
      ret:push(_G.string.sub(self, idx, #self));
      idx = nil;
    end;
  end;
  do return ret end
end
String.prototype.toString = function(self) 
  do return self end
end
String.prototype.substring = function(self,startIndex,endIndex) 
  if (endIndex == nil) then 
    endIndex = #self;
  end;
  if (endIndex < 0) then 
    endIndex = 0;
  end;
  if (startIndex < 0) then 
    startIndex = 0;
  end;
  if (endIndex < startIndex) then 
    do return _G.string.sub(self, endIndex + 1, startIndex) end;
  else
    do return _G.string.sub(self, startIndex + 1, endIndex) end;
  end;
end
String.prototype.charAt = function(self,index) 
  do return _G.string.sub(self, index + 1, index + 1) end
end
String.prototype.charCodeAt = function(self,index) 
  do return _G.string.byte(self, index + 1) end
end
String.prototype.substr = function(self,pos,len) 
  if ((len == nil) or (len > (pos + #self))) then 
    len = #self;
  else
    if (len < 0) then 
      len = #self + len;
    end;
  end;
  if (pos < 0) then 
    pos = #self + pos;
  end;
  if (pos < 0) then 
    pos = 0;
  end;
  do return _G.string.sub(self, pos + 1, pos + len) end
end

Std.new = {}
Std.string = function(s) 
  do return __lua_Boot.__string_rec(s) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end

__defold_GoMessages.new = {}

__defold_PhysicsMessages.new = {}

__defold_SpriteMessages.new = {}

__defold_support_GuiScript.new = function() 
  local self = _hx_new()
  __defold_support_GuiScript.super(self)
  return self
end
__defold_support_GuiScript.super = function(self) 
end

__defold_support_Script.new = function() 
  local self = _hx_new()
  __defold_support_Script.super(self)
  return self
end
__defold_support_Script.super = function(self) 
end

__warbattles_Player.new = function() 
  local self = _hx_new(__warbattles_Player.prototype)
  __warbattles_Player.super(self)
  return self
end
__warbattles_Player.super = function(self) 
  __defold_support_Script.super(self);
end
__warbattles_Player.prototype = _hx_a();
__warbattles_Player.prototype.init = function(self,_self) 
  _G.msg.post(".", __defold_GoMessages.acquire_input_focus);
  _self.moving = false;
  _self.firing = false;
  _self.input = _G.vmath.vector3();
  _self.dir = _G.vmath.vector3(0, 1, 0);
  _self.speed = 50;
end
__warbattles_Player.prototype.final_ = function(self,_self) 
  _G.msg.post(".", __defold_GoMessages.release_input_focus);
end
__warbattles_Player.prototype.update = function(self,_self,dt) 
  if (_self.moving) then 
    local pos = _G.go.get_position();
    local a = _self.dir;
    local b = _self.speed;
    local a1 = (a) * (b);
    local b1 = (a1) * (dt);
    pos = (pos) + (b1);
    _G.go.set_position(pos);
  end;
  if (_self.firing) then 
    local rot = _G.vmath.quat_rotation_z(_G.math.atan2(_self.dir.y, _self.dir.x));
    local props = ({});
    props.dir = _self.dir;
    _G.factory.create("#rocketfactory", nil, rot, props);
  end;
  _self.input.x = 0;
  _self.input.y = 0;
  _self.moving = false;
  _self.firing = false;
end
__warbattles_Player.prototype.on_input = function(self,_self,action_id,action) 
  if (action_id == _G.hash("up")) then 
    _self.input.y = 1;
  else
    if (action_id == _G.hash("down")) then 
      _self.input.y = -1;
    else
      if (action_id == _G.hash("left")) then 
        _self.input.x = -1;
      else
        if (action_id == _G.hash("right")) then 
          _self.input.x = 1;
        else
          if ((action_id == _G.hash("fire")) and action.pressed) then 
            _self.firing = true;
          end;
        end;
      end;
    end;
  end;
  if (_hx_wrap_if_string_field(_G.vmath,'length')(_self.input) > 0) then 
    _self.moving = true;
    _self.dir = _G.vmath.normalize(_self.input);
  end;
  do return false end
end
__warbattles_Player.__super__ = __defold_support_Script
setmetatable(__warbattles_Player.prototype,{__index=__defold_support_Script.prototype})

__warbattles_Rocket.new = function() 
  local self = _hx_new(__warbattles_Rocket.prototype)
  __warbattles_Rocket.super(self)
  return self
end
__warbattles_Rocket.super = function(self) 
  __defold_support_Script.super(self);
end
__warbattles_Rocket.prototype = _hx_a();
__warbattles_Rocket.prototype.init = function(self,_self) 
  _self.speed = 200;
  _self.life = 1;
end
__warbattles_Rocket.prototype.explode = function(self,_self) 
  _self.life = 1000;
  _G.go.set_rotation(_G.vmath.quat());
  _self.speed = 0;
  _G.msg.post("#sprite", __defold_SpriteMessages.play_animation, _hx_o({__fields__={id=true},id=_G.hash("explosion")}));
end
__warbattles_Rocket.prototype.update = function(self,_self,dt) 
  local pos = _G.go.get_position();
  local a = _self.dir;
  local b = _self.speed;
  local a1 = (a) * (b);
  local b1 = (a1) * (dt);
  pos = (pos) + (b1);
  _G.go.set_position(pos);
  local self1 = _self;
  self1.life = self1.life - dt;
  if (_self.life < 0) then 
    self:explode(_self);
  end;
end
__warbattles_Rocket.prototype.on_message = function(self,_self,message_id,message,sender) 
  if (message_id) == __defold_SpriteMessages.animation_done then 
    _G.go.delete();
  elseif (message_id) == __defold_PhysicsMessages.collision_response then 
    self:explode(_self);
    _G.go.delete(message.other_id);
    _G.msg.post("/gui#ui", __warbattles_Ui.add_score, _hx_o({__fields__={score=true},score=100})); end;
end
__warbattles_Rocket.__super__ = __defold_support_Script
setmetatable(__warbattles_Rocket.prototype,{__index=__defold_support_Script.prototype})

__warbattles_Ui.new = function() 
  local self = _hx_new(__warbattles_Ui.prototype)
  __warbattles_Ui.super(self)
  return self
end
__warbattles_Ui.super = function(self) 
  __defold_support_GuiScript.super(self);
end
__warbattles_Ui.prototype = _hx_a();
__warbattles_Ui.prototype.init = function(self,_self) 
  _self.score = 0;
end
__warbattles_Ui.prototype.on_message = function(self,_self,message_id,message,sender) 
  if (message_id == __warbattles_Ui.add_score) then 
    _self.score = _self.score + message.score;
    _G.gui.set_text(_G.gui.get_node("score"), Std.string("SCORE: ") .. Std.string(_self.score));
  end;
end
__warbattles_Ui.__super__ = __defold_support_GuiScript
setmetatable(__warbattles_Ui.prototype,{__index=__defold_support_GuiScript.prototype})

__defold_support_Init.new = {}
__defold_support_Init.init = function(exports) 
  local script = __warbattles_Player.new();
  exports.warbattles_Player_init = function(_self) 
    script:init(_self);
  end;
  exports.warbattles_Player_final_ = function(self1) 
    script:final_(self1);
  end;
  exports.warbattles_Player_update = function(self2,dt) 
    script:update(self2, dt);
  end;
  exports.warbattles_Player_on_input = function(self3,action_id,action) 
    do return script:on_input(self3, action_id, action) end;
  end;
  local script1 = __warbattles_Rocket.new();
  exports.warbattles_Rocket_init = function(self4) 
    script1:init(self4);
  end;
  exports.warbattles_Rocket_update = function(self5,dt1) 
    script1:update(self5, dt1);
  end;
  exports.warbattles_Rocket_on_message = function(self6,message_id,message,sender) 
    script1:on_message(self6, message_id, message, sender);
  end;
  local script2 = __warbattles_Ui.new();
  exports.warbattles_Ui_init = function(self7) 
    script2:init(self7);
  end;
  exports.warbattles_Ui_on_message = function(self8,message_id1,message1,sender1) 
    script2:on_message(self8, message_id1, message1, sender1);
  end;
end

__lua_Boot.new = {}
__lua_Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
__lua_Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(Std.string(o[0])) .. Std.string("(");
    s = Std.string(s) .. Std.string("\t");
    local _g = 2;
    local _g1 = o.length;
    while (_g < _g1) do 
      _g = _g + 1;
      local i = _g - 1;
      if (i ~= 2) then 
        str = Std.string(str) .. Std.string((Std.string(",") .. Std.string(__lua_Boot.__string_rec(o[i], s))));
      else
        str = Std.string(str) .. Std.string(__lua_Boot.__string_rec(o[i], s));
      end;
    end;
    do return Std.string(str) .. Std.string(")") end;
  end;
end
__lua_Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = __lua_Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
__lua_Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  local _g = type(o);
  if (_g) == "boolean" then 
    do return tostring(o) end;
  elseif (_g) == "function" then 
    do return "<function>" end;
  elseif (_g) == "nil" then 
    do return "null" end;
  elseif (_g) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o == 0) then 
          do return "0" end;
        else
          if (o ~= o) then 
            do return "NaN" end;
          else
            do return tostring(o) end;
          end;
        end;
      end;
    end;
  elseif (_g) == "string" then 
    do return o end;
  elseif (_g) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return __lua_Boot.printEnum(o, s) end;
    else
      if ((_hx_wrap_if_string_field(o,'toString') ~= nil) and not __lua_Boot.isArray(o)) then 
        do return _hx_wrap_if_string_field(o,'toString')(o) end;
      else
        if (__lua_Boot.isArray(o)) then 
          local o2 = o;
          if (#s > 5) then 
            do return "[...]" end;
          else
            local _g1 = _hx_tab_array({}, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g1:push(__lua_Boot.__string_rec(i, Std.string(s) .. Std.string(1)));
            end;
            do return Std.string(Std.string("[") .. Std.string(_g1:join(","))) .. Std.string("]") end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return Std.string(Std.string("{") .. Std.string(__lua_Boot.printClassRec(o, "", Std.string(s) .. Std.string("\t")))) .. Std.string("}") end;
          else
            local fields = __lua_Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer, "{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer, ", ");
              end;
              _G.table.insert(buffer, Std.string(Std.string(Std.string("") .. Std.string(Std.string(f1))) .. Std.string(" : ")) .. Std.string(Std.string(o[f1])));
            end;
            _G.table.insert(buffer, " }");
            do return _G.table.concat(buffer, "") end;
          end;
        end;
      end;
    end;
  elseif (_g) == "thread" then 
    do return "<thread>" end;
  elseif (_g) == "userdata" then 
    local mt = _G.getmetatable(o);
    if ((mt ~= nil) and (mt.__tostring ~= nil)) then 
      do return _G.tostring(o) end;
    else
      do return "<userdata>" end;
    end;else
  _G.error("Unknown Lua type",0); end;
end
__lua_Boot.fieldIterator = function(o) 
  if (_G.type(o) ~= "table") then 
    do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
      do return nil end;
    end,hasNext=function(self) 
      do return false end;
    end}) end;
  end;
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (__lua_Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1, val);
    end;
    do return val end;
  end;
  local cur_val = next_valid(tbl, cur(tbl, nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local ret = cur_val;
    cur_val = next_valid(tbl, cur(tbl, cur_val));
    do return ret end;
  end,hasNext=function(self) 
    do return cur_val ~= nil end;
  end}) end;
end
_hx_bit_clamp = function(v) 
  if v <= 2147483647 and v >= -2147483648 then
    if v > 0 then return _G.math.floor(v)
    else return _G.math.ceil(v)
    end
  end
  if v > 2251798999999999 then v = v*2 end;
  if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
  return _hx_bit.band(v, 2147483647 ) - math.abs(_hx_bit.band(v, 2147483648))
end
pcall(require, 'bit')
if bit then
  _hx_bit = bit
else
  local _hx_bit_raw = _G.require('bit32')
  _hx_bit = setmetatable({}, { __index = _hx_bit_raw });
  _hx_bit.bnot = function(...) return _hx_bit_clamp(_hx_bit_raw.bnot(...)) end;
  _hx_bit.bxor = function(...) return _hx_bit_clamp(_hx_bit_raw.bxor(...)) end;
end
_hx_array_mt.__index = Array.prototype

local _hx_static_init = function()
  __defold_GoMessages.acquire_input_focus = _G.hash("acquire_input_focus");
  __defold_GoMessages.release_input_focus = _G.hash("release_input_focus");
  __defold_PhysicsMessages.collision_response = _G.hash("collision_response");
  __defold_SpriteMessages.animation_done = _G.hash("animation_done");
  __defold_SpriteMessages.play_animation = _G.hash("play_animation");
  __warbattles_Ui.add_score = _G.hash("add_score");
  __lua_Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
  
  _hxdefold_ = _hxdefold_ or {}
  __defold_support_Init.init(_hxdefold_);
end

_hx_wrap_if_string_field = function(o, fld)
  if _G.type(o) == 'string' then
    if fld == 'length' then
      return _G.string.len(o)
    else
      return String.prototype[fld]
    end
  else
    return o[fld]
  end
end
_hx_static_init();
