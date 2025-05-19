controladdin "Checking Status Bins"
{
    Scripts = 'src/scripts/checkingStatusBins.js';
    StartupScript = 'src/scripts/start.js';
    StyleSheets = 'src/stylesheets/styles.css';
    Images = 'images/layout.jpg';

    // RecreateScript = 'recreateScript.js';
    // RefreshScript = 'refreshScript.js';

    RequestedHeight = 540;

    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    event OnStartUp();
    procedure setImage(imageBase64: Text);
    procedure setBinsData(jsonData: Text);

}