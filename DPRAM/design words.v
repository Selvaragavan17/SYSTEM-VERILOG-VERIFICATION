 1. Design – dp_ram_async_full.sv
This is the main hardware design we are testing.
It’s a dual-port RAM – means one side can write data and the other side can read data at the same time, using two different clocks.
When the write clock ticks, if write = 1, it saves the data into memory.
When read = 1, it gives out the stored data from the given address.
✅ Think of it like a small memory box — one person puts data in (write), another takes data out (read).
---------------------------------------------------------------------
 2. Interface – intf_async.sv
This is like a connecting wire bundle.
It collects all signals (like clocks, address, data, control signals) in one place so they can be passed easily between the testbench and the design.
✅ It just holds the wires — no logic, no processing.
--------------------------------------------------------------
3. Transaction – transaction.sv
This is like a data message that tells what action to do.
Each transaction says:
Are we writing or reading?
Which address?
What data to write or what data was read?
It also has a display function that prints all these values on the screen.
✅ Think of it like a note saying:
“Please write data 0xA0 at address 2” or “Please read data from address 2”.
-------------------------------------------------------------------------------------
4. Generator – generator.sv
This is the test idea maker.
It creates different transactions and sends them to the driver.
Each transaction tells the driver what to do (write or read).
For example:
Write 0x1111 at address 0, then read it back.
Try reading an address that was never written.
Write and read at the same time, etc.
✅ The generator is like the person giving step-by-step instructions for testing.
-----------------------------------------------------------
5. Driver – driver.sv
This is the person who actually presses the buttons on the DUT (design).
It takes each transaction and applies it on the interface:
If it’s a write, it sends the address and data to the design during the write clock.
If it’s a read, it sends the address during the read clock.
✅ The driver makes the test real by driving signals into the design.
------------------------------------------------------------
6. Monitor – monitor.sv
This is the watcher.
It does not change anything — it just looks at what’s happening on the interface.
When a write happens, it notes down the address and data written.
When a read happens, it notes the address and data read out.
Then it sends this information to the scoreboard.
✅ The monitor keeps track of what really happened.
-----------------------------------------------------------------------------
7. Scoreboard – scoreboard.sv
This is the checker.
It compares what should happen with what actually happened.
It remembers all the written values.
When a read happens, it checks if the data matches the stored one.
If they match → prints PASS.
If they don’t → prints FAIL with expected and actual values.
✅ The scoreboard tells if the design is working correctly.
----------------------------------------------------------------------
8. Environment – environment.sv
This is the organizer.
It connects the generator, driver, monitor, and scoreboard together and makes them work at the same time.
✅ The environment is like a manager who ensures everyone is doing their job.
  ---------------------------------------------------------------------------
9. Program – test.sv
This is the test controller.
It starts the environment and tells it to begin testing.
✅ It’s like saying, “Okay team, start the test now!”
-------------------------------------------------------------------
10. Top Testbench – testbench.sv
This is the top-level wrapper for everything.
It connects the interface, the DUT (design), and the test program.
It also:
Starts the write and read clocks,
Initializes signals to zero,
Stops simulation after some time.
✅ It’s like the outer box that holds both the real circuit and the testing setup.
