#Entrega #3
Prueba_PHYTX/RX:
	sed -i '75 s/posedge clk_4f/*/g' SerialParalelo_PhyRX.v
	yosys -s sintesis_rx.ys
	sed -i '75 s/*/posedge clk_4f/g' SerialParalelo_PhyRX.v
	sed -i 's/cond/synth/g' Phy_Rx_synth.v
	sed -i 's/DeMux2x1/DeMux2x1_synth/g' Phy_Rx_synth.v
	sed -i 's/DeMuxL1/DeMuxL1_synth/g' Phy_Rx_synth.v
	sed -i 's/DeMuxL2/DeMuxL2_synth/g' Phy_Rx_synth.v
	sed -i 's/Mux2x1/Mux2x1_synth/g' Phy_Rx_synth.v
	sed -i 's/MuxL1/MuxL1_synth/g' Phy_Rx_synth.v
	sed -i 's/MuxL2/MuxL2_synth/g' Phy_Rx_synth.v
	sed -i 's/ParaleloSerial_PhyRX/ParaleloSerial_PhyRX_synth/g' Phy_Rx_synth.v
	sed -i 's/ParaleloSerial_PhyTX/ParaleloSerial_PhyTX_synth/g' Phy_Rx_synth.v
	sed -i 's/Phy_Rx/Phy_Rx_synth/g' Phy_Rx_synth.v
	sed -i 's/Phy_Tx/Phy_Tx_synth/g' Phy_Rx_synth.v
	sed -i 's/Recirculador/Recirculador_synth/g' Phy_Rx_synth.v
	sed -i 's/SerialParalelo_PhyRX/SerialParalelo_PhyRX_synth/g' Phy_Rx_synth.v
	sed -i 's/SerialParalelo_PhyTX/SerialParalelo_PhyTX_synth/g' Phy_Rx_synth.v
	yosys -s sintesis_tx.ys
	sed -i 's/cond/synth/g' Phy_Tx_synth.v
	sed -i 's/DeMux2x1/DeMux2x1_synth/g' Phy_Tx_synth.v
	sed -i 's/DeMuxL1/DeMuxL1_synth/g' Phy_Tx_synth.v
	sed -i 's/DeMuxL2/DeMuxL2_synth/g' Phy_Tx_synth.v
	sed -i 's/Mux2x1/Mux2x1_synth/g' Phy_Tx_synth.v
	sed -i 's/MuxL1/MuxL1_synth/g' Phy_Tx_synth.v
	sed -i 's/MuxL2/MuxL2_synth/g' Phy_Tx_synth.v
	sed -i 's/ParaleloSerial_PhyRX/ParaleloSerial_PhyRX_synth/g' Phy_Tx_synth.v
	sed -i 's/ParaleloSerial_PhyTX/ParaleloSerial_PhyTX_synth/g' Phy_Tx_synth.v
	sed -i 's/Phy_Rx/Phy_Rx_synth/g' Phy_Tx_synth.v
	sed -i 's/Phy_Tx/Phy_Tx_synth/g' Phy_Tx_synth.v
	sed -i 's/Recirculador/Recirculador_synth/g' Phy_Tx_synth.v
	sed -i 's/SerialParalelo_PhyRX/SerialParalelo_PhyRX_synth/g' Phy_Tx_synth.v
	sed -i 's/SerialParalelo_PhyTX/SerialParalelo_PhyTX_synth/g' Phy_Tx_synth.v
	emacs BancoPrueba_Entrega3.v -f verilog-batch-auto --batch
	sed -i '52 s/active/SerialOut_cond/2g' BancoPrueba_Entrega3.v
	sed -i '71 s/active/SerialOut_synth/2g' BancoPrueba_Entrega3.v
	sed -i '98 s/SerialIn/SerialOutTx_cond/2g' BancoPrueba_Entrega3.v
	sed -i '117 s/SerialIn/SerialOutTx_synth/2g' BancoPrueba_Entrega3.v
	iverilog BancoPrueba_Entrega3.v
	./a.out
	rm a.out
	gtkwave Prueba_Final_Entrega3.vcd

