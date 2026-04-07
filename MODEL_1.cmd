! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = MODEL_1
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create variable  &
   variable_name = .MODEL_1.VARIABLE_15  &
   adams_id = 15  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_1.VARIABLE_16  &
   adams_id = 16  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .MODEL_1.VARIABLE_17  &
   adams_id = 17  &
   initial_condition = 0.0  &
   function = ""
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .MODEL_1.steel  &
   adams_id = 3  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
material create  &
   material_name = .MODEL_1.aluminum  &
   adams_id = 4  &
   density = 2.74E-06  &
   youngs_modulus = 7.1705E+04  &
   poissons_ratio = 0.33
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_266  &
   adams_id = 266  &
   location = 8212.9020591338, 1243.1463698381, 2899.4220406683  &
   orientation = 1.2906086767d, 109.2436757595d, 0.1199119126d
!
marker create  &
   marker_name = .MODEL_1.ground.origo  &
   adams_id = 504  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.ground.origo  &
   visibility = off
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_920  &
   adams_id = 920  &
   location = 9261.58, 1457.92, 2164.32  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.ground.MARKER_669  &
   adams_id = 669  &
   location = 9581.053262, 1434.267249, 2329.179974  &
   orientation = 179.992323908d, 165.6644353567d, 182.1132494317d
!
! ****** Points for current part ******
!
point create  &
   point_name = .MODEL_1.ground.POINT_135  &
   location = 9076.58, 1492.78, 2200.17
!
point create  &
   point_name = .MODEL_1.ground.POINT_147  &
   location = 8212.9020591338, 1243.1463698381, 2899.4220406683
!
point create  &
   point_name = .MODEL_1.ground.POINT_166_4  &
   location = 8739.08, 1212.71, 2840.02
!
point create  &
   point_name = .MODEL_1.ground.POINT_166_6  &
   location = 9584.08, 1212.71, 2840.02
!
point create  &
   point_name = .MODEL_1.ground.POINT_166_7  &
   location = 9261.58, 1212.71, 2840.02
!
point create  &
   point_name = .MODEL_1.ground.POINT_166  &
   location = 8716.5832953492, 1201.674623, 2781.046793
!
point create  &
   point_name = .MODEL_1.ground.POINT_167  &
   location = 9261.58, 1159.07, 2795.06
!
point create  &
   point_name = .MODEL_1.ground.POINT_166_2  &
   location = 9606.5832953524, 1206.423014, 2783.315785
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_2  &
   location = 9231.65, 1120.57, 2955.13
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_5  &
   location = 9213.15, 1054.01, 2949.52
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_6  &
   location = 8790.52, 1017.48, 2952.54
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_7  &
   location = 8809.56, 1084.31, 2957.17
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_8  &
   location = 9191.58, 1499.65, 2244.87
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_9  &
   location = 9261.58, 1449.12, 2224.56
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_3  &
   location = 9251.58329535, 1449.118176, 2224.560028
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_4  &
   location = 8751.58329535, 1532.769691, 1620.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_169_3  &
   location = 9181.58, 1532.77, 1620.18
!
point create  &
   point_name = .MODEL_1.ground.POINT_170_3  &
   location = 9181.58, 1465.35, 1639.0
!
point create  &
   point_name = .MODEL_1.ground.POINT_177_4  &
   location = 9261.58, 1492.77, 2200.18
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_10  &
   location = 8715.374478, 1533.936687, 1559.588271
!
point create  &
   point_name = .MODEL_1.ground.POINT_167_11  &
   location = 9606.5832953492, 1532.140676, 1560.178896
!
point create  &
   point_name = .MODEL_1.ground.POINT_168  &
   location = 9571.58329535, 1532.749395, 1620.145111
!
point create  &
   point_name = .MODEL_1.ground.POINT_169  &
   location = 9151.58329535, 1532.769691, 1620.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_166_3  &
   location = 9261.58, 1212.71, 2840.02
!
point create  &
   point_name = .MODEL_1.ground.POINT_170  &
   location = 9163.58329535, 1465.348292, 1639.001047
!
point create  &
   point_name = .MODEL_1.ground.POINT_238  &
   location = 9261.58, 1457.92, 2164.32
!
point create  &
   point_name = .MODEL_1.ground.POINT_176  &
   location = 9038.58329535, 1492.780014, 2200.184901
!
point create  &
   point_name = .MODEL_1.ground.POINT_177  &
   location = 9406.58329535, 1492.769691, 2200.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_177_2  &
   location = 9253.58329535, 1492.769691, 2200.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_177_3  &
   location = 9269.58329535, 1492.769728, 2200.176763
!
point create  &
   point_name = .MODEL_1.ground.POINT_238_4  &
   location = 9261.58, 1459.68, 1979.61
!
point create  &
   point_name = .MODEL_1.ground.POINT_240  &
   location = 9281.58329535, 1457.919386, 2164.32346
!
point create  &
   point_name = .MODEL_1.ground.POINT_240_2  &
   location = 9241.58329535, 1457.919388, 2164.323466
!
point create  &
   point_name = .MODEL_1.ground.POINT_378  &
   location = 9355.681641, 1519.449957, 2006.472643
!
point create  &
   point_name = .MODEL_1.ground.POINT_238_2  &
   location = 9273.58329535, 1459.684549, 1979.614892
!
point create  &
   point_name = .MODEL_1.ground.POINT_238_3  &
   location = 9249.58329535, 1459.684748, 1979.614554
!
point create  &
   point_name = .MODEL_1.ground.POINT_266_3  &
   location = 9216.58, 1522.77, 2020.18
!
point create  &
   point_name = .MODEL_1.ground.POINT_266_4  &
   location = 9193.58329535, 1506.7653, 1994.805737
!
point create  &
   point_name = .MODEL_1.ground.POINT_263_2  &
   location = 9181.58, 1506.76, 1994.81
!
point create  &
   point_name = .MODEL_1.ground.POINT_266  &
   location = 9307.08329535, 1522.769691, 2020.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_266_2  &
   location = 9126.08329535, 1522.769459, 2020.176693
!
point create  &
   point_name = .MODEL_1.ground.POINT_263_5  &
   location = 9218.58, 1472.77, 1920.18
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_3  &
   location = 9181.58, 1520.96, 1906.86
!
point create  &
   point_name = .MODEL_1.ground.POINT_263  &
   location = 9169.58329535, 1506.756867, 1994.807663
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_6  &
   location = 9181.58, 1511.61, 1888.69
!
point create  &
   point_name = .MODEL_1.ground.POINT_263_3  &
   location = 9273.5832953493, 1472.769691, 1920.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_263_4  &
   location = 9163.5832953497, 1472.769691, 1920.176729
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_7  &
   location = 9161.58, 1532.76, 1620.16
!
point create  &
   point_name = .MODEL_1.ground.POINT_282  &
   location = 9171.5832953496, 1520.96349, 1906.859158
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_2  &
   location = 9191.5832953493, 1520.964374, 1906.860128
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_3  &
   location = 9181.58, 1330.92, 2265.62
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_4  &
   location = 9171.5832953496, 1511.613009, 1888.693454
!
point create  &
   point_name = .MODEL_1.ground.POINT_282_5  &
   location = 9191.5832953493, 1511.613005, 1888.693452
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_6  &
   location = 9181.58, 1405.18, 1974.96
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_7  &
   location = 9162.239, 1312.731, 2151.197
!
point create  &
   point_name = .MODEL_1.ground.POINT_302  &
   location = 9163.5832953499, 1330.924232, 2265.621931
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_2  &
   location = 9199.5832953497, 1330.919082, 2265.624655
!
point create  &
   point_name = .MODEL_1.ground.POINT_307  &
   location = 9581.06, 1482.55, 2140.25
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_4  &
   location = 9163.5832953497, 1405.182317, 1974.957628
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_5  &
   location = 9199.5832953497, 1405.180499, 1974.958471
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_8  &
   location = 9581.053262, 1434.267249, 2329.179974
!
point create  &
   point_name = .MODEL_1.ground.POINT_302_9  &
   location = 9581.066199, 1530.831425, 1951.323704
!
! ****** Graphics for current part ******
!
!----------------------------------- suowo2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.suowo2  &
   adams_id = 64  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.suowo2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.suowo2.cm  &
   adams_id = 904  &
   location = 9631.4767516003, 1191.5198302998, 2804.7101981122  &
   orientation = 359.5736649234d, 31.7645399825d, 354.458986397d
!
marker create  &
   marker_name = .MODEL_1.suowo2.MARKER_890  &
   adams_id = 890  &
   location = 9606.5832953524, 1206.423014, 2783.315785  &
   orientation = 89.999999704d, 90.0000001274d, 297.5563438245d
!
marker create  &
   marker_name = .MODEL_1.suowo2.MAR883  &
   adams_id = 883  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.suowo2.MAR883  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.suowo2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.suowo2.SHL358  &
   reference_marker = .MODEL_1.suowo2.MAR883  &
   file_name = "SHL358.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.suowo2  &
   active = off
!
!----------------------------------- yaobi ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.yaobi  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.yaobi
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.yaobi.MAR1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi.cm  &
   adams_id = 208  &
   location = 9261.5826323231, 1195.4949629007, 2825.6013901958  &
   orientation = 180.0053696358d, 50.0167211609d, 89.998009246d
!
marker create  &
   marker_name = .MODEL_1.yaobi.MARKER_881  &
   adams_id = 881  &
   location = 9261.58, 1159.07, 2795.06  &
   orientation = 90.0d, 90.0d, 87.9210943525d
!
marker create  &
   marker_name = .MODEL_1.yaobi.MARKER_564  &
   adams_id = 564  &
   location = 9261.58, 1212.71, 2840.02  &
   orientation = 90.0d, 90.0d, 284.5146372711d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.yaobi  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi.SHL3  &
   reference_marker = .MODEL_1.yaobi.MAR1  &
   file_name = "SHL3.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.yaobi  &
   color = BLUE
