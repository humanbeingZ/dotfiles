from IPython import get_ipython
from prompt_toolkit.keys import Keys
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.filters import HasFocus, ViInsertMode, ViNavigationMode

ip = get_ipython()

def switch_to_navigation_mode(event):
    vi_state = event.cli.vi_state
    vi_state.input_mode = InputMode.NAVIGATION

def clear_buffer_and_switch_to_insert_mode(event):
    vi_state = event.cli.vi_state
    vi_state.input_mode = InputMode.INSERT
    buf = event.current_buffer
    buf.reset()

if getattr(ip, 'pt_app', None):
    registry = ip.pt_app.key_bindings

    registry.add_binding(u'j',u'j', 
        filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode())
        )(switch_to_navigation_mode)

    registry.add_binding(Keys.ControlC,    
        filter=(HasFocus(DEFAULT_BUFFER) & ViNavigationMode())
        )(clear_buffer_and_switch_to_insert_mode)
