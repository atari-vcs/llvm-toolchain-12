; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v,+f -verify-machineinstrs \
; RUN:   --riscv-no-aliases < %s | FileCheck %s
declare <vscale x 1 x i8> @llvm.riscv.vslide1up.nxv1i8.i8(
  <vscale x 1 x i8>,
  i8,
  i32);

define <vscale x 1 x i8> @intrinsic_vslide1up_vx_nxv1i8_nxv1i8_i8(<vscale x 1 x i8> %0, i8 %1, i32 %2) nounwind {
; CHECK-LABEL: intrinsic_vslide1up_vx_nxv1i8_nxv1i8_i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a1, a1, e8,mf8,ta,mu
; CHECK-NEXT:    vslide1up.vx v25, v8, a0
; CHECK-NEXT:    vmv1r.v v8, v25
; CHECK-NEXT:    jalr zero, 0(ra)
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.vslide1up.nxv1i8.i8(
    <vscale x 1 x i8> %0,
    i8 %1,
    i32 %2)

  ret <vscale x 1 x i8> %a
}
