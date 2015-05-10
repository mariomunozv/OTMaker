p " - Users"
User.create!([
  {email: "mario@requies.cl", name: "Mario Luis", lastname: "López Landes", phone: "12341234", password: "mario123", password_confirmation: "mario123"},
  {email: "diego@requies.cl", name: "Diego José", lastname: "Jaume Guazzini", phone: "12341234", password: "mario123", password_confirmation: "mario123"},
  {email: "mario.m@requies.cl", name: "Mario Ignacio", lastname: "Muñoz Villegas", phone: "12341234", password: "mario123", password_confirmation: "mario123"}
])

p " - Bill order"
BillOrder.create!([
  {folio: 55432, issued: "2015-12-12", status: "1"}
])

p " - Organization"
Organization.create!([
  {name: "Requies SpA", address: "Camino los Talaveras #41", phone: 67859442, user_id: 1},
  {name: "Sisar Ltda", address: "El paico #797", phone: 98976541, user_id: 1},
  {name: "Punk funk rock star", address: "Los talavera #41", phone: 123456789, user_id: 1}
])

p " - WorkOrder"
WorkOrder.create!([
  {code: "1234", title: "titulo 1234", description: "d1234", user_id:3 , user_assigned_id:3, organization: nil, organization_assigned_id:3 , bill_order: nil, state: 3}
])

p " - Change"
Change.create!([
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 0},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 1},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 2},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 3},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: 1, state: 4},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 5},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: nil, state: 3},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: 1, state: 4},
  {work_order_id: 1, user_id: 3, user_assigned_id: 3, code: "1234", title: "titulo 1234", description: "d1234", bill_order_id: 1, state: 6}
])

p " - Participation"
Participation.create!([
  {user_id: 1, organization_id: 1, role: 2, state: 0},
  {user_id: 1, organization_id: 1, role: 1, state: 1},
  {user_id: 1, organization_id: 3, role: 1, state: 1},
  {user_id: 1, organization_id: 1, role: 2, state: 1},
  {user_id: 1, organization_id: 2, role: 2, state: 1},
  {user_id: 1, organization_id: 2, role: 2, state: 1},
  {user_id: 1, organization_id: 2, role: 2, state: 1},
  {user_id: 1, organization_id: 1, role: 1, state: 1},
  {user_id: 1, organization_id: 3, role: 1, state: 1},
  {user_id: 1, organization_id: 3, role: 2, state: 1},
  {user_id: 1, organization_id: 3, role: 1, state: 1},
  {user_id: 1, organization_id: 2, role: 1, state: 0}
])

