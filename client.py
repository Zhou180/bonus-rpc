import xmlrpc.client

proxy = xmlrpc.client.ServerProxy("http://localhost:8000/")

testcases = [
    (5, 7, 12),
    (0, 0, 0),
    (-5, -7, -12),
    (100, 200, 300),
    (1234567890, 9876543210, 11111111100)
]

for test in testcases:
    input_values = test[0:2]
    expected_output = test[2]
    result = proxy.add(*input_values)
    if result == expected_output:
        print("Testcase passed")
    else:
        print("Testcase failed")
