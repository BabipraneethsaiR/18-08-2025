document.addEventListener('DOMContentLoaded', function () {
	const marginRange = document.getElementById('marginRange');
	const borderRange = document.getElementById('borderRange');
	const paddingRange = document.getElementById('paddingRange');
	const marginValue = document.getElementById('marginValue');
	const borderValue = document.getElementById('borderValue');
	const paddingValue = document.getElementById('paddingValue');
	const marginBox = document.querySelector('.margin');
	const borderBox = document.querySelector('.border');
	const paddingBox = document.querySelector('.padding');

	function updateMargin() {
		const val = marginRange.value;
		marginBox.style.margin = val + 'px';
		marginValue.textContent = val;
	}
	function updateBorder() {
		const val = borderRange.value;
		borderBox.style.borderWidth = val + 'px';
		borderValue.textContent = val;
	}
	function updatePadding() {
		const val = paddingRange.value;
		paddingBox.style.padding = val + 'px';
		paddingValue.textContent = val;
	}

	marginRange.addEventListener('input', updateMargin);
	borderRange.addEventListener('input', updateBorder);
	paddingRange.addEventListener('input', updatePadding);

	updateMargin();
	updateBorder();
	updatePadding();
});