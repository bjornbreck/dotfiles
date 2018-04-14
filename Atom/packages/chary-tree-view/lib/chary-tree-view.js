let treeView;
let dblClickHandler;

module.exports = {
  activate: () => {
    atom.packages
      .activatePackage('tree-view')
      .then(treeViewPkg => {
        treeView = treeViewPkg.mainModule.treeView;

        treeView.oldEntryClicked = treeView.entryClicked;

        const isDirectoryElement = element =>
          element.classList.contains('directory') ||
          element.parentNode.classList.contains('directory') ||
          element.parentNode.parentNode &&
          element.parentNode.parentNode.classList.contains('directory');

          const shouldToggleOnDblClick = (e) =>
          {
            if (e.target.classList.contains('entry') ||
              e.target.parentNode.classList.contains('entry') ||
              e.target.parentNode.parentNode &&
              e.target.parentNode.parentNode.classList.contains('entry'))
            {
              if (isDirectoryElement(e.target))
              {
                // If directory single click is on, then just toggle.
                if (atom.config.get('chary-tree-view.dirSingleClick'))
                  return false;
                else if (e.target.classList.contains('header'))
                {
                  // Find the name span so we can compare the click position with it.
                  let span = e.target.querySelector(':scope > .name');

                  if (e.offsetX < span.offsetLeft)
                    return false;
                }
              }

              return true;
            }

            return false;
          }

        treeView.entryClicked = e =>
          !shouldToggleOnDblClick(e) &&
          treeView.oldEntryClicked.call(treeView, e);

        dblClickHandler = e =>
          shouldToggleOnDblClick(e) &&
          treeView.oldEntryClicked.call(treeView, e);

        treeView.element.addEventListener('dblclick', dblClickHandler)
      })
  },

  deactivate: () => {
    treeView.element.removeEventListener('dblclick', dblClickHandler)
    delete treeView.oldEntryClicked;

    treeView = undefined;
    dblClickHandler = undefined;
  },

  config: {
    dirSingleClick: {
      title: 'Expand Folders With Single Click',
      description: 'Expand folders in the ordinary way.',
      type: 'boolean',
      default: true,
    }
  }
};
