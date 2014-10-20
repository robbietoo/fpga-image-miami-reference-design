----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2014 01:39:00 PM
-- Design Name: 
-- Module Name: axi_gpio - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity axi_gpio is
  generic (
    -- AXI bus related configuration parameters
    C_S_AXI_DATA_WIDTH          : integer   := 32;
    C_S_AXI_ADDR_WIDTH          : integer   := 32;
    GPIOS                       : integer   := 8
  );
  port ( 
    ------------ AXI-4 Lite Interface -------
    S_AXI_ACLK                  : in  std_logic;
    S_AXI_ARESETN               : in  std_logic;
    S_AXI_AWADDR                : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
    S_AXI_AWVALID               : in  std_logic;
    S_AXI_AWREADY               : out std_logic;
    S_AXI_WDATA                 : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
    S_AXI_WSTRB                 : in  std_logic_vector(3 downto 0);
    S_AXI_WVALID                : in  std_logic;
    S_AXI_WREADY                : out std_logic;
    S_AXI_BRESP                 : out std_logic_vector(1 downto 0);
    S_AXI_BVALID                : out std_logic;
    S_AXI_BREADY                : in  std_logic;
    S_AXI_ARADDR                : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
    S_AXI_ARVALID               : in  std_logic;
    S_AXI_ARREADY               : out std_logic;
    S_AXI_RDATA                 : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
    S_AXI_RRESP                 : out std_logic_vector(1 downto 0);
    S_AXI_RVALID                : out std_logic;
    S_AXI_RREADY                : in  std_logic;
    ------------ debug io lines --------------
    gpio_signals                : inout std_logic_vector(GPIOS - 1 downto 0);
    ------------ clk in / out --------------
    clk_in                      : in  std_logic;
    div_clk_out                 : out std_logic

  );
end axi_gpio;

architecture behavioral of axi_gpio is
  
  signal AWADDR				: unsigned(C_S_AXI_ADDR_WIDTH - 1 downto 0);
  signal ARADDR				: unsigned(C_S_AXI_ADDR_WIDTH - 1 downto 0);	
  
  -- Write Handling State machine
  type sm_write_action_type is (WAIT_FOR_AWVALID, WAIT_FOR_WVALID, WAIT_FOR_BREADY);
  signal sm_write_action    : sm_write_action_type; 
  
  -- Read Handling State machine
  type sm_read_action_type is (WAIT_FOR_ARVALID, SET_RVALID_AND_RDATA, WAIT_FOR_RREADY);
  signal sm_read_action     : sm_read_action_type;
  
  signal gpio_i         : std_logic_vector(GPIOS - 1 downto 0) := (others => '0');
  signal gpio_o         : std_logic_vector(GPIOS - 1 downto 0) := (others => '0');
  signal gpio_t         : std_logic_vector(GPIOS - 1 downto 0) := (others => '0');
  
  signal div_enable     : std_logic := '0';
  signal divider        : unsigned(31 downto 0) := (others => '0');
  signal div_cnt        : unsigned(31 downto 0) := (others => '0');
  
  signal div_clk_out_i  : std_logic := '0';

