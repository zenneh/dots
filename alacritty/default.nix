{ pkgs, inputs, ... } : {
 programs.alacritty = {
  enable = true;
  settings = {
   # Window config
   window.padding = {
     x = 8;
     y = 8;
   };
   window.opacity = 0.60;

   # Font config
   font.normal = { 
    family = "Fira Code"; 
    style = "Regular";
   };

   # Keybinds
   keyboard.bindings = [
     {
       key = "K";
       mods = "Control";
       chars = "\\x0c";
     }
   ];
  };
 };
}