!
!---------------------------- xiazhisuohualungan1 -----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.xiazhisuohualungan1  &
   adams_id = 47  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.xiazhisuohualungan1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan1.cm  &
   adams_id = 299  &
   location = 9590.6496925933, 1532.5600284767, 1600.3155365924  &
   orientation = 266.4618446435d, 9.5755461322d, 93.5809513625d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_684  &
   adams_id = 684  &
   location = 9571.58329535, 1532.749395, 1620.145111  &
   orientation = 90.0007795355d, 90.0012746365d, 90.7923013778d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_346  &
   adams_id = 346  &
   location = 9606.5832953492, 1532.140676, 1560.178896  &
   orientation = 270.2104397138d, 90.7867120778d, 108.4359469724d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MAR276  &
   adams_id = 276  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MAR276  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.xiazhisuohualungan1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.xiazhisuohualungan1.SHL146  &
   reference_marker = .MODEL_1.xiazhisuohualungan1.MAR276  &
   file_name = "SHL146.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.xiazhisuohualungan1  &
   active = off  &
   color = GREEN
!
!------------------------------ xiazhisuohualun1 ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.xiazhisuohualun1  &
   adams_id = 46  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.xiazhisuohualun1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun1.cm  &
   adams_id = 298  &
   location = 9616.5833408113, 1532.1414838672, 1560.1799593524  &
   orientation = 179.9980173055d, 24.7710559166d, 180.0030421396d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun1.MARKER_347  &
   adams_id = 347  &
   location = 9606.5832953492, 1532.140676, 1560.178896  &
   orientation = 270.2104397138d, 90.7867120778d, 108.4359469724d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun1.MAR275  &
   adams_id = 275  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.xiazhisuohualun1.MAR275  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.xiazhisuohualun1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.xiazhisuohualun1.SHL144  &
   reference_marker = .MODEL_1.xiazhisuohualun1.MAR275  &
   file_name = "SHL144.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.xiazhisuohualun1  &
   active = off  &
   color = GREEN
!
!---------------------------- jiaolianbizhoucheng -----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.jiaolianbizhoucheng  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.jiaolianbizhoucheng
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.MAR4  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.cm  &
   adams_id = 211  &
   location = 9181.5819925868, 1403.9200782488, 1979.8969848623  &
   orientation = 1.604405782E-02d, 14.3311323488d, 359.6790526008d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_914  &
   adams_id = 914  &
   location = 9181.58, 1405.18, 1974.96  &
   orientation = 1.604405782E-02d, 14.3311323488d, 322.1517821557d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_663  &
   adams_id = 663  &
   location = 9181.58, 1405.18, 1974.96  &
   orientation = 90.0015880756d, 90.0048660673d, 269.3514929499d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.jiaolianbizhoucheng  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.jiaolianbizhoucheng.SHL9  &
   reference_marker = .MODEL_1.jiaolianbizhoucheng.MAR4  &
   file_name = "SHL9.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.jiaolianbizhoucheng  &
   color = Plum
!
!----------------------------------- bush1 ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.bush1  &
   adams_id = 61  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.bush1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.bush1.MARKER_911  &
   adams_id = 911  &
   location = 9581.06, 1482.55, 2140.25  &
   orientation = 179.9926436195d, 165.6644903179d, 171.4143017429d
!
marker create  &
   marker_name = .MODEL_1.bush1.MARKER_667  &
   adams_id = 667  &
   location = 9581.053262, 1434.267249, 2329.179974  &
   orientation = 179.992323908d, 165.6644353567d, 359.99207721d
!
marker create  &
   marker_name = .MODEL_1.bush1.cm  &
   adams_id = 680  &
   location = 9581.0597305, 1482.549337, 2140.251839  &
   orientation = 359.9923239081d, 14.3355646433d, 354.7573427351d
!
marker create  &
   marker_name = .MODEL_1.bush1.MARKER_668  &
   adams_id = 668  &
   location = 9581.053262, 1434.267249, 2329.179974  &
   orientation = 179.992323908d, 165.6644353567d, 182.1132494317d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.bush1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .MODEL_1.bush1.CYLINDER_302  &
   adams_id = 302  &
   center_marker = .MODEL_1.bush1.MARKER_667  &
   angle_extent = 360.0  &
   length = 390.0000013234  &
   radius = 8.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .MODEL_1.bush1  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- suowo1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.suowo1  &
   adams_id = 65  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.suowo1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.suowo1.cm  &
   adams_id = 905  &
   location = 9631.4765263111, 1191.5194205075, 2804.7105666626  &
   orientation = 359.5723683769d, 31.7654978522d, 354.4575520559d
!
marker create  &
   marker_name = .MODEL_1.suowo1.MARKER_889  &
   adams_id = 889  &
   location = 8716.5832953492, 1201.674623, 2781.046793  &
   orientation = 89.9999997078d, 89.9999998651d, 305.5904023276d
!
marker create  &
   marker_name = .MODEL_1.suowo1.MAR885  &
   adams_id = 885  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.suowo1.MAR885  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.suowo1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.suowo1.SHL361  &
   reference_marker = .MODEL_1.suowo1.MAR885  &
   file_name = "SHL361.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.suowo1  &
   active = off
!
!----------------------------------- suowo3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.suowo3  &
   adams_id = 66  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.suowo3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.suowo3.cm  &
   adams_id = 906  &
   location = 8691.5600727989, 1536.2905801522, 1585.3912135351  &
   orientation = 174.8240838081d, 2.7254707662d, 188.4129968405d
!
marker create  &
   marker_name = .MODEL_1.suowo3.MARKER_893  &
   adams_id = 893  &
   location = 8715.374478, 1533.936687, 1559.588271  &
   orientation = 180.0000696984d, 11.7157750481d, 193.464746967d
!
marker create  &
   marker_name = .MODEL_1.suowo3.MAR886  &
   adams_id = 886  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.suowo3.MAR886  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.suowo3  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.suowo3.SHL363  &
   reference_marker = .MODEL_1.suowo3.MAR886  &
   file_name = "SHL363.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.suowo3  &
   active = off
!
!---------------------------------- kuangjia ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.kuangjia  &
   adams_id = 62  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.kuangjia
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.kuangjia.cm  &
   adams_id = 751  &
   location = 8893.82314567, 1335.0763020811, 2447.8377623196  &
   orientation = 219.7857239881d, 158.3161955841d, 133.5831878002d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MAR18  &
   adams_id = 18  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_862  &
   adams_id = 862  &
   location = 9161.58, 1212.71, 2840.02  &
   orientation = 90.0d, 90.0d, 86.6670077709d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_854  &
   adams_id = 854  &
   location = 9191.58, 1499.65, 2244.87  &
   orientation = 90.0874379011d, 90.1524569591d, 288.6454416095d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_856  &
   adams_id = 856  &
   location = 9216.58, 1522.77, 2020.18  &
   orientation = 89.9998043784d, 90.002070803d, 243.667268117d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_734  &
   adams_id = 734  &
   location = 9038.58329535, 1492.780014, 2200.184901  &
   orientation = 89.9999788892d, 90.0224694319d, 89.4932948344d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_858  &
   adams_id = 858  &
   location = 9218.58, 1472.77, 1920.18  &
   orientation = 89.9996781212d, 90.0034073321d, 283.034432215d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_866  &
   adams_id = 866  &
   location = 9571.58329535, 1532.749395, 1620.145111  &
   orientation = 269.9969728986d, 89.9948744217d, 84.3653751001d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_741  &
   adams_id = 741  &
   location = 8877.1442931029, 1641.4377540399, 1883.5144806022  &
   orientation = 90.0172117094d, 89.9802280142d, 87.5887008287d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_909  &
   adams_id = 909  &
   location = 9355.681641, 1519.449957, 2006.472643  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MARKER_864  &
   adams_id = 864  &
   location = 8751.58329535, 1532.769691, 1620.176729  &
   orientation = 90.0000134481d, 89.999988335d, 95.6345601953d
!
marker create  &
   marker_name = .MODEL_1.kuangjia.MAR721  &
   adams_id = 721  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.kuangjia.MAR721  &
   visibility = off
!
! ****** Floating Markers for current part ******
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_1  &
   adams_id = 767
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_4  &
   adams_id = 800
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_5  &
   adams_id = 802
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_6  &
   adams_id = 804
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_7  &
   adams_id = 806
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_8  &
   adams_id = 840
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_11  &
   adams_id = 842
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_12  &
   adams_id = 844
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_13  &
   adams_id = 846
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_14  &
   adams_id = 848
!
floating_marker create  &
   floating_marker_name = .MODEL_1.kuangjia.attach_fl_marker_15  &
   adams_id = 850
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.kuangjia  &
   material_type = .MODEL_1.aluminum
!
! ****** Points for current part ******
!
point create  &
   point_name = .MODEL_1.kuangjia.POINT_378  &
   location = 9355.681641, 1519.449957, 2006.472643
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.kuangjia.SHL344  &
   reference_marker = .MODEL_1.kuangjia.MAR721  &
   file_name = "SHL344.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.kuangjia.SHL33  &
   reference_marker = .MODEL_1.kuangjia.MAR18  &
   file_name = "SHL33.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.kuangjia  &
   color = DkRed
!
!------------------------------ xiatishengyaobi -------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.xiatishengyaobi  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.xiatishengyaobi
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.xiatishengyaobi.cm  &
   adams_id = 215  &
   location = 9227.0324073557, 1513.8176360101, 2014.0108270857  &
   orientation = 261.5286623567d, 85.0500330027d, 56.7063547006d
!
marker create  &
   marker_name = .MODEL_1.xiatishengyaobi.MAR13  &
   adams_id = 13  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_855  &
   adams_id = 855  &
   location = 9216.58, 1522.77, 2020.18  &
   orientation = 89.9998043784d, 90.002070803d, 243.667268117d