begin

  -----------------------------------------------------------------------------
  -- AXI WRITE BUS HANDLING STATEMACHINE                                     --
  -----------------------------------------------------------------------------
  write_action: process(S_AXI_ACLK) is
    variable index  : integer; 
  begin
    if (rising_edge(S_AXI_ACLK)) then
      if (S_AXI_ARESETN = '0') then
        S_AXI_AWREADY       <= '0';  
		AWADDR				<= (others => '0');
        S_AXI_WREADY      	<= '0';
        S_AXI_BRESP       	<= (others => '0');
        S_AXI_BVALID      	<= '0';
		
        sm_write_action   	<=  WAIT_FOR_AWVALID;
      else
        case (sm_write_action) is
          --------------------------------------------------------------
          when WAIT_FOR_AWVALID => 
            S_AXI_BVALID        <= '0';
            
            if (S_AXI_AWVALID = '1') then
              AWADDR            <= unsigned(S_AXI_AWADDR);
              S_AXI_AWREADY     <= '1';
              
              -- next state
              sm_write_action   <= WAIT_FOR_WVALID;             
            end if;
          --------------------------------------------------------------  
          when WAIT_FOR_WVALID =>
            S_AXI_AWREADY     <= '0';
            
            index := to_integer(AWADDR(11 downto 4));

            if (S_AXI_WVALID = '1') then

              if(index < 200) then
                case(AWADDR(3 downto 2)) is
                  when "01" => gpio_o(index)  <= S_AXI_WDATA(0);                        -- 0x1
                  when "10" => gpio_t(index)  <= S_AXI_WDATA(0);                        -- 0x2
                  when others => null;
                end case;
              else
                case(AWADDR(3 downto 2)) is
                  when "00" => div_enable <= S_AXI_WDATA(0);                            -- 0x0
                  when "01" => divider    <= unsigned(S_AXI_WDATA);                     -- 0x1
                  when others => null;
                end case;    
              end if;            
          
              S_AXI_WREADY                  <= '1';
              S_AXI_BVALID                  <= '1';
                              
              -- next state
              sm_write_action <= WAIT_FOR_BREADY;
            end if;
          --------------------------------------------------------------
          when WAIT_FOR_BREADY =>
            S_AXI_WREADY  <= '0';
            
            if (S_AXI_BREADY = '1') then
              S_AXI_BVALID    <= '0';
              
              -- next state
              sm_write_action <= WAIT_FOR_AWVALID;
            end if;
          --------------------------------------------------------------		  
        end case;
      end if;
    end if;
  end process write_action;
  
  -----------------------------------------------------------------------------
  -- AXI READ BUS HANDLING STATEMACHINE                                      --
  -----------------------------------------------------------------------------
  read_action: process(S_AXI_ACLK)
    variable index  : integer; 
  begin
    if (rising_edge(S_AXI_ACLK)) then
      if (S_AXI_ARESETN = '0') then
        ARADDR       	<= (others => '0');
        S_AXI_RDATA     <= (others => '0'); 
        S_AXI_RRESP     <= "00"; 
        S_AXI_ARREADY   <= '0';
        S_AXI_RVALID    <= '0';
		
        sm_read_action  <=  WAIT_FOR_ARVALID;
      else
        case(sm_read_action) is
          --------------------------------------------------------------
          when WAIT_FOR_ARVALID =>   
            
            if (S_AXI_ARVALID = '1') then
              ARADDR         	  <= unsigned(S_AXI_ARADDR);
              S_AXI_ARREADY     <= '1';
              
              -- next state
              sm_read_action    <= SET_RVALID_AND_RDATA;
            end if;     
          --------------------------------------------------------------
          when SET_RVALID_AND_RDATA =>
            
            index := to_integer(ARADDR(11 downto 4));
            
            S_AXI_ARREADY	<= '0';
			
            if(index < 200) then
              case(ARADDR(3 downto 2)) is
                when "00" => S_AXI_RDATA  <= (31 downto 1 => '0', 0 => gpio_i(index));          -- 0x0
                when "01" => S_AXI_RDATA  <= (31 downto 1 => '0', 0 => gpio_o(index));          -- 0x1
                when "10" => S_AXI_RDATA  <= (31 downto 1 => '0', 0 => gpio_t(index));          -- 0x2
                when others => S_AXI_RDATA <= (others => '0');
              end case;
            else
              case(ARADDR(3 downto 2)) is
                when "00" => S_AXI_RDATA  <= (31 downto 1 => '0', 0 => div_enable);             -- 0x0
                when "01" => S_AXI_RDATA  <= std_logic_vector(divider);                         -- 0x1
                when others => S_AXI_RDATA <= (others => '0');
              end case;        
            end if;         
          
            S_AXI_RVALID	<= '1';

            -- next state  
            sm_read_action    <= WAIT_FOR_RREADY;
          --------------------------------------------------------------
          when WAIT_FOR_RREADY => 
            
            if (S_AXI_RREADY = '1') then
              S_AXI_RVALID  <= '0';
              
              sm_read_action    <= WAIT_FOR_ARVALID;

            end if;          
          --------------------------------------------------------------       
        end case;
      end if;
    end if;
  end process read_action;  
  
  tri_state : for i in 0 to GPIOS - 1 generate
  begin
    gpio_signals(i) <= gpio_o(i) when (gpio_t(i) = '1') else 'Z';
    gpio_i(i)       <= gpio_signals(i);   
  end generate tri_state; 
  
  -----------------------------------------------------------------------------
  -- Divide clk_in by divider                                                --
  -----------------------------------------------------------------------------
  div_clk: process(clk_in)
  begin
    if (rising_edge(clk_in)) then
      if(div_enable = '1') then
        if(div_cnt < divider - 1) then
          div_cnt <= div_cnt + 1;
        else
          div_cnt <= (others => '0');
          div_clk_out_i <= not div_clk_out_i;
        end if;
      else
        div_cnt <= (others => '0');
      end if;
    end if;
  end process div_clk;   
  
  div_clk_out <=  '0'     when div_enable = '0' else
									clk_in 	when (divider = 0) 		else 
									div_clk_out_i;

end Behavioral;

