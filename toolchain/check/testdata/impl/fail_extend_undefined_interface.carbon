// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

interface I;

class C {
  // CHECK:STDERR: fail_extend_undefined_interface.carbon:[[@LINE+6]]:3: ERROR: `extend impl` requires a definition for interface `I`.
  // CHECK:STDERR:   extend impl as I;
  // CHECK:STDERR:   ^~~~~~~~~~~~~~~~~
  // CHECK:STDERR: fail_extend_undefined_interface.carbon:[[@LINE-6]]:1: Interface was forward declared here.
  // CHECK:STDERR: interface I;
  // CHECK:STDERR: ^~~~~~~~~~~~
  extend impl as I;
}

// CHECK:STDOUT: --- fail_extend_undefined_interface.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %C: type = class_type @C [template]
// CHECK:STDOUT:   %.1: type = interface_type @I [template]
// CHECK:STDOUT:   %.2: type = struct_type {} [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace {.I = %I.decl, .C = %C.decl} [template]
// CHECK:STDOUT:   %I.decl = interface_decl @I, ()
// CHECK:STDOUT:   %C.decl = class_decl @C, ()
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: interface @I;
// CHECK:STDOUT:
// CHECK:STDOUT: impl @impl: C as I;
// CHECK:STDOUT:
// CHECK:STDOUT: class @C {
// CHECK:STDOUT:   impl_decl @impl, (<unexpected instref inst+5>)
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   has_error
// CHECK:STDOUT: }
// CHECK:STDOUT:
