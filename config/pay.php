<?php

return [
	'alipay' => [
		'app_id' => '2016102000726919',
		'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtgMRUWrDq7ikHGhvA/qQqt/V8y7iFZlfvnwFRFvTQTnsuldAxyq3Oc4hHINVCnqS4VXSenBiGVBLbX5ZEL+pjQcYnfikntY04eguQHrB06OIZN1QO/vtPKkgQeBSfAC0nAoMfoYDUAJd1MJqU+Pes7gmDhU6ljy1Nm1fLcyyMFBMiuVvZOnYaCOzKBuG36+pDZvG0JzwG1qIZwl53rNgyxcwrMXcwYE2aWaVribh/pJj6L9Ws6ODkb2VItrT0eNNejf4leyc/9Jc3caL9gn59Lh54PZL2fL/7LJpL1b11Ayldbzyv4nQHPbJHjSksGCqZl3PpMbvg7B+4u370Mbd3wIDAQAB',
		'private_key'    => 'MIIEpQIBAAKCAQEA8MFOgVWtkvrRGOifvoW0regHlGIvMq3asJSbIeSaTqjubj/nddEEZ3byuWmm3uo4SF4xlXa9Y8b9eSzqIKJNvLqbHishx19t6X3H5LDR7I+Bp/g28T7MJWaSYh9TtwRbjHLWYiyebyDOmuscziR57zjA3UPH+6TLRMwz9RYer8Npk776/KM4FmRbJhUrdoQBhyW5qKp0uWN2BWroZ0+8t6azfDjxPoneLJ0yToZPv1hzO+KceeLZNb4mvC6beB7yR/01NH9NGznZ+PO9V2ldlrHeTCmwOJ1zrk3pVJ9DmG2bWjDnVI7O34zitytGGMjQDyDxNJQVpBxx0BkT4BzxsQIDAQABAoIBAQCjuVHB8poPkjIQVmIMFrFAcsJ0zjB6rnBCFU1KR0QIqik7IIovPO1ZzzJRlN++SFnuHOBrXEx/RhuqBDlT6AwlhGFoqrxV8Te1yavegcDAtvbdW5dBiAschByYTeWIWJZJdO8F5IH54L2f7LOyHGwvmtDNqAKfxvnU12meCmTj8RZ2G6b61Hh27+qF6imTs8Ipf7rnnMd2wKWt6x3AQBWqh0g/LnsNNLciqdfwEu0su2N/yfWz6RovhADgFxljYrGXeJZ22zWArY4PHk3tdFSU98elr+29krVLHYEuF9+HC99AULBRzL2CShb7+RcQN/b3/jeLWm+owq6b1Ml7Hw4BAoGBAPqhM4J5gnSJvebRuc6v6z1NoAbOMnpY2IFNcAXlJDvyafMnHq/Xg+N5ZEX6cpuihaWY9RPBoWol+7CMFaDHmW6USTHCSMO79QMmaDZddY8aZ4VHMztzfPYFu273XcW2VbTD7o4/Cjonff152MvMHyOKECc/huuaXmP4Ul6zG8FJAoGBAPXp8IlW5u/frwoCKtb5nnoS0dD0tY8yOOfcO1WxAflhTwY8EN5O5lbWghBvlf53HcvHtEq+DW1EEE1zXy+Q+Y+u3ZyzOdH0UgjiMI8K2Y5f6a8CtqebiZz255pTjclARqTZ5rcuEsLcURr4BpfW2MeV/f9AuTEwMORyzLJrUBUpAoGAZPi6ys7vSsoPcsV9qRJgoHL8jKFX3siaeQVco1NclLYmDyrshwU5glRunG6465C/bSbBXbM9t4kT7F2TfRHM86rUDjLqo8i+fgVkKLrgWMXXfO9haYsuheNrTtpjsfqybsAdBLvLAADXFl6XhAt5ZBUESvuh/JtVecsaTEK2ZNkCgYEAleZ1jnJfsYbLfzFVBdgBZ25DYblZVyGJGKThslmE14wejLFeovS7aeG2ROiQKR5ZFlf0qb7yFlHwEhYqxqb7yT8Rrax+qWHiA7JFYVx+w0/p9ZmU19Ry7TCAe01FV5ELvv9oqO631vpPoj3gXvxDBl6DBu5gNQCoPQlRh8zscwkCgYEA9GdJ19U6aP1WNSDbIRIlXzf+6xxqxLUXhFo38dAgZxHcW7XSyGHGUp8HUidWmCusPgKBcDmduQMUEq7ehsg2zYjAkfeEEsMZcuBY5b9W/MFyX93wSPLD4s09dWz1gvwOhSHGBSJ0gxypdNXBESE7NqH5C/ZRBIGYhWO5UtjOxoY=',
		'log'            => [
			'file' => storage_path('logs/alipay.log'),
		],
	],

	'wechat' => [
		'app_id'      => '',
		'mch_id'      => '',
		'key'         => '',
		'cert_client' => '',
		'cert_key'    => '',
		'log'         => [
			'file' => storage_path('logs/wechat_pay.log'),
		],
	],
];
