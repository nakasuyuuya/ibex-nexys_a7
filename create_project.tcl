#mkdir ibex_nexysa7_fpga
create_project ibex_nexysa7 ./ibex_nexysa7_fpga -part xc7a100tcsg324-1

# RTLディレクトリ内のすべてのSystemVerilogファイルを取得
set files [glob ./rtl_source/*.sv]

# すべてのSystemVerilogファイルをプロジェクトに追加
foreach file $files {
    add_files $file
}

# RTLディレクトリ内のすべてのSystemVerilogファイルを取得
set files [glob ./header/*]

# すべてのSystemVerilogファイルをプロジェクトに追加
foreach file $files {
    add_files $file
}

add_files -fileset constrs_1 -norecurse ./constrs/pins_nexysa7.xdc

set_property top top_artya7 [current_fileset]

update_compile_order -fileset sources_1

synth_design -top top_artya7

# 配置・配線の実行
place_design
route_design

# ビットストリームの生成
write_bitstream ./ibex_nexysa7.bit

# プロジェクトの保存と終了
#save_project_as mibex_nexysa7
close_project

# VivadoをTclモードで起動した後の操作

# ハードウェアサーバーへの接続
open_hw_manager
connect_hw_server

# ターゲットデバイスの選択
open_hw_target
current_hw_device [lindex [get_hw_devices] 0]

# ビットストリームファイルの書き込み
set_property PROGRAM.FILE {./ibex_nexysa7.bit} [current_hw_device]
program_hw_devices

# ハードウェア接続の切断
close_hw_target
disconnect_hw_server
close_hw_manager

# Vivadoの終了
exit