!
marker create  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_577  &
   adams_id = 577  &
   location = 9261.58, 1459.68, 1979.61  &
   orientation = 269.9773237439d, 89.9782502817d, 79.634964756d
!
marker create  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_624  &
   adams_id = 624  &
   location = 9181.58, 1506.76, 1994.81  &
   orientation = 270.0149630818d, 90.0111614176d, 81.7063371703d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.xiatishengyaobi  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.xiatishengyaobi.SHL23  &
   reference_marker = .MODEL_1.xiatishengyaobi.MAR13  &
   file_name = "SHL23.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.xiatishengyaobi  &
   color = CornflowerBlue
!
!----------------------------- shangzhisuohualun1 -----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangzhisuohualun1  &
   adams_id = 42  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangzhisuohualun1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun1.cm  &
   adams_id = 294  &
   location = 8706.5832858478, 1201.6746235295, 2781.0467927774  &
   orientation = 359.9999891734d, 0.7334855353d, 1.0535246259E-05d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun1.MARKER_282  &
   adams_id = 282  &
   location = 8716.5832953492, 1201.674623, 2781.046793  &
   orientation = 89.9999997078d, 89.9999998651d, 296.041397744d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun1.MAR269  &
   adams_id = 269  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.shangzhisuohualun1.MAR269  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangzhisuohualun1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangzhisuohualun1.SHL136  &
   reference_marker = .MODEL_1.shangzhisuohualun1.MAR269  &
   file_name = "SHL136.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangzhisuohualun1  &
   active = off  &
   color = GREEN
!
!----------------------------- shangzhisuohualun2 -----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangzhisuohualun2  &
   adams_id = 44  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangzhisuohualun2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun2.MARKER_483  &
   adams_id = 483  &
   location = 9606.5832953524, 1206.423014, 2783.315785  &
   orientation = 89.999999704d, 90.0000001274d, 290.7690940169d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun2.cm  &
   adams_id = 296  &
   location = 9616.5833048522, 1201.6746220305, 2781.0467927774  &
   orientation = 179.999989755d, 0.7334955759d, 180.0000099498d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualun2.MAR273  &
   adams_id = 273  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.shangzhisuohualun2.MAR273  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangzhisuohualun2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangzhisuohualun2.SHL140  &
   reference_marker = .MODEL_1.shangzhisuohualun2.MAR273  &
   file_name = "SHL140.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangzhisuohualun2  &
   active = off  &
   color = GREEN
!
!--------------------------- shangzhisuohualungan1 ----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangzhisuohualungan1  &
   adams_id = 43  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangzhisuohualungan1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan1.cm  &
   adams_id = 295  &
   location = 8732.5160207285, 1209.05600674, 2820.4980688462  &
   orientation = 137.521187692d, 14.2319808443d, 221.5856038241d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_283  &
   adams_id = 283  &
   location = 8716.5832953492, 1201.674623, 2781.046793  &
   orientation = 89.9999997078d, 89.9999998651d, 296.041397744d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_537  &
   adams_id = 537  &
   location = 8739.08, 1212.71, 2840.02  &
   orientation = 269.9997027012d, 90.0001725389d, 87.737321004d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MAR270  &
   adams_id = 270  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MAR270  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangzhisuohualungan1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangzhisuohualungan1.SHL138  &
   reference_marker = .MODEL_1.shangzhisuohualungan1.MAR270  &
   file_name = "SHL138.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangzhisuohualungan1  &
   active = off  &
   color = GREEN
!
!----------------------------- shangtishengyaobi ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangtishengyaobi  &
   adams_id = 15  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangtishengyaobi
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangtishengyaobi.cm  &
   adams_id = 218  &
   location = 9187.915746135, 1457.4126308561, 2250.065824008  &
   orientation = 175.0896410225d, 96.9853820074d, 89.4017763551d
!
marker create  &
   marker_name = .MODEL_1.shangtishengyaobi.MAR17  &
   adams_id = 17  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.shangtishengyaobi.MARKER_659  &
   adams_id = 659  &
   location = 9181.58, 1330.92, 2265.62  &
   orientation = 269.9865266592d, 89.9938523108d, 260.5842566576d
!
marker create  &
   marker_name = .MODEL_1.shangtishengyaobi.MAR27  &
   adams_id = 27  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.shangtishengyaobi.MARKER_853  &
   adams_id = 853  &
   location = 9191.58, 1499.65, 2244.87  &
   orientation = 90.0874379011d, 90.1524569591d, 288.6454416095d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangtishengyaobi  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangtishengyaobi.SHL31  &
   reference_marker = .MODEL_1.shangtishengyaobi.MAR17  &
   file_name = "SHL31.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangtishengyaobi.SHL51  &
   reference_marker = .MODEL_1.shangtishengyaobi.MAR27  &
   file_name = "SHL51.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangtishengyaobi  &
   color = RED
!
!----------------------------------- suowo4 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.suowo4  &
   adams_id = 67  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.suowo4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.suowo4.cm  &
   adams_id = 907  &
   location = 9631.661792523, 1536.2798029882, 1585.3807610393  &
   orientation = 185.1819845742d, 2.7252115599d, 171.5807795905d
!
marker create  &
   marker_name = .MODEL_1.suowo4.MARKER_894  &
   adams_id = 894  &
   location = 9631.661792523, 1536.2798029882, 1585.3807610393  &
   orientation = 185.1819845742d, 2.7252115599d, 153.9786403752d
!
marker create  &
   marker_name = .MODEL_1.suowo4.MAR887  &
   adams_id = 887  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.suowo4.MAR887  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.suowo4  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.suowo4.SHL365  &
   reference_marker = .MODEL_1.suowo4.MAR887  &
   file_name = "SHL365.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.suowo4  &
   active = off
!
!---------------------------------- shanggan ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shanggan  &
   adams_id = 60  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shanggan
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shanggan.MARKER_861  &
   adams_id = 861  &
   location = 9161.58, 1212.71, 2840.02  &
   orientation = 90.0d, 90.0d, 86.6670077709d
!
marker create  &
   marker_name = .MODEL_1.shanggan.MARKER_565  &
   adams_id = 565  &
   location = 9261.58, 1212.71, 2840.02  &
   orientation = 90.0d, 90.0d, 284.5146372711d
!
marker create  &
   marker_name = .MODEL_1.shanggan.cm  &
   adams_id = 549  &
   location = 8799.0857676558, 1212.7086226651, 2840.0304861243  &
   orientation = 269.9997027012d, 90.0001725389d, 94.252554786d
!
marker create  &
   marker_name = .MODEL_1.shanggan.MARKER_538  &
   adams_id = 538  &
   location = 8739.08, 1212.71, 2840.02  &
   orientation = 269.9997027012d, 90.0001725389d, 87.737321004d
!
marker create  &
   marker_name = .MODEL_1.shanggan.MARKER_539  &
   adams_id = 539  &
   location = 9584.08, 1212.71, 2840.02  &
   orientation = 89.8868539988d, 87.6288092826d, 92.2646189952d
!
marker create  &
   marker_name = .MODEL_1.shanggan.MAR532  &
   adams_id = 532  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.shanggan.MAR532  &
   visibility = off
!
! ****** Floating Markers for current part ******
!
floating_marker create  &
   floating_marker_name = .MODEL_1.shanggan.attach_fl_marker_3  &
   adams_id = 548
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shanggan  &
   material_type = .MODEL_1.aluminum
!
! ****** Points for current part ******
!
point create  &
   point_name = .MODEL_1.shanggan.POINT_250  &
   location = 9161.58, 1212.71, 2840.02
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shanggan.SHL205  &
   reference_marker = .MODEL_1.shanggan.MAR532  &
   file_name = "SHL205.shl"  &
   wireframe_only = no
!
!-------------------------------- pingxinggan2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.pingxinggan2  &
   adams_id = 19  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.pingxinggan2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.pingxinggan2.cm  &
   adams_id = 222  &
   location = 9020.6187523398, 1102.4415464153, 2956.1535394184  &
   orientation = 274.9109316507d, 89.724745135d, 48.8734397493d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan2.MARKER_487  &
   adams_id = 487  &
   location = 9231.65, 1120.57, 2955.13  &
   orientation = 5.1728324347d, 41.2718555692d, 354.0264425151d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan2.MAR21  &
   adams_id = 21  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan2.MARKER_727  &
   adams_id = 727  &
   location = 8809.56, 1084.31, 2957.17  &
   orientation = 2.9547964508d, 42.9923853836d, 352.2205646106d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.pingxinggan2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.pingxinggan2.SHL39  &
   reference_marker = .MODEL_1.pingxinggan2.MAR21  &
   file_name = "SHL39.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.pingxinggan2  &
   color = GREEN
!
!-------------------------------- pingxinggan1 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.pingxinggan1  &
   adams_id = 20  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.pingxinggan1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.pingxinggan1.MARKER_485  &
   adams_id = 485  &
   location = 9213.15, 1054.01, 2949.52  &
   orientation = 1.8830874398d, 42.107207194d, 357.3901309673d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan1.cm  &
   adams_id = 223  &
   location = 9001.2487593882, 1037.0287079229, 2949.5776000408  &
   orientation = 274.9109337559d, 89.7247335854d, 48.8680483268d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan1.MAR22  &
   adams_id = 22  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.pingxinggan1.MARKER_868  &
   adams_id = 868  &
   location = 8790.52, 1017.48, 2952.54  &
   orientation = 2.9547964508d, 42.9923853836d, 329.7674676811d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.pingxinggan1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.pingxinggan1.SHL41  &
   reference_marker = .MODEL_1.pingxinggan1.MAR22  &
   file_name = "SHL41.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.pingxinggan1  &
   color = GREEN
