# FortiGate Factory Reset

To factory default a FortiGate firewall, there are several methods available depending on the model and your level of access. Here are the key steps and considerations:

## Using the Web GUI:
- Log in to the FortiGate firewall interface.
- Navigate to 'System' > 'Dashboard'.
- Select 'Configuration' > 'Backup'.
- Save the backup file securely.
- Connect to your FortiGate device. Access the web-based manager or console.
- Go to 'System' > 'Maintenance'.
- Click on 'Factory Reset'.
- Confirm your decision to initiate the factory reset. Note: This will erase all configurations and data.
- The device will automatically reboot after the factory reset. Wait for the restart process to complete.
- Log in using the default credentials.

## Using the CLI:
- Connect to the FortiGate using SSH or via the console port.
- Log in with your admin credentials.
- Run the following command: 

```
execute factory-reset
```

- Confirm the action when prompted.
- The device will reboot and restore factory settings.

## Using the Physical Reset Button:
- For models with a physical reset button, power off the FortiGate unit.
- Press and hold the RESET button.
- Power on the device while continuing to hold the button for 10–15 seconds.
- Release the button when the status LEDs indicate the reset process.

## Using the Console Port:
- Connect a console cable to the FortiGate and your computer.
- Use a terminal emulator like PuTTY to connect to the device.
- Follow the prompts to reset the device to factory defaults.

## Special Considerations:
- A factory reset will remove all custom configurations and revert the device to default settings. The default IP address will be 192.168.1.99/24, and the default admin password will be empty (no password required).
- If the device has been compromised, it is recommended to perform a factory reset to ensure no hidden settings or malevolent scripts are present.

- For models with firmware version 7.4.1 and later, the status LED function may differ, so it is important to check the specific documentation for your model.

- By following these steps, you can effectively reset your FortiGate firewall to its factory default settings, ensuring a clean and secure configuration.

## Default Credencial

```
User: admin
Pass: none
```