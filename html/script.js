// Menu state management
let menuOpen = false;
let menuMode = 'categories'; // categories | animations | animationList | pairedAnimsList
let categories = [];
let selectedCategoryIndex = 0;
let selectedAnimationIndex = 0;
let currentCategory = null;
let currentAnimationType = null; // 'solo' or 'paired'

// Send event to Lua
function sendToLua(event, data) {
    fetch(`https://${GetParentResourceName()}/` + event, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
    });
}

// Receive from Lua
window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'openMenu') {
        const incomingCategories = data.categories || (data.openMenu && data.openMenu.categories) || [];
        menuOpen = true;
        menuMode = 'categories';
        selectedCategoryIndex = 0;
        selectedAnimationIndex = 0;
        categories = incomingCategories;
        
        if (categories.length === 0) {
            showInfo('No animation packs enabled!');
            return;
        }
        
        renderMenu();
    }

    if (data.type === 'closeMenu') {
        menuOpen = false;
        document.getElementById('menu-container').classList.add('hidden');
        document.getElementById('info-panel').classList.add('hidden');
    }

    if (data.type === 'setMenuMode') {
        menuMode = data.mode;
        if (data.mode === 'animations') {
            currentCategory = data.category;
            selectedAnimationIndex = 0;
            currentAnimationType = null;
        }
        renderMenu();
    }

    if (data.type === 'updateInfo') {
        showInfo(data.message);
    }
});

function renderMenu() {
    const container = document.getElementById('menu-container');
    const listContainer = document.getElementById('menu-list');
    const headerTitle = document.getElementById('header-title');

    if (!menuOpen) {
        container.classList.add('hidden');
        return;
    }

    if (!categories || categories.length === 0) {
        return;
    }

    container.classList.remove('hidden');
    listContainer.innerHTML = '';

    if (menuMode === 'categories') {
        headerTitle.textContent = 'Animations';

        categories.forEach((category, index) => {
            const item = document.createElement('div');
            item.className = 'menu-item';
            if (index === selectedCategoryIndex) {
                item.classList.add('selected');
            }
            item.textContent = category.label;
            item.onclick = () => {
                selectedCategoryIndex = index;
                renderMenu();
            };
            listContainer.appendChild(item);
        });
    } else if (menuMode === 'animations' && currentCategory) {
        headerTitle.textContent = '← ' + currentCategory.label;

        let itemIndex = 0;

        const hasSolo = currentCategory.soloAnimations.length > 0;
        const hasPaired = currentCategory.hasPairedAnims;

        if (hasSolo) {
            const soloHeader = document.createElement('div');
            soloHeader.className = 'menu-section-header';
            if (selectedAnimationIndex === itemIndex) {
                soloHeader.classList.add('selected');
            }
            soloHeader.textContent = 'Solo Animations';
            soloHeader.onclick = () => {
                selectedAnimationIndex = itemIndex;
                renderMenu();
            };
            listContainer.appendChild(soloHeader);
            itemIndex += 1;

            currentCategory.soloAnimations.forEach((anim) => {
                const item = document.createElement('div');
                item.className = 'menu-item';
                if (selectedAnimationIndex === itemIndex) {
                    item.classList.add('selected');
                }
                item.textContent = anim.name;
                const thisIndex = itemIndex;
                item.onclick = () => {
                    selectedAnimationIndex = thisIndex;
                    renderMenu();
                };
                listContainer.appendChild(item);
                itemIndex += 1;
            });
        }

        if (hasPaired) {
            const pairedHeader = document.createElement('div');
            pairedHeader.className = 'menu-section-header paired';
            if (selectedAnimationIndex === itemIndex) {
                pairedHeader.classList.add('selected');
            }
            pairedHeader.textContent = '📌 Paired Animations';
            pairedHeader.onclick = () => {
                selectedAnimationIndex = itemIndex;
                renderMenu();
            };
            listContainer.appendChild(pairedHeader);
            itemIndex += 1;

            currentCategory.pairedAnimations.forEach((anim) => {
                const item = document.createElement('div');
                item.className = 'menu-item paired';
                if (selectedAnimationIndex === itemIndex) {
                    item.classList.add('selected');
                }
                item.textContent = anim.name;
                const thisIndex = itemIndex;
                item.onclick = () => {
                    selectedAnimationIndex = thisIndex;
                    renderMenu();
                };
                listContainer.appendChild(item);
                itemIndex += 1;
            });
        }
    }

    const selectedElement = listContainer.querySelector('.selected');
    if (selectedElement) {
        selectedElement.scrollIntoView({ block: 'nearest' });
    }
}

