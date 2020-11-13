//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "AuxDirichletBC.h"

registerMooseObject("MoltresApp", AuxDirichletBC);

template <>
InputParameters
validParams<AuxDirichletBC>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredCoupledVar("v", "The coupled variable");
  params.addRequiredParam<Real>("penalty", "Penalty scalar");
  params.addClassDescription("Enforces a Dirichlet boundary condition "
                             "in a weak sense by penalizing differences between the current "
                             "solution and the Dirichlet data.");
  return params;
}

AuxDirichletBC::AuxDirichletBC(const InputParameters & parameters)
  : IntegratedBC(parameters), _p(getParam<Real>("penalty")), _v(coupledValue("v"))
{
}

Real
AuxDirichletBC::computeQpResidual()
{
  return _p * _test[_i][_qp] * (-_v[_qp] + _u[_qp]);
}

Real
AuxDirichletBC::computeQpJacobian()
{
  return _p * _phi[_j][_qp] * _test[_i][_qp];
}
