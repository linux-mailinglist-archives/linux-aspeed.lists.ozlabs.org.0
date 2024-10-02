Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7614A98DC02
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 16:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJcny3Glpz2yZ4
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 00:36:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727879812;
	cv=none; b=fyC3OtlMYpfqCzaCftWFL7+PIFmZkyTueTQs6xppXW5xraSBRTqGi+KgxTFppasDi3qCD7+2nkjxtacC57+Ht8szbqs8Hh4kq1PzXq6jHJIPe31PcarFppXtFG2+fd3JQOVybbKdphWJVBsDfq/6+OQQ+dLMG5t+l8CGjYxfhANoujam1Eh71nNrHAPcFj7SPOKJR0XXC3pIYHZThRhp2HNrVnK2jY3MKFIURzFY9YbHfMBNcxYjcNx6/nDl5K+rDyM6HjPWirGMjO4KLju9VU6MwgIyvIhzkKElASEK5USGMOTWv0oHI6/RUcw6VLf/91HN7Olc97nDLOfv66PlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727879812; c=relaxed/relaxed;
	bh=vzmnonUYYNTjfRnTO717pspGElvMrH83A8Nt//JrkIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyQsnzJRUEtoRX9IzTP5cMR+jwh46W/jDble8C63cZVAHZ8M+M++r4534EvTC+MF3lRM3nsJnCKC8tnUfkFhyeRX3PJexi7ASzrZnG1CfNRv4Yy06yS1XzkSCaDwSjCgQwKI253Nd5PKcC1i1Mo8ja0fN3gMVs1uPFKqX5Wfrs9Xujm8zXEZ9DWE38vljbBgDlSxTaWUNcwSyeU+V8EI49C//+i3kgECtaGjyB9xW+kHG4tFXdomEyCWd0tgHXLNh794QyvBKIh9x8XnLERLr1vfBBlzTRShY6QtTwEnXpzy3n5mlChdcyZi7E9dWe6LpmjoM+uSCgOb+kw+jzgRYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6QMP6f/; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6QMP6f/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 03 Oct 2024 00:36:52 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJcnw1rGVz2yVF
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 00:36:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727879813; x=1759415813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reX/HEz8p8JLCDKEMNA3o/Kp5RQsQN6emEVJh9u5XcE=;
  b=O6QMP6f/coqQalGgHoiEJjcw3TShUs/25Z/DHt24GSWGZ2C/gdLYXskg
   GyCfOZbx+P2hvxs7dQEbReE+kZwMy1B5saWs9MHMId9xN9CA+pHMHItxA
   wuNgyTgDS1Nnc26cI6wPD1c5Ph9pRUzC1PfpVcbBu1QgLCCDq7rMKHVkb
   8EE0D9NSIOE/vxRTzPM0TqjHz7l79qkNqNMLnss8fSTQxTSUXGNacQ/oL
   T6RHCDSdR0cqtKB0D8qJoVnWTbsfOrJcvwZ6pT6N89dnbHM0lYb/BKLZP
   4yQuU+w8V03kZ0dWrrw/BKe+X2kTvBt+bpPxr2ny9x24Ic4FxbF/TC/Vf
   Q==;
X-CSE-ConnectionGUID: sSFEjqC8SWKMfkEXlP41sA==
X-CSE-MsgGUID: 00jsCKpQR4mmeYgOVdlvNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38179590"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="38179590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:44 -0700
X-CSE-ConnectionGUID: +Yds6v1JQI6HXv66faUHeQ==
X-CSE-MsgGUID: AkbSVDKJSyaGbdwMNNJS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74262436"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sw0S1-0000000FhjB-1sj4;
	Wed, 02 Oct 2024 17:35:37 +0300
Date: Wed, 2 Oct 2024 17:35:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
> is new register set that have new clock divider option for more
> flexiable generation. And also have separate i2c master and slave register
> set for control, patch #2 is i2c master driver only, patch #3 is add
> i2c slave mode driver.
> 
> The legacy register layout is mix master/slave register control together.
> The following is add more detail description about new register layout.
> And new feature set add for register.
> 
> -Add new clock divider option for more flexible and accurate clock rate
> generation -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each
> device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating master and slave mode control.
> -Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.
> 
> And following is new register set for package transfer sequence.
> -New Master operation mode:
>  S -> Aw -> P
>  S -> Aw -> TxD -> P
>  S -> Ar -> RxD -> P
>  S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
> -Bus SDA lock auto-release capability for new master DMA command mode.
> -Bus auto timeout for new master/slave DMA mode.
> 
> The following is two versus register layout.
> Old:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
> 
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status
> 
> aspeed,global-regs:
> This global register is needed, global register is setting for
> new clock divide control, and new register set control.
> 
> ASPEED SOC chip is server product, i2c bus may have fingerprint
> connect to another board. And also support hotplug.
> The following is board-specific design example.
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> i2c-scl-clk-low-timeout-us:
> For example I2C controller as slave mode, and suddenly disconnected.
> Slave state machine will keep waiting for master clock in for rx/tx
> transmit. So it need timeout setting to enable timeout unlock controller
> state. And in another side. In Master side also need avoid suddenly
> slave miss(un-plug), Master will timeout and release the SDA/SCL.
> 
> aspeed,enable-dma:
> For example The bus#1 have trunk data needed for transfer,
> it can enable bus dma mode transfer, it can reduce cpu utilized.
> Others bus bus#2/3 use defautl buffer mode.

Is it possible to switch to new terminology wherever it's possible?
I.e. master --> controller, slave --> target. See, for example,
f872d28500bd ("i2c: uniphier-f: reword according to newest specification").

-- 
With Best Regards,
Andy Shevchenko


