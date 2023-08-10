Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB67771ED
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 09:54:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qned/ZvM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLzj24by0z3c2f
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 17:54:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qned/ZvM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLzhs4z7tz2xpx
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 17:54:21 +1000 (AEST)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 5C0DCCCA34
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 07:48:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C9321BF207;
	Thu, 10 Aug 2023 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691653685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97+K3wphXtML7cmc5tSJB1Ii6h2VIWFAIql1oZyFt48=;
	b=Qned/ZvMVctiJ8e4SYsUxxjJ/nY+6j8g1yqZz8vNPZSY7H4sR2JbiOlflwZcuv3qBjnEuz
	A7W3tGHtpOZe/dVutYPcdYkMikpRjzZ++SP8CMLTANFbNZLimkwvQjTWIBcus1pT2nXiAQ
	LRtnGSSkqSip9J06HiA1+hsTkUm2ELfhR9Rps2QKE4lNXodTA0lmkmgkAp5PGolyDdL81g
	BNRQeXnD8NucdcjSKLFDRzr8N/8944Iaa6/UCr3iF8/Q9SjkR9n/X73+EYXTAF5z2h5x6d
	3WwjMAsVJOTNy6xcqXK6AuFGfuHDoL1rB25i5FUy33c1n/3exRMJkVarkx25Bg==
Date: Thu, 10 Aug 2023 09:48:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, a.zummo@towertech.it,
	joel@jms.id.au, andrew@aj.id.au, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next 0/5] rtc: remove redundant of_match_ptr()
Message-ID: <169165359721.972357.2241425230708767028.b4-ty@bootlin.com>
References: <20230808115213.154377-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808115213.154377-1-wangzhu9@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 08 Aug 2023 19:52:08 +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here. We remove of_match_ptr().
> 
> Zhu Wang (5):
>   rtc: aspeed: remove redundant of_match_ptr()
>   rtc: at91sam9: remove redundant of_match_ptr()
>   rtc: nct3018y: remove redundant of_match_ptr()
>   rtc: armada38x: remove redundant of_match_ptr()
>   rtc: at91rm9200: remove redundant of_match_ptr()
> 
> [...]

Applied, thanks!

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
