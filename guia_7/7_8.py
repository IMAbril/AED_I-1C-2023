#1
"""
//EstadoInicial: {}
//AsignacionX : x@{x=5}
//AsignacionY: y@{x=5,y=7}
//EstadoFinal: {x=5, y=7}
"""

#2
"""
//EstadoInicial: {}
//AsignacionX : x@{x=5}
//AsignacionY: y@{x=5,y=7}
//AsignacionZ: z@{x=5,y=7, z=x+y}
//EstadoFinal: {x=5, y=7, z=12}
"""

#3
"""
//EstadoInicial: {}
//AsignaciónX: x@{x=5}
//ReasignacionX x@{x="hora"}
//EstadoFinal: {x="hora"}
"""

#4
"""
//EstadoInicial: {}
//AsignacionX: x@{x=True}
//AsignacionY: y@{x=True, y=False}
//AsignacionRES: res@{x=True, y=False, res= x and y}
//EstadoFinal: {x=True, y=False, res=False}
"""

#5
"""
//EstadoInicial: {}
//AsignacionX: x@{x=False}
//AsignacionRES: res@{x=False, res= not x}
//EstadoFinal: {x=False, res= True}
"""