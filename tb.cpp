#include <stdlib.h>
#include <stdint.h>
#include <iostream>
#include <bitset>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vtop.h"

#define MAX_TIME 20
uint64_t cnt = 0;

using namespace std;


int main() { 
  Vtop *to = new Vtop;
  uint64_t cnt = 0;


  
}

  //  	wire [31:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;



  /* 
pc_mux,
res_mux, mem_w, 
reg_w, alu_inst, 
alu_mux, jmp,
bch, extend_mux, 
unsigned_op);
  */
  
  
  // to->res = 0;
  //while (cnt < MAX_TIME) {
    //   to->clk^=1;
    //     to->load ^=1;
  //   if(cnt % 10 == 1) {
  //     printf("%d:%u\n",to->clk, to->D);
  //     to->D ^= 0xFFFFFFFF;
  //     printf("%d:%u\n", to->clk, to->D);
  //   }
    

  //   to->eval();
  //   trace->dump(cnt);
  //   cnt++;
  //   to->load = 0;
  // }
  //  trace->close();


