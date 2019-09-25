Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FCBE589
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2019 21:21:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dnwK3hfbzDqkh
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2019 05:21:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dnw80BVtzDqZB
 for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2019 05:20:54 +1000 (AEST)
X-AuditID: ac1060b2-791ff700000017bd-b6-5d8bbe11adce
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 03.CA.06077.11EBB8D5; Wed, 25 Sep 2019 15:20:50 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:20:50 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>, Joel Stanley
 <joel@jms.id.au>
Subject: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 15:20:48 -0400
Message-ID: <1569439248-10430-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsWyRiBhgq7Qvu5YgxkrmS3mrF/DZrHrMofF
 /w+7GS2+75/FavF30jF2i6ZDp9gsvsw9xWIx/8g5Vovf5/8yW0z5s5zJYtPja6wWzavPMVts
 nv+H0eLyrjlsFoem7mW0WHr9IpPF+0+dTBate4+wW9yY0sBmsffeZ0YHEY+r7bvYPdbMW8Po
 cfnaRWaP378mMXq8v9HK7nHx4zFmj02rOtk87lzbw+ZxYsZvFo8Jiw4wemxeUu9xfsZCRo+/
 jV/ZPU5M/87i8XmTXAB/FJdNSmpOZllqkb5dAldGb08rU8EL1orpswsaGM+wdDFyckgImEjs
 uXedqYuRi0NIYBeTxKkN0xkhnMOMEqc+fmUFqWITUJPYu3kOWJWIQD+jxPUdTWwgDrPAVlaJ
 7QeawKqEBcwkOqfOBbNZBFQlLrXfZQSxeQUcJG5dbmaE2CcncfNcJzOIzQkUv7z4A9gdQgL2
 EqsXnISqF5Q4OfMJWJxZQELi4IsXzBA1shK3Dj1mgpijIPG87zHLBEaBWUhaZiFpWcDItIpR
 KLEkJzcxMye93FAvMTdTLzk/dxMjJFo37WBsuWh+iJGJg/EQowQHs5II7yyZrlgh3pTEyqrU
 ovz4otKc1OJDjNIcLErivCvXfIsREkhPLEnNTk0tSC2CyTJxcEo1MC59Wrj1TlnSxR5PR4H0
 jeeUD7zzczCc/kL2xue9d7R7f7pOyVwYqm9ey7tkh4rj86+yooqnb8Z8ioxWaJF7bLugZ+Xh
 v1vPBx1qXLn81RLrsrVN9W+uN5exZZw/9OSA1hc/uxmMr94sfbFQ5ew2f93uCpXSro3Grz3Z
 ms9/vW73wuz4b2frVdeVWIozEg21mIuKEwFFarKcxAIAAA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Hongwei Zhang <hongweiz@ami.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> 
> > The related SGPIO driver has been accepted and merged into v5.4:
> > _http://patchwork.ozlabs.org/patch/1150357/
> 
> Oh what a mess, it didn't add the necessary code into Kconfig and Makefile, also names it sgpio-gpio.c 
> when everything else is named gpio-sgpio.c.
> 
> I guess I have to fix it up. My fault for missing.
> 
> Linus Walleij

Thanks Linus,

It's not your fault, I misunderstood a earlier comment from another 
reviewer and thought I should wait until the driver is accecpted, 
and then submit the patch to include / enable it.

As Bart suggested, I splitte the patches. 

Regarding the driver name, following the gpio-SoC_name.o convention 
in the Makefile, we choose sgpio-aspeed.o .

--Hongwei
