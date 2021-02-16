cmsdefine([], function () {
    return function (data) {

        var inputElement = document.getElementById(data.imageUrlId);
        var previewElement = document.getElementById(data.imagePreviewId);
        var bynderCompactViewElement = document.getElementById(data.bynderCompactviewId);
        var selectButton = document.getElementById(data.cvTriggerId);
        var clearButton = document.getElementById(data.clearTriggerId);

        function getValue() {

            if (inputElement.value.length > 0) {
                return JSON.parse(inputElement.value);
            }

            return null;
        }

        function setValue(value) {
            if (value) {
                inputElement.value = JSON.stringify(value);
            } else {
                inputElement.value = null;
            }
        }

        function setPreview(url) {
            if (url) {
                previewElement.innerHTML = "<img src=" + url + " style=\"max-width: 300px; margin-bottom: 16px;\" />";
            } else {
                previewElement.innerHTML = "";
            }
        }

        function hideBynder() {
            bynderCompactViewElement.innerHTML = "";

            document.removeEventListener('click', hideBynderOnOutsideClick);
        }

        function setPageContentChanged() {
            if (window.CMSContentManager) {
                window.CMSContentManager.changed(true);
            }
        }

        function onSuccess(assets, additionalInfo) {

            if (assets.length < 1) {
                setValue(null);
                setPreview(null);
            } else {
                var value = {
                    assetId: assets[0].databaseId,
                    assetUrl: assets[0].files.webImage.url
                };

                setValue(value);
                setPreview(value.assetUrl);
            }

            hideBynder();

            setPageContentChanged();
        }

        function hideBynderOnOutsideClick(event) {
            if (selectButton.contains(event.target)) {
                return;
            }

            if (!bynderCompactViewElement.contains(event.target)) {
                hideBynder();
            }
        }

        function getBynderOptions() {
            var options = {
                language: "en_US",
                mode: "SingleSelect",
                assetTypes: ["IMAGE"],
                defaultDomain: data.defaultDomain,
                onSuccess: onSuccess
            };

            var value = getValue();

            if (value) {
                options.selectedAssets = [value.assetId];
            }

            if (data.useModalDisplayMode !== true) {
                options.container = bynderCompactViewElement;
            }

            return options;
        }

        selectButton.addEventListener("click", function () {
            BynderCompactView.open(getBynderOptions());

            if (data.useModalDisplayMode !== true) {
                document.addEventListener('click', hideBynderOnOutsideClick);
            }
        });

        clearButton.addEventListener("click", function () {
            setValue(null);
            setPreview(null);
            setPageContentChanged();
        });

        // preview init
        var value = getValue();

        if (value) {
            setPreview(value.assetUrl);
        }
    };
});