!
!---------------------------------- liangan7 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan7  &
   adams_id = 21  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan7
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan7.cm  &
   adams_id = 224  &
   location = 9181.5820678964, 1488.5117024943, 1764.011193465  &
   orientation = 179.9986458968d, 10.4970918699d, 180.0305643467d
!
marker create  &
   marker_name = .MODEL_1.liangan7.MAR23  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan7.MARKER_571  &
   adams_id = 571  &
   location = 9181.58, 1465.35, 1639.0  &
   orientation = 81.9784124398d, 90.2966722711d, 262.4809822526d
!
marker create  &
   marker_name = .MODEL_1.liangan7.MARKER_642  &
   adams_id = 642  &
   location = 9181.58, 1511.61, 1888.69  &
   orientation = 90.0172117094d, 89.9802280142d, 283.7621484858d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan7  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan7.SHL43  &
   reference_marker = .MODEL_1.liangan7.MAR23  &
   file_name = "SHL43.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan7  &
   color = GREEN
!
!---------------------------------- liangan6 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan6  &
   adams_id = 22  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan6
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan6.MAR5  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan6.cm  &
   adams_id = 225  &
   location = 9205.1052779186, 1469.8991507397, 1923.6813988357  &
   orientation = 284.3096558183d, 77.7747920132d, 124.6071790481d
!
marker create  &
   marker_name = .MODEL_1.liangan6.MAR24  &
   adams_id = 24  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan6.MARKER_857  &
   adams_id = 857  &
   location = 9218.58, 1472.77, 1920.18  &
   orientation = 89.9996781212d, 90.0034073321d, 283.034432215d
!
marker create  &
   marker_name = .MODEL_1.liangan6.MARKER_641  &
   adams_id = 641  &
   location = 9181.58, 1520.96, 1906.86  &
   orientation = 269.9799971821d, 90.0048258946d, 251.8702749092d
!
marker create  &
   marker_name = .MODEL_1.liangan6.MARKER_643  &
   adams_id = 643  &
   location = 9181.58, 1511.61, 1888.69  &
   orientation = 90.0172117094d, 89.9802280142d, 283.7621484858d
!
marker create  &
   marker_name = .MODEL_1.liangan6.MARKER_662  &
   adams_id = 662  &
   location = 9181.58, 1405.18, 1974.96  &
   orientation = 90.0015880756d, 90.0048660673d, 269.3514929499d
!
! ****** Floating Markers for current part ******
!
floating_marker create  &
   floating_marker_name = .MODEL_1.liangan6.attach_fl_marker_9  &
   adams_id = 639
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan6  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan6.SHL45  &
   reference_marker = .MODEL_1.liangan6.MAR24  &
   file_name = "SHL45.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan6.SHL11  &
   reference_marker = .MODEL_1.liangan6.MAR5  &
   file_name = "SHL11.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan6  &
   color = GREEN
!
!---------------------------------- liangan5 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan5  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan5.cm  &
   adams_id = 226  &
   location = 9181.5833694117, 1513.8602471199, 1950.8277616682  &
   orientation = 359.9992820338d, 9.1774931532d, 359.9990215288d
!
marker create  &
   marker_name = .MODEL_1.liangan5.MAR25  &
   adams_id = 25  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan5.MARKER_625  &
   adams_id = 625  &
   location = 9181.58, 1506.76, 1994.81  &
   orientation = 270.0149630818d, 90.0111614176d, 81.7063371703d
!
marker create  &
   marker_name = .MODEL_1.liangan5.MARKER_640  &
   adams_id = 640  &
   location = 9181.58, 1520.96, 1906.86  &
   orientation = 269.9799971821d, 90.0048258946d, 251.8702749092d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan5  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan5.SHL47  &
   reference_marker = .MODEL_1.liangan5.MAR25  &
   file_name = "SHL47.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan5  &
   color = GREEN
!
!---------------------------------- liangan4 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan4  &
   adams_id = 24  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan4.cm  &
   adams_id = 196  &
   location = 9261.5831060794, 1458.802092235, 2071.966371836  &
   orientation = 5.7258922241E-03d, 0.5477557753d, 359.9787063477d
!
marker create  &
   marker_name = .MODEL_1.liangan4.MAR26  &
   adams_id = 26  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan4.MARKER_576  &
   adams_id = 576  &
   location = 9261.58, 1457.92, 2164.32  &
   orientation = 270.0017535398d, 89.9900690052d, 98.6567481767d
!
marker create  &
   marker_name = .MODEL_1.liangan4.MARKER_578  &
   adams_id = 578  &
   location = 9261.58, 1459.68, 1979.61  &
   orientation = 269.9773237439d, 89.9782502817d, 79.634964756d
!
marker create  &
   marker_name = .MODEL_1.liangan4.MARKER_916  &
   adams_id = 916  &
   location = 9261.58, 1459.68, 1979.61  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan4  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan4.SHL49  &
   reference_marker = .MODEL_1.liangan4.MAR26  &
   file_name = "SHL49.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan4  &
   color = GREEN
!
!---------------------------------- cangmen -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.cangmen  &
   adams_id = 63  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.cangmen
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.cangmen.cm  &
   adams_id = 752  &
   location = 9165.4300291665, 1448.6548295171, 2227.4123249076  &
   orientation = 180.6684008466d, 165.2956489511d, 90.6006332256d
!
marker create  &
   marker_name = .MODEL_1.cangmen.MARKER_728  &
   adams_id = 728  &
   location = 8809.56, 1084.31, 2957.17  &
   orientation = 2.9547964508d, 42.9923853836d, 352.2205646106d
!
marker create  &
   marker_name = .MODEL_1.cangmen.MARKER_742  &
   adams_id = 742  &
   location = 8877.1442931029, 1641.4377540399, 1883.5144806022  &
   orientation = 90.0172117094d, 89.9802280142d, 87.5887008287d
!
marker create  &
   marker_name = .MODEL_1.cangmen.MARKER_867  &
   adams_id = 867  &
   location = 8790.52, 1017.48, 2952.54  &
   orientation = 2.9547964508d, 42.9923853836d, 329.7674676811d
!
marker create  &
   marker_name = .MODEL_1.cangmen.MAR724  &
   adams_id = 724  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.cangmen.MAR724  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.cangmen  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.cangmen.SHL348  &
   reference_marker = .MODEL_1.cangmen.MAR724  &
   file_name = "SHL348.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.cangmen  &
   color = YELLOW
!
!---------------------------------- liangan2 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan2  &
   adams_id = 26  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan2.cm  &
   adams_id = 228  &
   location = 9261.5827352398, 1376.304599285, 2367.7755767698  &
   orientation = 179.9996866829d, 153.0500922545d, 90.3616053834d
!
marker create  &
   marker_name = .MODEL_1.liangan2.MAR28  &
   adams_id = 28  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan2.MARKER_569  &
   adams_id = 569  &
   location = 9261.58, 1449.12, 2224.56  &
   orientation = 270.0104541951d, 89.9998395189d, 75.0706200408d
!
marker create  &
   marker_name = .MODEL_1.liangan2.MARKER_339  &
   adams_id = 339  &
   location = 9260.6344633326, 1311.1711459539, 2513.4089793399  &
   orientation = 0.3171041429d, 26.9943162323d, 1.3736573286d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan2.SHL53  &
   reference_marker = .MODEL_1.liangan2.MAR28  &
   file_name = "SHL53.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan2  &
   color = GREEN
!
!---------------------------------- liangan1 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.liangan1  &
   adams_id = 27  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.liangan1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.liangan1.cm  &
   adams_id = 229  &
   location = 9261.5827755456, 1231.8761076135, 2651.8419656446  &
   orientation = 180.0002964958d, 153.0500797373d, 89.6055785816d
!
marker create  &
   marker_name = .MODEL_1.liangan1.MAR29  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.liangan1.MARKER_882  &
   adams_id = 882  &
   location = 9261.58, 1159.07, 2795.06  &
   orientation = 90.0d, 90.0d, 87.9210943525d
!
marker create  &
   marker_name = .MODEL_1.liangan1.MARKER_338  &
   adams_id = 338  &
   location = 9260.6344633326, 1311.1711459539, 2513.4089793399  &
   orientation = 0.3171041429d, 26.9943162323d, 1.3736573286d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.liangan1  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.liangan1.SHL55  &
   reference_marker = .MODEL_1.liangan1.MAR29  &
   file_name = "SHL55.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.liangan1  &
   color = GREEN
!
!--------------------------- shangjiaolianbineizhou ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangjiaolianbineizhou  &
   adams_id = 28  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangjiaolianbineizhou
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_658  &
   adams_id = 658  &
   location = 9181.58, 1330.92, 2265.62  &
   orientation = 269.9865266592d, 89.9938523108d, 260.5842566576d
!
marker create  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.cm  &
   adams_id = 230  &
   location = 9181.5819925945, 1329.6619940359, 2270.5612876785  &
   orientation = 1.6043957227E-02d, 14.3311323544d, 359.6790533831d
!
marker create  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.MAR30  &
   adams_id = 30  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_913  &
   adams_id = 913  &
   location = 9181.58, 1330.92, 2265.62  &
   orientation = 1.6043957227E-02d, 14.3311323544d, 347.8412075349d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangjiaolianbineizhou  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangjiaolianbineizhou.SHL57  &
   reference_marker = .MODEL_1.shangjiaolianbineizhou.MAR30  &
   file_name = "SHL57.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangjiaolianbineizhou  &
   color = Plum
