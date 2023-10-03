Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515657BF103
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 04:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Ksr17Sjz3c3g
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 13:41:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0BV26D8nz3c56
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Oct 2023 19:55:06 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367874813"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367874813"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780231481"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="780231481"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:54:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andy@kernel.org>)
	id 1qnbB9-00000002REe-3gas;
	Tue, 03 Oct 2023 11:54:55 +0300
Date: Tue, 3 Oct 2023 11:54:55 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: aspeed: fix the GPIO number passed to
 pinctrl_gpio_set_config()
Message-ID: <ZRvW31qf/cbd5fYT@smile.fi.intel.com>
References: <20231003073926.10771-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003073926.10771-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 10 Oct 2023 13:41:16 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 09:39:26AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> pinctrl_gpio_set_config() expects the GPIO number from the global GPIO
> numberspace, not the controller-relative offset, which needs to be added
> to the chip base.

Right, because it has no clue what chip this offset is related to.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


