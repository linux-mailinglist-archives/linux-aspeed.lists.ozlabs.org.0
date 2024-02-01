Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CAC8456D4
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 13:05:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fWXW84MS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQczN70SNz3bsd
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 23:05:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fWXW84MS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQczH5ZZfz3cRy
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 23:04:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706789100; x=1738325100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmMQXeLGQdDe0lD1nXkW7jz/UDWrlhubI0Aip/rEHN4=;
  b=fWXW84MS4M0fuuTL4GcycXsicf/vJ3fQXW7s/IliVGWjob9sRgOCtvhO
   AbWwj40U0HiljmtyXBf/hYENuzGtbpdEoenCYXwjJVuY+E3Cn1mqR9PGi
   AsRHeCu0QvNRyCg2594pKVKvZROv1AoX9txn4H+H4MexnGYmhwWdYjmuP
   oE4PxEzgPlxJcHCtmsZbl167oZ+OCOgROggmEik1de4eMD5Pc+ej5KSro
   kbOlrYofKWqwGZtaWD3cfpqSrDaiSUVvPESsOUPmVlY0w6I7bediRS31C
   L/OAqdpcsjP7pCpSOGf2J8c4CiawOV6v7c8ZJDAArOPJZsbhbD7qj9ehn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="60243"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="60243"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788919040"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="788919040"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:03:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVIh-00000000onx-0xJW;
	Thu, 01 Feb 2024 13:32:11 +0200
Date: Thu, 1 Feb 2024 13:32:10 +0200
From: "'andriy.shevchenko@linux.intel.com'" <andriy.shevchenko@linux.intel.com>
To: "Corona, Ernesto" <ernesto.corona@intel.com>
Subject: Re: [PATCH 30 7/7] Add AST2500 and AST2600 JTAG device in DTS
Message-ID: <ZbuBOmtyYdlmnCBa@smile.fi.intel.com>
References: <LV8PR11MB8463F88C2364A08DEF3ABAC28B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV8PR11MB8463F88C2364A08DEF3ABAC28B7D2@LV8PR11MB8463.namprd11.prod.outlook.com>
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
Cc: "'robh@kernel.org'" <robh@kernel.org>, "Filary, Steven A" <steven.a.filary@intel.com>, "'arnd@arndb.de'" <arnd@arndb.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>, "'vadimp@mellanox.com'" <vadimp@mellanox.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "'nicolas.ferre@microchip.com'" <nicolas.ferre@microchip.com>, "'lukas.bulwahn@gmail.com'" <lukas.bulwahn@gmail.com>, "'omar.eduardo.castro@linux.intel.com'" <omar.eduardo.castro@linux.intel.com>, "'jiri@nvidia.com'" <jiri@nvidia.com>, "'mchehab+samsung@kernel.org'" <mchehab+samsung@kernel.org>, "Castro, Omar Eduardo" <omar.eduardo.castro@intel.com>, "'patrickw3@fb.com'" <patrickw3@fb.com>, "'davem@davemloft.net'" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Chen, Luke" <luke_chen@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 11:32:48PM +0000, Corona, Ernesto wrote:
> Adding aspeed jtag device to device tree
> 
> Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
> Signed-off-by: Omar Castro <omar.eduardo.castro@linux.intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

First of all, please use --thread to git-format-patch when preparing the
series.

> Cc: Jiri Pirko <jiri@nvidia.com>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: Steven Filary <steven.a.filary@intel.com>
> Cc: Amithash Prasad <amithash@fb.com>
> Cc: Patrick Williams <patrickw3@fb.com>
> Cc: Luke Chen <luke_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>

Second, please avoid flooding commit message with unneeded details, i.e. move
these Cc:s to...

> ---
...the after this cutter line.

-- 
With Best Regards,
Andy Shevchenko