!
!--------------------------------- jiaolianbi ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.jiaolianbi  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.jiaolianbi
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.jiaolianbi.cm  &
   adams_id = 231  &
   location = 9437.1059399565, 1359.5060858803, 2108.1745957624  &
   orientation = 96.9759107907d, 87.5350678645d, 14.4393314857d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbi.MAR31  &
   adams_id = 31  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_912  &
   adams_id = 912  &
   location = 9181.58, 1330.92, 2265.62  &
   orientation = 1.6043957227E-02d, 14.3311323544d, 347.8412075349d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_910  &
   adams_id = 910  &
   location = 9581.06, 1482.55, 2140.25  &
   orientation = 179.9926436195d, 165.6644903179d, 171.4143017429d
!
marker create  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_915  &
   adams_id = 915  &
   location = 9181.58, 1405.18, 1974.96  &
   orientation = 1.604405782E-02d, 14.3311323488d, 322.1517821557d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.jiaolianbi  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.jiaolianbi.SHL59  &
   reference_marker = .MODEL_1.jiaolianbi.MAR31  &
   file_name = "SHL59.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.jiaolianbi  &
   color = ClayRed
!
!----------------------------------- mengpi -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.mengpi  &
   adams_id = 30  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.mengpi
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_888  &
   adams_id = 888  &
   location = 8716.5832953492, 1201.674623, 2781.046793  &
   orientation = 89.9999997078d, 89.9999998651d, 305.5904023276d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_486  &
   adams_id = 486  &
   location = 9213.15, 1054.01, 2949.52  &
   orientation = 1.8830874398d, 42.107207194d, 357.3901309673d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_488  &
   adams_id = 488  &
   location = 9231.65, 1120.57, 2955.13  &
   orientation = 5.1728324347d, 41.2718555692d, 354.0264425151d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MAR33  &
   adams_id = 33  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_891  &
   adams_id = 891  &
   location = 9606.5832953524, 1206.423014, 2783.315785  &
   orientation = 89.999999704d, 90.0000001274d, 297.5563438245d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_892  &
   adams_id = 892  &
   location = 8715.374478, 1533.936687, 1559.588271  &
   orientation = 180.0000696984d, 11.7157750481d, 193.464746967d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_265  &
   adams_id = 265  &
   location = 8212.9020591338, 1243.1463698381, 2899.4220406683  &
   orientation = 1.2906086767d, 109.2436757595d, 0.1199119126d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_895  &
   adams_id = 895  &
   location = 9631.661792523, 1536.2798029882, 1585.3807610393  &
   orientation = 185.1819845742d, 2.7252115599d, 153.9786403752d
!
marker create  &
   marker_name = .MODEL_1.mengpi.MARKER_666  &
   adams_id = 666  &
   location = 9162.239, 1312.731, 2151.197  &
   orientation = 270.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.mengpi  &
   mass = 44.527  &
   center_of_mass_marker = .MODEL_1.mengpi.MARKER_666  &
   inertia_marker = .MODEL_1.mengpi.MARKER_666  &
   ixx = 3.2797903826E+07  &
   iyy = 4.7932444721E+07  &
   izz = 2.0873872277E+07  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.mengpi.SHL62  &
   reference_marker = .MODEL_1.mengpi.MAR33  &
   file_name = "SHL62.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.mengpi  &
   color = BLUE_GRAY
!
!----------------------------------- yaobi3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.yaobi3  &
   adams_id = 35  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.yaobi3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_575  &
   adams_id = 575  &
   location = 9261.58, 1457.92, 2164.32  &
   orientation = 270.0017535398d, 89.9900690052d, 98.6567481767d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.cm  &
   adams_id = 235  &
   location = 9114.8377066668, 1464.5014013634, 2073.1345224485  &
   orientation = 281.9564074783d, 136.5232003973d, 198.8863128932d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_733  &
   adams_id = 733  &
   location = 9038.58329535, 1492.780014, 2200.184901  &
   orientation = 89.9999788892d, 90.0224694319d, 89.4932948344d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_908  &
   adams_id = 908  &
   location = 9355.58, 1459.34, 2178.21  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_568  &
   adams_id = 568  &
   location = 9261.58, 1449.12, 2224.56  &
   orientation = 270.0104541951d, 89.9998395189d, 75.0706200408d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MAR198  &
   adams_id = 198  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MAR199  &
   adams_id = 199  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_917  &
   adams_id = 917  &
   location = 9406.58329535, 1492.769691, 2200.176729  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_918  &
   adams_id = 918  &
   location = 9038.58329535, 1492.780014, 2200.184901  &
   orientation = 270.0d, 90.0d, 275.7773099223d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MAR245  &
   adams_id = 245  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MARKER_919  &
   adams_id = 919  &
   location = 9038.58329535, 1492.780014, 2200.184901  &
   orientation = 270.0d, 90.0d, 275.7773099223d
!
marker create  &
   marker_name = .MODEL_1.yaobi3.MAR428  &
   adams_id = 428  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.yaobi3.MAR428  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.yaobi3  &
   material_type = .MODEL_1.aluminum
!
! ****** Points for current part ******
!
point create  &
   point_name = .MODEL_1.yaobi3.POINT_222  &
   location = 9355.58, 1459.34, 2178.21
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi3.SHL121  &
   reference_marker = .MODEL_1.yaobi3.MAR199  &
   file_name = "SHL121.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi3.SHL176  &
   reference_marker = .MODEL_1.yaobi3.MAR428  &
   file_name = "SHL176.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi3.SHL134  &
   reference_marker = .MODEL_1.yaobi3.MAR245  &
   file_name = "SHL134.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi3.SHL119  &
   reference_marker = .MODEL_1.yaobi3.MAR198  &
   file_name = "SHL119.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.yaobi3  &
   color = BLUE_GRAY
!
!--------------------------- shangzhisuohualungan2 ----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.shangzhisuohualungan2  &
   adams_id = 45  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.shangzhisuohualungan2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_484  &
   adams_id = 484  &
   location = 9606.5832953524, 1206.423014, 2783.315785  &
   orientation = 89.999999704d, 90.0000001274d, 290.7690940169d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan2.cm  &
   adams_id = 297  &
   location = 9590.6492570054, 1209.0555422391, 2820.5008317804  &
   orientation = 222.4846486318d, 14.2313198907d, 138.3989825414d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_540  &
   adams_id = 540  &
   location = 9584.08, 1212.71, 2840.02  &
   orientation = 89.8868539988d, 87.6288092826d, 92.2646189952d
!
marker create  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MAR274  &
   adams_id = 274  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MAR274  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.shangzhisuohualungan2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.shangzhisuohualungan2.SHL142  &
   reference_marker = .MODEL_1.shangzhisuohualungan2.MAR274  &
   file_name = "SHL142.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.shangzhisuohualungan2  &
   active = off  &
   color = GREEN
!
!----------------------------------- yaobi4 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.yaobi4  &
   adams_id = 38  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.yaobi4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.yaobi4.cm  &
   adams_id = 237  &
   location = 9162.7892258648, 1531.2890753766, 1620.5893539215  &
   orientation = 269.969410244d, 90.008552799d, 105.5988254283d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MARKER_865  &
   adams_id = 865  &
   location = 9571.58329535, 1532.749395, 1620.145111  &
   orientation = 269.9969728986d, 89.9948744217d, 84.3653751001d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MARKER_863  &
   adams_id = 863  &
   location = 8751.58329535, 1532.769691, 1620.176729  &
   orientation = 90.0000134481d, 89.999988335d, 95.6345601953d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MARKER_682  &
   adams_id = 682  &
   location = 8751.58329535, 1532.769691, 1620.176729  &
   orientation = 90.0000134481d, 89.999988335d, 90.7922384807d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MARKER_683  &
   adams_id = 683  &
   location = 9571.58329535, 1532.749395, 1620.145111  &
   orientation = 90.0007795355d, 90.0012746365d, 90.7923013778d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MARKER_570  &
   adams_id = 570  &
   location = 9181.58, 1465.35, 1639.0  &
   orientation = 81.9784124398d, 90.2966722711d, 262.4809822526d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MAR205  &
   adams_id = 205  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.yaobi4.MAR239  &
   adams_id = 239  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
! ****** Floating Markers for current part ******
!
floating_marker create  &
   floating_marker_name = .MODEL_1.yaobi4.attach_fl_marker_2  &
   adams_id = 527
!
floating_marker create  &
   floating_marker_name = .MODEL_1.yaobi4.attach_fl_marker_10  &
   adams_id = 657
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.yaobi4  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi4.SHL128  &
   reference_marker = .MODEL_1.yaobi4.MAR205  &
   file_name = "SHL128.shl"  &
   wireframe_only = no
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi4.SHL132  &
   reference_marker = .MODEL_1.yaobi4.MAR239  &
   file_name = "SHL132.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.yaobi4  &
   color = BLUE_GRAY
!
!----------------------------------- yaobi5 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.yaobi5  &
   adams_id = 39  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.yaobi5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.yaobi5.cm  &
   adams_id = 238  &
   location = 9431.5834004758, 1541.1913767943, 1616.1374210061  &
   orientation = 179.9964522654d, 115.5703104332d, 89.9968961701d
!
marker create  &
   marker_name = .MODEL_1.yaobi5.MAR206  &
   adams_id = 206  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.yaobi5  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.yaobi5.SHL130  &
   reference_marker = .MODEL_1.yaobi5.MAR206  &
   file_name = "SHL130.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.yaobi5  &
   active = off  &
   color = BLUE_GRAY
!
!------------------------------ xiazhisuohualun2 ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.xiazhisuohualun2  &
   adams_id = 48  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.xiazhisuohualun2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun2.cm  &
   adams_id = 300  &
   location = 8706.5832866425, 1532.1414432848, 1560.1800162774  &
   orientation = 1.1029020958E-05d, 78.2842249519d, 1.1913214016E-05d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun2.MARKER_341  &
   adams_id = 341  &
   location = 8715.374478, 1533.936687, 1559.588271  &
   orientation = 90.0000133582d, 89.9999882226d, 254.5969366635d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualun2.MAR277  &
   adams_id = 277  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.xiazhisuohualun2.MAR277  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.xiazhisuohualun2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.xiazhisuohualun2.SHL148  &
   reference_marker = .MODEL_1.xiazhisuohualun2.MAR277  &
   file_name = "SHL148.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.xiazhisuohualun2  &
   active = off  &
   color = GREEN