#Prueba Final
Prueba_PHY:
	emacs Phy.v -f verilog-batch-auto --batch
	sed -i '60 s/active/SerialOut_cond/2g' Phy.v
	sed -i '75 s/dataOutProbador0/dataOutProbador0_cond/2g' Phy.v
	sed -i '76 s/dataOutProbador1/dataOutProbador1_cond/2g' Phy.v
	sed -i '70 s/dataOut0_Rx_cond/dataOut0_cond/2g' Phy.v
	sed -i '71 s/dataOut1_Rx_cond/dataOut1_cond/2g' Phy.v
	sed -i '72 s/dataOut2_Rx_cond/dataOut2_cond/2g' Phy.v
	sed -i '73 s/dataOut3_Rx_cond/dataOut3_cond/2g' Phy.v
	sed -i '74 s/validOut0_Rx_cond/validOut0_cond/2g' Phy.v
	sed -i '75 s/validOut1_Rx_cond/validOut1_cond/2g' Phy.v
	sed -i '76 s/validOut2_Rx_cond/validOut2_cond/2g' Phy.v
	sed -i '77 s/validOut3_Rx_cond/validOut3_cond/2g' Phy.v
	sed -i '79 s/SerialIn/SerialOutTx_cond/2g' Phy.v
	sed -i '75 s/posedge clk_4f/*/g' SerialParalelo_PhyRX.v
	yosys -s sintesis_phy.ys
	sed -i '75 s/*/posedge clk_4f/g' SerialParalelo_PhyRX.v
	sed -i 's/module Phy(/module Phy_synth(/g' Phy_synth.v
	sed -i 's/cond/synth/g' Phy_synth.v
	sed -i 's/DeMux2x1/DeMux2x1_synth/g' Phy_synth.v
	sed -i 's/DeMuxL1/DeMuxL1_synth/g' Phy_synth.v
	sed -i 's/DeMuxL2/DeMuxL2_synth/g' Phy_synth.v
	sed -i 's/Mux2x1/Mux2x1_synth/g' Phy_synth.v
	sed -i 's/MuxL1/MuxL1_synth/g' Phy_synth.v
	sed -i 's/MuxL2/MuxL2_synth/g' Phy_synth.v
	sed -i 's/ParaleloSerial_PhyRX/ParaleloSerial_PhyRX_synth/g' Phy_synth.v
	sed -i 's/ParaleloSerial_PhyTX/ParaleloSerial_PhyTX_synth/g' Phy_synth.v
	sed -i 's/Phy_Rx/Phy_Rx_synth/g' Phy_synth.v
	sed -i 's/Phy_Tx/Phy_Tx_synth/g' Phy_synth.v
	sed -i 's/Recirculador/Recirculador_synth/g' Phy_synth.v
	sed -i 's/SerialParalelo_PhyRX/SerialParalelo_PhyRX_synth/g' Phy_synth.v
	sed -i 's/SerialParalelo_PhyTX/SerialParalelo_PhyTX_synth/g' Phy_synth.v
	emacs BancoPrueba_PHY.v -f verilog-batch-auto --batch
	sed -i '120 s/dataOut0_Rx_cond/dataOut0_cond/2g' BancoPrueba_PHY.v
	sed -i '121 s/dataOut1_Rx_cond/dataOut1_cond/2g' BancoPrueba_PHY.v
	sed -i '122 s/dataOut2_Rx_cond/dataOut2_cond/2g' BancoPrueba_PHY.v
	sed -i '123 s/dataOut3_Rx_cond/dataOut3_cond/2g' BancoPrueba_PHY.v
	sed -i '124 s/validOut0_Rx_cond/validOut0_cond/2g' BancoPrueba_PHY.v
	sed -i '125 s/validOut1_Rx_cond/validOut1_cond/2g' BancoPrueba_PHY.v
	sed -i '126 s/validOut2_Rx_cond/validOut2_cond/2g' BancoPrueba_PHY.v
	sed -i '127 s/validOut3_Rx_cond/validOut3_cond/2g' BancoPrueba_PHY.v
	sed -i '136 s/dataOut0_Rx_synth/dataOut0_synth/2g' BancoPrueba_PHY.v
	sed -i '137 s/dataOut1_Rx_synth/dataOut1_synth/2g' BancoPrueba_PHY.v
	sed -i '138 s/dataOut2_Rx_synth/dataOut2_synth/2g' BancoPrueba_PHY.v
	sed -i '139 s/dataOut3_Rx_synth/dataOut3_synth/2g' BancoPrueba_PHY.v
	sed -i '140 s/validOut0_Rx_synth/validOut0_synth/2g' BancoPrueba_PHY.v
	sed -i '141 s/validOut1_Rx_synth/validOut1_synth/2g' BancoPrueba_PHY.v
	sed -i '142 s/validOut2_Rx_synth/validOut2_synth/2g' BancoPrueba_PHY.v
	sed -i '143 s/validOut3_Rx_synth/validOut3_synth/2g' BancoPrueba_PHY.v
	iverilog BancoPrueba_PHY.v
	./a.out
	rm a.out
	gtkwave Prueba_Final_PHY.vcd