import numpy as np
import matplotlib.pyplot as plt
from flask import Flask, send_file
import io

# Initialize the Flask app
app = Flask(__name__)

# Define the function to generate the plot
def f(x):
	return 10**70 + (10**70) / np.log(1 + x)

def f1 (x, k = 1):
	return 1 / (1 + np.exp (-k * x))

# Route to serve the plot as an image
@app.route('/plot')
def plot():
	# Generate the x and y values
	# x = np.linspace(1, 1000, 500)
	# y = f(x)

	x = np.linspace (0, 10, 500)
	y = f1 (x)

	# Create the plot
	plt.figure(figsize=(8, 6))
	plt.plot(x, y, label=r'$f(x) = 10^{70} + \frac{10^{70}}{\ln(1+x)}$', color='b')
	plt.title(r'Plot of $f(x) = 10^{70} + \frac{10^{70}}{\ln(1+x)}$', fontsize=14)
	plt.xlabel('x', fontsize=12)
	plt.ylabel(r'$f(x)$', fontsize=12)
	plt.yscale('log')
	plt.grid(True)
	plt.legend()

	# Save the plot to a BytesIO buffer
	img = io.BytesIO()
	plt.savefig(img, format='png')
	img.seek(0)  # Rewind the file pointer to the beginning of the image data

	# Return the image as a response
	return send_file(img, mimetype='image/png')

# Run the app
if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000)