!
!---------------------------- xiazhisuohualungan2 -----------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.xiazhisuohualungan2  &
   adams_id = 49  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.xiazhisuohualungan2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan2.cm  &
   adams_id = 301  &
   location = 8732.5146677792, 1532.5603662474, 1600.3094535619  &
   orientation = 93.5389021442d, 9.5739964288d, 266.4156209443d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_340  &
   adams_id = 340  &
   location = 8715.374478, 1533.936687, 1559.588271  &
   orientation = 90.0000133582d, 89.9999882226d, 254.5969366635d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_681  &
   adams_id = 681  &
   location = 8751.58329535, 1532.769691, 1620.176729  &
   orientation = 90.0000134481d, 89.999988335d, 90.7922384807d
!
marker create  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MAR281  &
   adams_id = 281  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MAR281  &
   visibility = off
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.xiazhisuohualungan2  &
   material_type = .MODEL_1.aluminum
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .MODEL_1.xiazhisuohualungan2.SHL150  &
   reference_marker = .MODEL_1.xiazhisuohualungan2.MAR281  &
   file_name = "SHL150.shl"  &
   wireframe_only = no
!
part attributes  &
   part_name = .MODEL_1.xiazhisuohualungan2  &
   active = off  &
   color = GREEN
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .MODEL_1.CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = .MODEL_1.shangzhisuohualun1.SHL136  &
   j_geometry_name = .MODEL_1.suowo1.SHL361  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 0.3  &
   mu_dynamic = 0.1  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
force attributes  &
   force_name = .MODEL_1.CONTACT_1  &
   active = off
!
contact create  &
   contact_name = .MODEL_1.CONTACT_2  &
   adams_id = 2  &
   type = solid_to_solid  &
   i_geometry_name = .MODEL_1.shangzhisuohualun2.SHL140  &
   j_geometry_name = .MODEL_1.suowo2.SHL358  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 0.3  &
   mu_dynamic = 0.1  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
force attributes  &
   force_name = .MODEL_1.CONTACT_2  &
   active = off
!
contact create  &
   contact_name = .MODEL_1.CONTACT_3  &
   adams_id = 3  &
   type = solid_to_solid  &
   i_geometry_name = .MODEL_1.xiazhisuohualun2.SHL148  &
   j_geometry_name = .MODEL_1.suowo3.SHL363  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 0.3  &
   mu_dynamic = 0.1  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
force attributes  &
   force_name = .MODEL_1.CONTACT_3  &
   active = off
!
contact create  &
   contact_name = .MODEL_1.CONTACT_4  &
   adams_id = 4  &
   type = solid_to_solid  &
   i_geometry_name = .MODEL_1.xiazhisuohualun1.SHL144  &
   j_geometry_name = .MODEL_1.suowo4.SHL365  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 0.3  &
   mu_dynamic = 0.1  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
force attributes  &
   force_name = .MODEL_1.CONTACT_4  &
   active = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_92  &
   adams_id = 92  &
   i_marker_name = .MODEL_1.cangmen.MARKER_867  &
   j_marker_name = .MODEL_1.pingxinggan1.MARKER_868
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_92  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_53  &
   adams_id = 53  &
   i_marker_name = .MODEL_1.shangzhisuohualun2.MARKER_483  &
   j_marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_484
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_53  &
   active = off  &
   name_visibility = off
!
constraint create joint spherical  &
   joint_name = .MODEL_1.JOINT_54  &
   adams_id = 54  &
   i_marker_name = .MODEL_1.pingxinggan1.MARKER_485  &
   j_marker_name = .MODEL_1.mengpi.MARKER_486
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_54  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_96  &
   adams_id = 96  &
   i_marker_name = .MODEL_1.mengpi.MARKER_888  &
   j_marker_name = .MODEL_1.suowo1.MARKER_889
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_96  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_97  &
   adams_id = 97  &
   i_marker_name = .MODEL_1.suowo2.MARKER_890  &
   j_marker_name = .MODEL_1.mengpi.MARKER_891
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_97  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_10  &
   adams_id = 10  &
   i_marker_name = .MODEL_1.mengpi.MARKER_265  &
   j_marker_name = .MODEL_1.ground.MARKER_266
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_10  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_13  &
   adams_id = 13  &
   i_marker_name = .MODEL_1.shangzhisuohualun1.MARKER_282  &
   j_marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_283
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_13  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_62  &
   adams_id = 62  &
   i_marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_537  &
   j_marker_name = .MODEL_1.shanggan.MARKER_538
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_62  &
   active = off  &
   name_visibility = off
!
constraint create joint spherical  &
   joint_name = .MODEL_1.JOINT_55  &
   adams_id = 55  &
   i_marker_name = .MODEL_1.pingxinggan2.MARKER_487  &
   j_marker_name = .MODEL_1.mengpi.MARKER_488
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_55  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_63  &
   adams_id = 63  &
   i_marker_name = .MODEL_1.shanggan.MARKER_539  &
   j_marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_540
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_63  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_83  &
   adams_id = 83  &
   i_marker_name = .MODEL_1.pingxinggan2.MARKER_727  &
   j_marker_name = .MODEL_1.cangmen.MARKER_728
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_83  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_65  &
   adams_id = 65  &
   i_marker_name = .MODEL_1.yaobi.MARKER_564  &
   j_marker_name = .MODEL_1.shanggan.MARKER_565
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_65  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_95  &
   adams_id = 95  &
   i_marker_name = .MODEL_1.yaobi.MARKER_881  &
   j_marker_name = .MODEL_1.liangan1.MARKER_882
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_95  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_98  &
   adams_id = 98  &
   i_marker_name = .MODEL_1.mengpi.MARKER_892  &
   j_marker_name = .MODEL_1.suowo3.MARKER_893
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_98  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_99  &
   adams_id = 99  &
   i_marker_name = .MODEL_1.suowo4.MARKER_894  &
   j_marker_name = .MODEL_1.mengpi.MARKER_895
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_99  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_100  &
   adams_id = 100  &
   i_marker_name = .MODEL_1.jiaolianbi.MARKER_910  &
   j_marker_name = .MODEL_1.bush1.MARKER_911
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_100  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_67  &
   adams_id = 67  &
   i_marker_name = .MODEL_1.yaobi3.MARKER_568  &
   j_marker_name = .MODEL_1.liangan2.MARKER_569
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_67  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_68  &
   adams_id = 68  &
   i_marker_name = .MODEL_1.yaobi4.MARKER_570  &
   j_marker_name = .MODEL_1.liangan7.MARKER_571
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_68  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_86  &
   adams_id = 86  &
   i_marker_name = .MODEL_1.yaobi3.MARKER_733  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_734
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_86  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_69  &
   adams_id = 69  &
   i_marker_name = .MODEL_1.yaobi3.MARKER_575  &
   j_marker_name = .MODEL_1.liangan4.MARKER_576
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_69  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_28  &
   adams_id = 28  &
   i_marker_name = .MODEL_1.liangan1.MARKER_338  &
   j_marker_name = .MODEL_1.liangan2.MARKER_339
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_28  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_29  &
   adams_id = 29  &
   i_marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_340  &
   j_marker_name = .MODEL_1.xiazhisuohualun2.MARKER_341
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_29  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_79  &
   adams_id = 79  &
   i_marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_681  &
   j_marker_name = .MODEL_1.yaobi4.MARKER_682
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_79  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_80  &
   adams_id = 80  &
   i_marker_name = .MODEL_1.yaobi4.MARKER_683  &
   j_marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_684
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_80  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_32  &
   adams_id = 32  &
   i_marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_346  &
   j_marker_name = .MODEL_1.xiazhisuohualun1.MARKER_347
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_32  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_70  &
   adams_id = 70  &
   i_marker_name = .MODEL_1.xiatishengyaobi.MARKER_577  &
   j_marker_name = .MODEL_1.liangan4.MARKER_578
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_70  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_71  &
   adams_id = 71  &
   i_marker_name = .MODEL_1.xiatishengyaobi.MARKER_624  &
   j_marker_name = .MODEL_1.liangan5.MARKER_625
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_71  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_72  &
   adams_id = 72  &
   i_marker_name = .MODEL_1.liangan5.MARKER_640  &
   j_marker_name = .MODEL_1.liangan6.MARKER_641
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_72  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_73  &
   adams_id = 73  &
   i_marker_name = .MODEL_1.liangan7.MARKER_642  &
   j_marker_name = .MODEL_1.liangan6.MARKER_643
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_73  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_74  &
   adams_id = 74  &
   i_marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_658  &
   j_marker_name = .MODEL_1.shangtishengyaobi.MARKER_659
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_74  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .MODEL_1.JOINT_76  &
   adams_id = 76  &
   i_marker_name = .MODEL_1.liangan6.MARKER_662  &
   j_marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_663
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_76  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_78  &
   adams_id = 78  &
   i_marker_name = .MODEL_1.bush1.MARKER_668  &
   j_marker_name = .MODEL_1.ground.MARKER_669
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_78  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .MODEL_1.JOINT_90  &
   adams_id = 90  &
   i_marker_name = .MODEL_1.kuangjia.MARKER_741  &
   j_marker_name = .MODEL_1.cangmen.MARKER_742
