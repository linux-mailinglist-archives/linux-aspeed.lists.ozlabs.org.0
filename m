Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E0BE593
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2019 21:22:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dny45kfQzDqkm
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2019 05:22:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dnxw548pzDqZB
 for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2019 05:22:28 +1000 (AEST)
X-AuditID: ac10606f-35bff7000000187d-ce-5d8bbe713dbc
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 3A.7C.06269.17EBB8D5; Wed, 25 Sep 2019 15:22:25 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:22:24 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>, Joel Stanley
 <joel@jms.id.au>
Subject: [v2, 0/2] gpio: dts: aspeed: Add SGPIO driver 
Date: Wed, 25 Sep 2019 15:22:15 -0400
Message-ID: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWyRiBhgm7hvu5YgwX7rCzmrF/DZrHrMofF
 /w+7GS2+75/FavF30jF2i6ZDp9gsvsw9xWIx/8g5Vovf5/8yW0z5s5zJYtPja6wWzavPMVts
 nv+H0eLyrjlsFoem7mW0WHr9IpPF+0+dTBate4+wW9yY0sBmsffeZ0YHEY+r7bvYPdbMW8Po
 cfnaRWaP378mMXq8v9HK7nHx4zFmj02rOtk87lzbw+ZxYsZvFo8Jiw4wemxeUu9xfsZCRo+/
 jV/ZPU5M/87i8XmTXAB/FJdNSmpOZllqkb5dAlfGnI897AUP2Srun5nI1MA4h7WLkZNDQsBE
 4tnDzywgtpDALiaJlsnWEPZhRomfPYUgNpuAmsTezXOYuhi5OEQE+hklFsyZC+YwC2xlldh+
 oAlskrCAucT0a/eZQWwWAVWJ7TPPsYPYvAIOEleW32OG2CYncfNcJzNEXFDi5MwnYJuZBSQk
 Dr54wQyxWVbi1qHHTBD1ChLP+x6zTGDkm4WkZRaSlgWMTKsYhRJLcnITM3PSy430EnMz9ZLz
 czcxQmIvfwfjx4/mhxiZOBgPMUpwMCuJ8M6S6YoV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtq
 zbcYIYH0xJLU7NTUgtQimCwTB6dUA6M3E5Ppn1OZtVOCM+7m7ZD7vVx6d3/6RYbl7wX+rpmk
 UuuYvZ+3S49b707Cmd8r+6/Jisq5Rrqrn2XbGF4r+rlR1KnnSuf8orNTp02sEZ7xdXPAj3q+
 H8IpaY+FHH7WnF3nPlNyZqq7H49fwrStmzg3K+t2Xcua8kDEOY7JqKlMMvb/tM98T5RYijMS
 DbWYi4oTAb5SBiarAgAA
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

Hello,

This short series introduce the Kconfig, Makefile, and dts for the 
Aspeed AST2500 SGPIO controller. This is the last patch set.
Please review.

[v2]:	changes between v1 and v2:
	- split the patches based on review feedback.

[v1]:	Initial commit

The related SGPIO driver has been accepted and merged into v5.4:
_http://patchwork.ozlabs.org/patch/1150357/

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Thanks!
Hongwei Zhang (1):
  gpio: dts: aspeed: Add SGPIO driver

 arch/arm/Kconfig                 |  2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi | 16 +++++++++++++++-
 drivers/gpio/Kconfig             |  8 ++++++++
 drivers/gpio/Makefile            |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.7.4

