from flask import Flask, request, render_template

app = Flask(__name__)

def convert_weight(amount, from_unit, to_unit):
    conversions = {
        'kg': 1,
        'g': 1000,
        'lb': 2.20462,
        'oz': 35.274
    }
    
    if from_unit not in conversions or to_unit not in conversions:
        raise ValueError("Invalid unit")

    amount_in_kg = amount / conversions[from_unit]

    result = amount_in_kg * conversions[to_unit]
    
    return result

@app.route('/', methods=['GET', 'POST'])
def index():
    result_message = None
    if request.method == 'POST':
        try:
            amount = float(request.form['amount'])
            if amount < 0:
                raise ValueError("Amount cannot be negative")
                
            from_unit = request.form['from_unit']
            to_unit = request.form['to_unit']
            result_value = convert_weight(amount, from_unit, to_unit)
            result_message = f"{result_value:.2f} {to_unit}"
        except ValueError as e:
            result_message = str(e)
    return render_template('index.html', result=result_message)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)