!
constraint attributes  &
   constraint_name = .MODEL_1.JOINT_90  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_6  &
   adams_id = 6  &
   i_marker_name = .MODEL_1.shanggan.MARKER_861  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_862  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_2  &
   adams_id = 2  &
   i_marker_name = .MODEL_1.shangtishengyaobi.MARKER_853  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_854  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_3  &
   adams_id = 3  &
   i_marker_name = .MODEL_1.xiatishengyaobi.MARKER_855  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_856  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_4  &
   adams_id = 4  &
   i_marker_name = .MODEL_1.liangan6.MARKER_857  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_858  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_8  &
   adams_id = 8  &
   i_marker_name = .MODEL_1.yaobi4.MARKER_865  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_866  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_7  &
   adams_id = 7  &
   i_marker_name = .MODEL_1.yaobi4.MARKER_863  &
   j_marker_name = .MODEL_1.kuangjia.MARKER_864  &
   damping = 0.0, 0.0, 0.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 1.0E+07, 1.0E+07, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_9  &
   adams_id = 9  &
   i_marker_name = .MODEL_1.jiaolianbi.MARKER_912  &
   j_marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_913  &
   damping = 2.0, 2.0, 2.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 10.0, 10.0, 10.0  &
   tstiffness = 1.0E+04, 1.0E+04, 1.0E+04  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_10  &
   adams_id = 10  &
   i_marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_914  &
   j_marker_name = .MODEL_1.jiaolianbi.MARKER_915  &
   damping = 2.0, 2.0, 2.0  &
   stiffness = 1.0E+07, 1.0E+07, 1.0E+07  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 10.0, 10.0, 10.0  &
   tstiffness = 1.0E+04, 1.0E+04, 1.0E+04  &
   torque_preload = 0.0, 0.0, 0.0
!
force create direct single_component_force  &
   single_component_force_name = .MODEL_1.SFORCE_2  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   i_marker_name = .MODEL_1.yaobi3.MARKER_918  &
   j_marker_name = .MODEL_1.yaobi3.MARKER_919  &
   action_only = on  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .MODEL_1.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=4.0 number_of_steps=1000 model_name=.MODEL_1"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .MODEL_1.SPRING_1  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .MODEL_1.SPRING_1  &
   color = RED
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.i_marker  &
   object_value = (.MODEL_1.yaobi3.MARKER_908)
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.j_marker  &
   object_value = (.MODEL_1.kuangjia.MARKER_909)
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.stiffness_coefficient  &
   real_value = (1.8E-04(newton/mm))
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.damping_coefficient  &
   real_value = (9.0E-02(newton-sec/mm))
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.free_length_mode  &
   string_value = "Design_Length"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.preload  &
   real_value = 1400.0
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.i_dynamic_visibility  &
   string_value = "On"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.spring_visibility  &
   string_value = "depends"
!
variable modify  &
   variable_name = .MODEL_1.SPRING_1.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .MODEL_1.SPRING_1
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_6_force_graphic_1  &
   adams_id = 350  &
   force_element_name = .MODEL_1.BUSHING_6  &
   applied_at_marker_name = .MODEL_1.shanggan.MARKER_861
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_2_force_graphic_1  &
   adams_id = 351  &
   force_element_name = .MODEL_1.BUSHING_2  &
   applied_at_marker_name = .MODEL_1.shangtishengyaobi.MARKER_853
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_3_force_graphic_1  &
   adams_id = 352  &
   force_element_name = .MODEL_1.BUSHING_3  &
   applied_at_marker_name = .MODEL_1.xiatishengyaobi.MARKER_855
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_4_force_graphic_1  &
   adams_id = 353  &
   force_element_name = .MODEL_1.BUSHING_4  &
   applied_at_marker_name = .MODEL_1.liangan6.MARKER_857
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_8_force_graphic_1  &
   adams_id = 356  &
   force_element_name = .MODEL_1.BUSHING_8  &
   applied_at_marker_name = .MODEL_1.yaobi4.MARKER_865
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_7_force_graphic_1  &
   adams_id = 355  &
   force_element_name = .MODEL_1.BUSHING_7  &
   applied_at_marker_name = .MODEL_1.yaobi4.MARKER_863
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_9_force_graphic_1  &
   adams_id = 382  &
   force_element_name = .MODEL_1.BUSHING_9  &
   applied_at_marker_name = .MODEL_1.jiaolianbi.MARKER_912
!
geometry create shape force  &
   force_name = .MODEL_1.BUSHING_10_force_graphic_1  &
   adams_id = 383  &
   force_element_name = .MODEL_1.BUSHING_10  &
   applied_at_marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_914
!
geometry create shape force  &
   force_name = .MODEL_1.SFORCE_2_force_graphic_1  &
   adams_id = 384  &
   force_element_name = .MODEL_1.SFORCE_2  &
   applied_at_marker_name = .MODEL_1.yaobi3.MARKER_918
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_1.GCONTACT_368  &
   adams_id = 368  &
   contact_element_name = .MODEL_1.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_1.GCONTACT_368  &
   active = off  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_1.GCONTACT_371  &
   adams_id = 371  &
   contact_element_name = .MODEL_1.CONTACT_2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_1.GCONTACT_371  &
   active = off  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_1.GCONTACT_374  &
   adams_id = 374  &
   contact_element_name = .MODEL_1.CONTACT_3  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_1.GCONTACT_374  &
   active = off  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .MODEL_1.GCONTACT_377  &
   adams_id = 377  &
   contact_element_name = .MODEL_1.CONTACT_4  &
   force_display = components
!
geometry attributes  &
   geometry_name = .MODEL_1.GCONTACT_377  &
   active = off  &
   color = RED
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .MODEL_1.MOTION_2  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   joint_name = .MODEL_1.JOINT_100  &
   function = ""
!
constraint attributes  &
   constraint_name = .MODEL_1.MOTION_2  &
   active = off  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = ACCGRAV_1  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = -9806.65
!
!----------------------------- Analysis settings ------------------------------!
!
!
executive_control set numerical_integration_parameters  &
   model_name = MODEL_1  &
   integrator_type = hht  &
   error_tolerance = 1.0E-05  &
   pattern_for_jacobian = no  &
   hinit_time_step = 1.0E-03  &
   hmin_time_step = 1.0E-06  &
   hmax_time_step = 5.0E-03  &
   scale = 1.0, 1.0, 1.0E-03
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .MODEL_1.JOINT_86_MEA_1  &
   from_first = yes  &
   object = .MODEL_1.JOINT_86  &
   characteristic = element_force  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.JOINT_86_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.JOINT_100_MEA_1  &
   from_first = yes  &
   object = .MODEL_1.JOINT_100  &
   characteristic = translational_displacement  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.JOINT_100_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.JOINT_100_MEA_2  &
   from_first = yes  &
   object = .MODEL_1.JOINT_100  &
   characteristic = angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.JOINT_100_MEA_2  &
   color = WHITE
!
measure create object  &
   measure_name = .MODEL_1.JOINT_100_MEA_3  &
   from_first = yes  &
   object = .MODEL_1.JOINT_100  &
   characteristic = angular_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.JOINT_100_MEA_3  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_1.L_LINK1  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.L_LINK1  &
   color = WHITE
!
measure create function  &
   measure_name = .MODEL_1.ERROR_LINK1  &
   function = ""  &
   units = "no_units"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .MODEL_1.ERROR_LINK1  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .MODEL_1.wizard_state  &
   integer_value = 1
!
variable create  &
   variable_name = .MODEL_1.d1  &
   integer_value = 1
!
variable create  &
   variable_name = .MODEL_1.subsystem_modified  &
   integer_value = 1
!
variable create  &
   variable_name = .MODEL_1.DV_LINK1_LENGTH  &
   units = "no_units"  &
   range = -10.0, 10.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 184.7183848457
!
variable create  &
   variable_name = .MODEL_1.DV_2  &
   range = -10.0, 10.0  &
   delta_type = percent_relative  &
   real_value = 1457.92
!
variable create  &
   variable_name = .MODEL_1.DV_3  &
   range = -10.0, 10.0  &
   delta_type = percent_relative  &
   real_value = 2164.32
!
variable create  &
   variable_name = .MODEL_1.DV_1  &
   range = -10.0, 10.0  &
   delta_type = percent_relative  &
   real_value = 9261.58
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .MODEL_1.MOTION_2  &
   function = "STEP(time,10,0,15,70d) + STEP(time,15,0,20,-70d)"
!
data_element modify variable  &
   variable_name = .MODEL_1.VARIABLE_15  &
   function = ".MODEL_1.JOINT_100_MEA_2"
!
data_element modify variable  &
   variable_name = .MODEL_1.VARIABLE_16  &
   function = ".MODEL_1.JOINT_100_MEA_3"
!
data_element modify variable  &
   variable_name = .MODEL_1.VARIABLE_17  &
   function = ".MODEL_1.JOINT_100_MEA_2"
!
measure modify function  &
   measure_name = .MODEL_1.L_LINK1  &
   function = "DM(.MODEL_1.liangan4.MARKER_576, .MODEL_1.liangan4.MARKER_578)"
!
measure modify function  &
   measure_name = .MODEL_1.ERROR_LINK1  &
   function = "DM(.MODEL_1.liangan4.MARKER_576, .MODEL_1.liangan4.MARKER_578) - .MODEL_1.DV_LINK1_LENGTH"
!
force modify direct single_component_force  &
   single_component_force_name = .MODEL_1.SFORCE_2  &
   function = "STEP(time,0,0,6,3.582e+09)"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .MODEL_1.SPRING_1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .MODEL_1.ground.MARKER_266  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_147))
!
point modify  &
   point_name = .MODEL_1.ground.POINT_238  &
   location =   &
      (.MODEL_1.DV_1),  &
      (.MODEL_1.DV_2),  &
      (.MODEL_1.DV_3)
!
marker modify  &
   marker_name = .MODEL_1.ground.MARKER_669  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_8))
!
marker modify  &
   marker_name = .MODEL_1.ground.MARKER_920  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_238))
