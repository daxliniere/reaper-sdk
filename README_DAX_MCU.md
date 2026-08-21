# Dax Liniere MCU

This is a Cockos MCU control-surface derivative with additional live-control features. It retains the stock MCU/MCU Extender button handling and shared global banking. The optional record-arm **Bank select** mode is based on an idea from AK5K's ReaMCULive.

In REAPER's control-surface list, select **Mackie Control Universal (Dax Liniere)** or **Mackie Control Extender (Dax Liniere)**. Their unique internal IDs prevent collisions with REAPER's built-in MCU surfaces.

## Changes and operation

- Track Up/Down moves one track; Bank Up/Down moves eight.
- **Master volume** controls REAPER's master volume.
- **Last-touched FX parameter** maps the master fader to an FX parameter. Tap JOG to capture it; tap JOG again while it remains the last-touched parameter to disconnect it. The captured parameter is briefly identified on the display. Direct parameters and parameters inside containers are supported.
- **Disabled** stops master-fader send and receive data.
- **Enable control surface** releases or reconnects the configured MIDI ports.
- **Record arm buttons** selects normal record-arm operation or the optional Bank-select behavior.
- **F1-F8 map to markers** retains Cockos's universal MCU option.
- **Ignore global bank offsets** retains Cockos's option to keep this surface fixed to its configured track range instead of following the shared MCU bank.
- Press **Mixer** to enter or leave Sends Mode. It always controls the first selected track.
- In Sends Mode, turn a V-pot for send level and turn JOG to move through sends one at a time.
- Tap a V-pot to cycle Post-Fader (Post-Pan), Pre-Fader (Post-FX), and Pre-Fader (Pre-FX).
- Hold a V-pot for 1.5 seconds to toggle send mute. A muted send shows `MUTED` in place of its value.
- Hold and turn a V-pot to change the receiving channel pair; the destination track's channel count grows when required.
- Double-push a V-pot, hold the second push, and turn it to change the sending channel pair; the source track's channel count grows when required.
- Channel changes display the complete source-to-destination route.
- **Notice time** controls temporary display messages (0.1-10.0 seconds; default 1.5).
- Shutdown messages are semicolon-separated; one is selected when the surface closes.
- Outside Sends Mode, JOG retains stock movement. JOG push toggles Scrub unless the master fader is in Last-touched FX parameter mode.
- V-pot push deliberately does not reset pan outside Sends Mode.

## Hardware test checklist

1. Start REAPER: confirm `Dax Liniere MCU`, normal labels, and no stuck Sends display. Close it in Sends Mode and confirm a complete shutdown phrase replaces both rows.
2. Confirm Track Up/Down moves one track and Bank Up/Down moves eight. With MCU extenders or multiple surfaces, confirm the shared bank offset stays aligned.
3. Test transport, channel select, mute, solo, automation, arrows/zoom, save/undo, flip/global, jog/scrub, and any buttons available on the hardware. On an MCU with F-keys, enable the marker option and test F1-F8 recall plus Ctrl+F1-F8 set.
4. Test both record-arm settings: **Record arm** arms tracks; **Bank select** selects banks.
5. Untick **Enable control surface** and confirm the MIDI ports become available elsewhere; re-enable it and confirm control returns.
6. Test all three master-fader modes. In FX mode, capture, move, receive automation from, and disconnect both a normal FX parameter and a parameter inside a container. Confirm moving the fader changes the parameter without jitter.
7. Enter Sends Mode with no track, a track with no sends, one selected track, and multiple selected tracks. Confirm the messages and that only the first selected track is controlled. Exit and verify both display rows return to track data.
8. Test send level, one-at-a-time JOG paging beyond send 8, tap-to-cycle send mode, 1.5-second hold-to-mute, and hold-turn destination channels. Confirm route notices use actual source/destination channels and destination channel count expands.
9. Change Notice time to its minimum, default, and maximum; reopen settings and REAPER to confirm all settings persist while Mixer/Sends Mode itself resets off.
