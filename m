Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C09909F9B
	for <lists+linux-aspeed@lfdr.de>; Sun, 16 Jun 2024 22:04:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yq2vFMtD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2PB94wtGz3bt2
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2024 06:04:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yq2vFMtD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2PB301NYz30Ts
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jun 2024 06:04:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718568284; x=1750104284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QWRC2D1H2zURtP0smss7txlGTYwCW8TFD++F2R+yQuw=;
  b=Yq2vFMtDn3YTdwbNmU2ILnSufi0MANi4G5Uf0fyUWiZcIRfOIyi02Ipv
   tO2CERlsmiemK5u0DDpjnUb3Opf7eTId1P0N/rR9nYPoEJ7PX9garAxgw
   C+5YDO8nBemVfj92cU5JXmOpIP1TcJb7cZsFJWDNaBzQoLnYCmyqLCcMJ
   v6fu8/WRW4kTM1Q/U1+zBLu5AnB9zOfEK5Re+kincRKryCw+7HQm9EelE
   yGi6g9tOzRsqnIIvgdZBze/bAhn6Ht5IrKnQsaU6+LxpsWj/whfLxdImf
   Zk6bSruKSqgKtHbf+PzyYxOJCUs1oMNiRlj/rpvfI3G81FgfvLnBmfFOa
   g==;
X-CSE-ConnectionGUID: gYLLbrNyRB2oOEWOWjnuXg==
X-CSE-MsgGUID: R4yFwut2Sbm1kqJUE/4U4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26511257"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26511257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 13:04:38 -0700
X-CSE-ConnectionGUID: FSbR0r2qRVu6njUTKVBMEw==
X-CSE-MsgGUID: 4aaZq+W0Sdy2/n9jqsyfUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="40943438"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 13:04:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIw77-0003EI-0K;
	Sun, 16 Jun 2024 20:04:33 +0000
Date: Mon, 17 Jun 2024 04:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/7] ARM: dts: aspeed: Harma: add VR device
Message-ID: <202406170350.zQo7bJdX-lkp@intel.com>
References: <20240613152425.1582059-3-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613152425.1582059-3-peteryin.openbmc@gmail.com>
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Yin/ARM-dts-aspeed-Harma-revise-hsc-chip/20240613-232915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240613152425.1582059-3-peteryin.openbmc%40gmail.com
patch subject: [PATCH v1 2/7] ARM: dts: aspeed: Harma: add VR device
config: arm-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240617/202406170350.zQo7bJdX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170350.zQo7bJdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170350.zQo7bJdX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts:409.21-412.6: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@700/i2c-mux@70/i2c@0/power-monitor@63: I2C bus unit address format error, expected "61"
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:655.36-659.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /: spi-gpio: {'status': ['okay'], 'compatible': ['spi-gpio'], '#address-cells': [[1]], '#size-cells': [[0]], 'gpio-sck': [[58, 203, 0]], 'gpio-mosi': [[58, 204, 0]], 'gpio-miso': [[58, 205, 0]], 'num-chipselects': [[1]], 'cs-gpios': [[58, 200, 1]], 'tpmdev@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-frequency': [[33000000]], 'reg': [[0]]}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78d000: pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78f000: pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/pwm@5e: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/pwm@5e: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/power-monitor@69: failed to match any schema with compatible: ['pmbus']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@700/i2c-mux@70/i2c@0/power-monitor@61: failed to match any schema with compatible: ['isil,isl69260']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@700/i2c-mux@70/i2c@0/power-monitor@62: failed to match any schema with compatible: ['isil,isl69260']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@700/i2c-mux@70/i2c@0/power-monitor@63: failed to match any schema with compatible: ['isil,isl69260']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/ipmb@10: failed to match any schema with compatible: ['ipmb-dev']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: spi-gpio: $nodename:0: 'spi-gpio' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#

vim +/61 +409 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

   387	
   388	&i2c13 {
   389		status = "okay";
   390	
   391		i2c-mux@70 {
   392			compatible = "nxp,pca9545";
   393			reg = <0x70>;
   394			#address-cells = <1>;
   395			#size-cells = <0>;
   396	
   397			imux28: i2c@0 {
   398				#address-cells = <1>;
   399				#size-cells = <0>;
   400				reg = <0>;
   401				power-monitor@61 {
   402					compatible = "isil,isl69260";
   403					reg = <0x61>;
   404				};
   405				power-monitor@62 {
   406					compatible = "isil,isl69260";
   407					reg = <0x62>;
   408				};
 > 409				power-monitor@63 {
   410					compatible = "isil,isl69260";
   411					reg = <0x61>;
   412				};
   413				power-monitor@64 {
   414					compatible = "infineon,xdpe152c4";
   415					reg = <0x64>;
   416				};
   417				power-monitor@66 {
   418					compatible = "infineon,xdpe152c4";
   419					reg = <0x66>;
   420				};
   421				power-monitor@68 {
   422					compatible = "infineon,xdpe152c4";
   423					reg = <0x68>;
   424				};
   425			};
   426			imux29: i2c@1 {
   427				#address-cells = <1>;
   428				#size-cells = <0>;
   429				reg = <1>;
   430				//MB FRU
   431				eeprom@54 {
   432					compatible = "atmel,24c64";
   433					reg = <0x54>;
   434				};
   435			};
   436			imux30: i2c@2 {
   437				#address-cells = <1>;
   438				#size-cells = <0>;
   439				reg = <2>;
   440			};
   441			imux31: i2c@3 {
   442				#address-cells = <1>;
   443				#size-cells = <0>;
   444				reg = <3>;
   445			};
   446		};
   447	};
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