!
marker modify  &
   marker_name = .MODEL_1.yaobi.MARKER_564  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_7))  &
   relative_to = .MODEL_1.yaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi.MARKER_881  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167))  &
   relative_to = .MODEL_1.yaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_663  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_6))  &
   relative_to = .MODEL_1.jiaolianbizhoucheng
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.jiaolianbizhoucheng.MARKER_914  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_6))  &
   relative_to = .MODEL_1.jiaolianbizhoucheng
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_577  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_238_4))  &
   relative_to = .MODEL_1.xiatishengyaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_624  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_263_2))  &
   relative_to = .MODEL_1.xiatishengyaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiatishengyaobi.MARKER_855  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_266_3))  &
   relative_to = .MODEL_1.xiatishengyaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangtishengyaobi.MARKER_659  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_3))  &
   relative_to = .MODEL_1.shangtishengyaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangtishengyaobi.MARKER_853  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_8))  &
   relative_to = .MODEL_1.shangtishengyaobi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.pingxinggan2.MARKER_487  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_2))  &
   relative_to = .MODEL_1.pingxinggan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.pingxinggan2.MARKER_727  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_7))  &
   relative_to = .MODEL_1.pingxinggan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.pingxinggan1.MARKER_485  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_5))  &
   relative_to = .MODEL_1.pingxinggan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.pingxinggan1.MARKER_868  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_6))  &
   relative_to = .MODEL_1.pingxinggan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan7.MARKER_571  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_170_3))  &
   relative_to = .MODEL_1.liangan7
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan7.MARKER_642  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_282_6))  &
   relative_to = .MODEL_1.liangan7
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan6.MARKER_641  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_282_3))  &
   relative_to = .MODEL_1.liangan6
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan6.MARKER_643  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_282_6))  &
   relative_to = .MODEL_1.liangan6
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan6.MARKER_662  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_6))  &
   relative_to = .MODEL_1.liangan6
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan6.MARKER_857  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_263_5))  &
   relative_to = .MODEL_1.liangan6
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan5.MARKER_625  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_263_2))  &
   relative_to = .MODEL_1.liangan5
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan5.MARKER_640  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_282_3))  &
   relative_to = .MODEL_1.liangan5
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan4.MARKER_576  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_238))  &
   relative_to = .MODEL_1.liangan4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan4.MARKER_578  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_238_4))  &
   relative_to = .MODEL_1.liangan4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan4.MARKER_916  &
   location =   &
      (LOC_ALONG_LINE(.MODEL_1.liangan4.MARKER_576, .MODEL_1.liangan4.MARKER_578, .MODEL_1.DV_LINK1_LENGTH))  &
   relative_to = .MODEL_1.liangan4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan2.MARKER_569  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_9))  &
   relative_to = .MODEL_1.liangan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.liangan1.MARKER_882  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167))  &
   relative_to = .MODEL_1.liangan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_658  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_3))  &
   relative_to = .MODEL_1.shangjiaolianbineizhou
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangjiaolianbineizhou.MARKER_913  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_3))  &
   relative_to = .MODEL_1.shangjiaolianbineizhou
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_910  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_307))  &
   relative_to = .MODEL_1.jiaolianbi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_912  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_3))  &
   relative_to = .MODEL_1.jiaolianbi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.jiaolianbi.MARKER_915  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_6))  &
   relative_to = .MODEL_1.jiaolianbi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_265  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_147))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_486  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_5))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_488  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_2))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_666  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_7))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_888  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_891  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_2))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.mengpi.MARKER_892  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_10))  &
   relative_to = .MODEL_1.mengpi
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_568  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_9))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_575  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_238))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_733  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_176))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_908  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.yaobi3.POINT_222))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_917  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_177))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_918  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_176))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi3.MARKER_919  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_176))  &
   relative_to = .MODEL_1.yaobi3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi4.MARKER_570  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_170_3))  &
   relative_to = .MODEL_1.yaobi4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi4.MARKER_682  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_4))  &
   relative_to = .MODEL_1.yaobi4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi4.MARKER_683  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_168))  &
   relative_to = .MODEL_1.yaobi4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi4.MARKER_863  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_4))  &
   relative_to = .MODEL_1.yaobi4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.yaobi4.MARKER_865  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_168))  &
   relative_to = .MODEL_1.yaobi4
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualun1.MARKER_282  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166))  &
   relative_to = .MODEL_1.shangzhisuohualun1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_283  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166))  &
   relative_to = .MODEL_1.shangzhisuohualungan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualungan1.MARKER_537  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_4))  &
   relative_to = .MODEL_1.shangzhisuohualungan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualun2.MARKER_483  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_2))  &
   relative_to = .MODEL_1.shangzhisuohualun2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_484  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_2))  &
   relative_to = .MODEL_1.shangzhisuohualungan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shangzhisuohualungan2.MARKER_540  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_6))  &
   relative_to = .MODEL_1.shangzhisuohualungan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualun1.MARKER_347  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_11))  &
   relative_to = .MODEL_1.xiazhisuohualun1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_346  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_11))  &
   relative_to = .MODEL_1.xiazhisuohualungan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualungan1.MARKER_684  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_168))  &
   relative_to = .MODEL_1.xiazhisuohualungan1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualun2.MARKER_341  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_10))  &
   relative_to = .MODEL_1.xiazhisuohualun2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_340  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_10))  &
   relative_to = .MODEL_1.xiazhisuohualungan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.xiazhisuohualungan2.MARKER_681  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_4))  &
   relative_to = .MODEL_1.xiazhisuohualungan2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shanggan.MARKER_538  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_4))  &
   relative_to = .MODEL_1.shanggan
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shanggan.MARKER_539  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_6))  &
   relative_to = .MODEL_1.shanggan
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shanggan.MARKER_565  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_7))  &
   relative_to = .MODEL_1.shanggan
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.shanggan.MARKER_861  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.shanggan.POINT_250))  &
   relative_to = .MODEL_1.shanggan
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.bush1.MARKER_667  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_8))  &
   orientation =   &
      (ORI_ALONG_AXIS(.MODEL_1.ground.POINT_302_8, .MODEL_1.ground.POINT_302_9, "Z"))  &
   relative_to = .MODEL_1.bush1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
geometry modify shape cylinder  &
   cylinder_name = .MODEL_1.bush1.CYLINDER_302  &
   length = (390.0000013234mm)  &
   radius = (8.0mm)
!
marker modify  &
   marker_name = .MODEL_1.bush1.MARKER_668  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_302_8))  &
   relative_to = .MODEL_1.bush1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.bush1.MARKER_911  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_307))  &
   relative_to = .MODEL_1.bush1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
material modify  &
   material_name = .MODEL_1.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_734  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_176))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_854  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_8))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_856  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_266_3))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_858  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_263_5))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_862  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.shanggan.POINT_250))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_864  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_4))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_866  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_168))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
point modify  &
   point_name = .MODEL_1.kuangjia.POINT_378  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_378))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.kuangjia.MARKER_909  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.kuangjia.POINT_378))  &
   relative_to = .MODEL_1.kuangjia
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.cangmen.MARKER_728  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_7))  &
   relative_to = .MODEL_1.cangmen
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.cangmen.MARKER_867  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_6))  &
   relative_to = .MODEL_1.cangmen
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_2  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_2_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_2.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_3  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_3_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_3.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_4  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_4_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_4.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_6  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_6_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_6.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_7  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_7_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_7.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_8  &
   damping =   &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm)),  &
      (0(newton-sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg)),  &
      (0(newton-mm-sec/deg))  &
   tstiffness =   &
      (1.0E+07(newton-mm/deg)),  &
      (1.0E+07(newton-mm/deg)),  &
      (0(newton-mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_8_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_8.i)
!
marker modify  &
   marker_name = .MODEL_1.suowo2.MARKER_890  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166_2))  &
   relative_to = .MODEL_1.suowo2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.suowo1.MARKER_889  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_166))  &
   relative_to = .MODEL_1.suowo1
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
marker modify  &
   marker_name = .MODEL_1.suowo3.MARKER_893  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .MODEL_1.ground.POINT_167_10))  &
   relative_to = .MODEL_1.suowo3
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
material modify  &
   material_name = .MODEL_1.aluminum  &
   density = (2740.0(kg/meter**3))  &
   youngs_modulus = (7.1705E+10(Newton/meter**2))
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_9  &
   damping =   &
      (2(newton*sec/mm)),  &
      (2(newton*sec/mm)),  &
      (2(newton*sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (10(newton*mm*sec/deg)),  &
      (10(newton*mm*sec/deg)),  &
      (10(newton*mm*sec/deg))  &
   tstiffness =   &
      (10000(newton*mm/deg)),  &
      (10000(newton*mm/deg)),  &
      (10000(newton*mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_9_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_9.i)
!
force modify element_like bushing  &
   bushing_name = .MODEL_1.BUSHING_10  &
   damping =   &
      (2(newton*sec/mm)),  &
      (2(newton*sec/mm)),  &
      (2(newton*sec/mm))  &
   stiffness =   &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm)),  &
      (1.0E+07(newton/mm))  &
   tdamping =   &
      (10(newton*mm*sec/deg)),  &
      (10(newton*mm*sec/deg)),  &
      (10(newton*mm*sec/deg))  &
   tstiffness =   &
      (10000(newton*mm/deg)),  &
      (10000(newton*mm/deg)),  &
      (10000(newton*mm/deg))
!
geometry modify shape force  &
   force_name = .MODEL_1.BUSHING_10_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.BUSHING_10.i)
!
variable modify  &
   variable_name = .MODEL_1.DV_LINK1_LENGTH  &
   range =   &
      (-10.0mm),  &
      (10.0mm)  &
   real_value = (184.7183848457mm)
!
geometry modify shape force  &
   force_name = .MODEL_1.SFORCE_2_force_graphic_1  &
   applied_at_marker_name = (.MODEL_1.SFORCE_2.i)
!
model display  &
   model_name = MODEL_1
