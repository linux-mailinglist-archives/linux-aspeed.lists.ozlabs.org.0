Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04269A573
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 07:02:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ1S63k8fz3f43
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 17:02:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ1S33VNYz3cCF
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 17:02:27 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 11BDD826D;
	Fri, 17 Feb 2023 06:02:26 +0000 (UTC)
Date: Fri, 17 Feb 2023 08:02:24 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/17] Mass convert GPIO IRQ chips to be immutable
Message-ID: <Y+8YcCLs+HoeBEz7@atomide.com>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Arnd Bergmann <arnd@arndb.de>, Jay Fang <f.fangjian@huawei.com>, linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@intel.com>, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Linus Walleij <linus.walleij@linaro.org> [230216 09:37]:
> Please test if you have the hardware. The OMAP patch especially,
> hi Tony ;)

Looking good so far, will do some more testing today.

Thanks,

Tony
