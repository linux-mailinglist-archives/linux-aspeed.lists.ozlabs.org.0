Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA496A415
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2024 18:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyrRY559Mz2yQJ
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2024 02:19:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725380359;
	cv=none; b=VeKut1tY3ASzTaB7n28jcr6sBqY0G/DqXyJMhVuXf/LAwL8USkjQZNBWYBCt7d47a/FuAiCzDBcZbNb6M793LOWDS7lPBTO5hvB/7ArKjzwV06z9tXwEoGNjG39QGwm4tjlCIzmohHxAGy83GAdd8DEYrAkAJd/Dgk171BTXwxiXCAXdw32pNLQ2rkpJN2cDg7EaqgkHx8evYenD7PhldrcH4t78x42EXcXeEHi8sz9784ZfNhhK4eerAcTmpkOAX1pw+phZJDbf5vjrK6PMSLXSXL/F/lHhv+vViFXD9eE0FYrzw8JkUKD78nY1OB3E2ZS8aD7hiieJPKEMU28exA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725380359; c=relaxed/relaxed;
	bh=j7XUYA/UJAajX40zzsZ4uk8BCoABIzB1srP33RuZ8ss=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=gXqQthOWgPPLa7CNQkssMikyy7PlpvCqtGm6gIV8bBdCWxoNuBObgZNQ9L/jEzG74ukkU8wZaXc5beKj8EEt0HVUa5UeZOsWlktjW4mBvAdiPXrtrwtCIVe9RDhuX96IeN4Ea0+J5E36HMzvUY9w1M3ezIjLzGNwouBlffIpaI+CmLrGWxZ8fxN2ISifjhOUD6LgWA/oB/ZdhzMa7AQaZ4f2KjRj8UJ4H2PxRmv4NNyPnBnKjx5RLkdubNxq1yRfNeJTYoE/DSy1b7P1g8g/HGUzp+xZvTucrv+5u1pPaLV0d8bDeXUgvwP7SWJdQRzjijKpnzD+2IEM6QQGvElhmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZZwjX2dc; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZZwjX2dc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyrRS38Fsz2xyG
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2024 02:19:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725380356; x=1756916356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7PP+0mnwl58stNlb1VVDx5bSn5dAYK88Hlv7Mydk/j0=;
  b=ZZwjX2dcH15b1yccBUdX4LYBp7npDKE753VmuQBMXzKIQhxuW84Z3mUA
   cUJ/le34Sv1ydBk6HoPkvHGHYh0Eaj8c3FGXrCyZH5qJUiJ75A993haUu
   ywWs4DCPdpQcqSniN3c58b9hx5UbXWxvkFCOKUYhf2NDuzO3shjGJy2bZ
   FKTBAyZHAA096f7ymyFZFX0bF+cR45aGqHmiRl/Kwd0P/ISzs4LmYOoTC
   c8XrgG7EQdWXT1gRkxpCm8P/oYEScd0xskCmgciSP8OdUp3dZJJvvpViV
   Mpwuh5/vDj7BBatYc6fPO5rXQUGzY/cpa/j/dV3H+Ugkvaw9eTSAdoZbc
   Q==;
X-CSE-ConnectionGUID: NA0OYZQLRYio4ALkAuKVPQ==
X-CSE-MsgGUID: OB3p2wVmR/WJIkMxD9McWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13350174"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="13350174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:19:11 -0700
X-CSE-ConnectionGUID: MuLc0WaHS0CsYw5dJZPt8A==
X-CSE-MsgGUID: cudFreshTlCFr9WA3XMQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="95700617"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:19:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slWFF-00000004laX-0mjJ;
	Tue, 03 Sep 2024 19:19:05 +0300
Date: Tue, 3 Sep 2024 19:19:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH -next] serial: 8250_aspeed_vuart: Enable module
 autoloading
Message-ID: <Ztc2-OuaL2IJI6QW@smile.fi.intel.com>
References: <20240903131503.961178-1-liaochen4@huawei.com>
 <4nyenalsjnerwjwcuk5zwm52rptnc5jhjhz3yhsmo7qt3gffhs@qadnsjic7p24>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4nyenalsjnerwjwcuk5zwm52rptnc5jhjhz3yhsmo7qt3gffhs@qadnsjic7p24>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: andi.shyti@linux.intel.com, linux-aspeed@lists.ozlabs.org, florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Liao Chen <liaochen4@huawei.com>, tglx@linutronix.de, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2024 at 05:49:54PM +0200, Uwe Kleine-König wrote:
> On Tue, Sep 03, 2024 at 01:15:03PM +0000, Liao Chen wrote:

...

> I wonder if you found this entry missing by code review, or if you have
> a machine with that UART and so you actually benefit.

Using arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts in QEMU
I never experienced an issue. Seems due to defconfig having it =y.
(used arch/arm/configs/aspeed_g5_defconfig)

> Otherwise looks right to me.
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

-- 
With Best Regards,
Andy Shevchenko


