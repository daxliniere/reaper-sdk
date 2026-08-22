# Dax Liniere MCU

This is a Cockos MCU control-surface derivative with additional live-control features. It retains the stock MCU/MCU Extender button handling and shared global banking. The optional record-arm **Bank select** mode is based on an idea from AK5K's ReaMCULive.

In REAPER's control-surface list, select **Mackie Control Universal (Dax Liniere)** or **Mackie Control Extender (Dax Liniere)**. Their unique internal IDs prevent collisions with REAPER's built-in MCU surfaces.

## Custom features and operation

- **Track navigation:** Track Up/Down moves one track; Bank Up/Down moves eight.
- **Control-surface toggle:** Untick **Enable control surface** to release its MIDI ports; tick it to reconnect.
- **Record-arm buttons:** Choose normal **Record arm** operation or the optional **Bank select** mode.
- **Master fader:** Choose **Master volume**, **Last-touched FX parameter**, or **Disabled**. In FX mode, tap JOG to capture the current parameter; tap JOG again while it is still the last-touched parameter to disconnect it. Direct, take-FX, and container parameters are supported.
- **Sends Mode:** Press **Mixer** to enter or leave. It controls only the first selected track and reports `No track selected` or `No sends present` when appropriate.
- Turn a V-pot to change its send level. Turn JOG to move through sends one at a time.
- Tap a V-pot to cycle Post-Fader (Post-Pan), Pre-Fader (Post-FX), and Pre-Fader (Pre-FX). A single tap is resolved after the 350 ms double-push window.
- Hold a V-pot for 1.5 seconds to toggle mute. A muted send displays `MUTED` instead of its level.
- Push and turn a V-pot to change the receiving channel pair.
- Double-push within 350 ms, hold the second push, and turn to change the sending channel pair.
- Source or destination track channel counts grow automatically when required. Routing notices show the actual complete source-to-destination route and remain until **Notice time** has elapsed with no further routing input.
- **Notice time:** Sets temporary-message duration from 0.1 to 10.0 seconds; default 1.5. Mute notices are not extended by holding or release.
- **Shutdown messages:** Enter semicolon-separated phrases; one is selected when the surface closes.

## Hardware test checklist

1. Start REAPER: confirm `Dax Liniere MCU`, normal labels, and no stuck Sends display. Close it in Sends Mode and confirm a complete shutdown phrase replaces both rows.
2. Confirm Track Up/Down moves one track and Bank Up/Down moves eight. With MCU extenders or multiple surfaces, confirm the shared bank offset stays aligned.
3. Test transport, channel select, mute, solo, automation, arrows/zoom, save/undo, flip/global, jog/scrub, and any buttons available on the hardware. On an MCU with F-keys, enable the marker option and test F1-F8 recall plus Ctrl+F1-F8 set.
4. Test both record-arm settings: **Record arm** arms tracks; **Bank select** selects banks.
5. Untick **Enable control surface** and confirm the MIDI ports become available elsewhere; re-enable it and confirm control returns.
6. Test all three master-fader modes. In FX mode, capture, move, receive automation from, and disconnect both a normal FX parameter and a parameter inside a container. Confirm moving the fader changes the parameter without jitter.
7. Enter Sends Mode with no track, a track with no sends, one selected track, and multiple selected tracks. Confirm the messages and that only the first selected track is controlled. Exit and verify both display rows return to track data.
8. Test send level, one-at-a-time JOG paging beyond send 8, tap-to-cycle send mode, 1.5-second hold-to-mute, push-turn receiving channels, and double-push/hold-turn sending channels. Confirm route notices use actual channels, both track channel counts expand when needed, and the routing notice expires only after routing input becomes idle.
9. Change Notice time to its minimum, default, and maximum; reopen settings and REAPER to confirm all settings persist while Mixer/Sends Mode itself resets off.
