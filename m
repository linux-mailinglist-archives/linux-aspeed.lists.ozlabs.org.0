Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB65C0901
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2019 17:56:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fxH905HgzDr0d
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Sep 2019 01:56:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fxGx4H8DzDqyS
 for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Sep 2019 01:56:06 +1000 (AEST)
X-AuditID: ac1060b2-7a7ff700000017bd-67-5d8e310ed195
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 D0.07.06077.E013E8D5; Fri, 27 Sep 2019 11:55:58 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Sep 2019 11:56:01 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>, Joel Stanley
 <joel@jms.id.au>
Subject: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date: Fri, 27 Sep 2019 11:55:48 -0400
Message-ID: <1569599748-31181-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
References: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWyRiBhgi6fYV+sQfcOE4s569ewWey6zGHx
 /8NuRovv+2exWvyddIzdounQKTaLL3NPsVjMP3KO1eL3+b/MFlP+LGey2PT4GqtF8+pzzBab
 5/9htLi8aw6bxaGpexktll6/yGTx/lMnk0Xr3iPsFjemNLBZ7L33mdFBxONq+y52jzXz1jB6
 XL52kdnj969JjB7vb7Sye1z8eIzZY9OqTjaPO9f2sHmcmPGbxWPCogOMHpuX1Hucn7GQ0eNv
 41d2jxPTv7N4fN4kF8AfxWWTkpqTWZZapG+XwJXx8YNzwQrmir0fP7I1MJ5i6mLk5JAQMJE4
 fKWFGcQWEtjFJPG2waGLkQvIPswo8ax7ERtIgk1ATWLv5jlMIAkRgX5Gies7mthAHGaBrawS
 2w80sYJUCQuYSSydMY29i5GDg0VAVeLGznCQMK+Ag0RT63c2iG1yEjfPdYJt4xRwlNjWsJMJ
 YrODxLtHLawQ9YISJ2c+YQGxmQUkJA6+eAF1nazErUOPoa5WkHje95hlAqPALCQts5C0LGBk
 WsUolFiSk5uYmZNebqiXmJupl5yfu4kREqmbdjC2XDQ/xMjEwXiIUYKDWUmE1zeyJ1aINyWx
 siq1KD++qDQntfgQozQHi5I478o132KEBNITS1KzU1MLUotgskwcnFINjCs/Buk+L37G2a/y
 ZvfFi6uVZnSJd3IVin/leb1R6JVMmqL4Is/UmgfObbbfsuN/qZ3e/bu8z23dnbI1zZt91RyV
 zTr1g6W1WEpeZIh2uN/pMow84L2YN9jWTUquIPRUzh2jyxrnBPedfFecmCbFF8y/RKD6l0Fx
 y7TiNzoB9ivecGxu0lugxFKckWioxVxUnAgAf+/1tsICAAA=
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

Thanks Linus,

> 
> I sent a separate patch to fix this up the way I want it with the file named gpio-aspeed-sgpio.c and 
> CONFIG_GPIO_ASPEED_SGPIO.
> 
> I don't want to mix up the namespaces of something Aspeed-generic with the namespace of the GPIO 
> subsystem. SGPIO is the name of a specific Aspeed component.
> 
> Yours,
> Linus Walleij

I agree and gpio-aspeed-sgpio.c is better.

Regards,
--Hongwei