function showInfo(message) {
    const infoPanel = document.getElementById('info-panel');
    const infoText = document.getElementById('info-text');
    infoText.textContent = message;
    infoPanel.classList.remove('hidden');

    setTimeout(() => {
        infoPanel.classList.add('hidden');
    }, 3000);
}

// Keyboard input handler
document.addEventListener('keydown', (event) => {
    if (!menuOpen) return;

    const key = event.key;

    switch(key.toUpperCase()) {
        case 'ARROWUP':
            event.preventDefault();
            handleArrowUp();
            break;
        case 'ARROWDOWN':
            event.preventDefault();
            handleArrowDown();
            break;
        case 'ENTER':
            event.preventDefault();
            handleEnter();
            break;
        case 'BACKSPACE':
            event.preventDefault();
            handleBackspace();
            break;
    }
});

function getAnimationMenuLength() {
    let length = 0;
    if (currentCategory.soloAnimations.length > 0) {
        length += 1 + currentCategory.soloAnimations.length;
    }
    if (currentCategory.hasPairedAnims) {
        length += 1 + currentCategory.pairedAnimations.length;
    }
    return length;
}

function handleArrowUp() {
    if (menuMode === 'categories') {
        selectedCategoryIndex = (selectedCategoryIndex - 1 + categories.length) % categories.length;
    } else if (menuMode === 'animations' && currentCategory) {
        const totalItems = getAnimationMenuLength();
        if (totalItems > 0) {
            selectedAnimationIndex = (selectedAnimationIndex - 1 + totalItems) % totalItems;
        }
    }
    renderMenu();
}

function handleArrowDown() {
    if (menuMode === 'categories') {
        selectedCategoryIndex = (selectedCategoryIndex + 1) % categories.length;
    } else if (menuMode === 'animations' && currentCategory) {
        const totalItems = getAnimationMenuLength();
        if (totalItems > 0) {
            selectedAnimationIndex = (selectedAnimationIndex + 1) % totalItems;
        }
    }
    renderMenu();
}

function handleEnter() {
    if (menuMode === 'categories') {
        sendToLua('selectCategory', {
            categoryIndex: selectedCategoryIndex
        });
        return;
    }

    if (menuMode !== 'animations' || !currentCategory) {
        return;
    }

    let cursor = selectedAnimationIndex;
    const soloCount = currentCategory.soloAnimations.length;
    const pairedCount = currentCategory.pairedAnimations.length;
    const hasSolo = soloCount > 0;
    const hasPaired = currentCategory.hasPairedAnims;

    if (hasSolo) {
        if (cursor === 0) {
            selectedAnimationIndex = 1;
            renderMenu();
            return;
        }

        if (cursor <= soloCount) {
            sendToLua('playAnimation', {
                animationIndex: cursor - 1,
                isPaired: false
            });
            return;
        }

        cursor -= 1 + soloCount;
    }

    if (hasPaired) {
        if (cursor === 0) {
            selectedAnimationIndex += 1;
            renderMenu();
            return;
        }

        const animIndex = cursor - 1;
        if (animIndex >= 0 && animIndex < pairedCount) {
            sendToLua('playAnimation', {
                animationIndex: animIndex,
                isPaired: true
            });
        }
    }
}

function handleBackspace() {
    if (menuMode === 'animations') {
        menuMode = 'categories';
        currentAnimationType = null;
        renderMenu();
        sendToLua('stopAnimation', {});
    } else if (menuMode === 'categories') {
        menuOpen = false;
        document.getElementById('menu-container').classList.add('hidden');
        document.getElementById('info-panel').classList.add('hidden');
        sendToLua('closeMenu', {});
    }
}

// Initialize
window.addEventListener('load', () => {
});
